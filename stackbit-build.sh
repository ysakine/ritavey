#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eaf17162e2f74001e5e2dfb/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eaf17162e2f74001e5e2dfb
curl -s -X POST https://api.stackbit.com/project/5eaf17162e2f74001e5e2dfb/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eaf17162e2f74001e5e2dfb/webhook/build/publish > /dev/null
