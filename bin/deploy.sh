#!/bin/sh
# Deploy command for Laravel Cloud: create/update the schema and seed the
# sample data the first time (when there are no users yet).
set -e

php bin/console doctrine:schema:update --force --no-interaction

if php bin/console dbal:run-sql "SELECT COUNT(*) FROM symfony_demo_user" | grep -qx ' *0 *'; then
    php bin/console doctrine:fixtures:load --no-interaction
fi
