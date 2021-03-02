From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Mar 2021 09:34:22 +0100
Subject: [Buildroot] [git commit] package/redis: security bump to v6.0.12
Message-ID: <20210302081233.AB78D86ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbd5f7e3a9331286ddcbcf9d6d9788116bd3a8e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:
(https://github.com/redis/redis/blob/6.0.12/00-RELEASENOTES)

================================================================================
Redis 6.0.11     Released Mon Feb 22 16:13:23 IST 2021
================================================================================

Upgrade urgency: SECURITY if you use 32bit build of redis (see bellow), LOW
otherwise.

Integer overflow on 32-bit systems (CVE-2021-21309):
Redis 4.0 or newer uses a configurable limit for the maximum supported bulk
input size. By default, it is 512MB which is a safe value for all platforms.
If the limit is significantly increased, receiving a large request from a client
may trigger several integer overflow scenarios, which would result with buffer
overflow and heap corruption.

================================================================================
Redis 6.0.12     Released Mon Mar  1 17:29:52 IST 2021
================================================================================

Upgrade urgency: LOW, fixes a compilation issue.

Bug fixes:
* Fix compilation error on non-glibc systems if jemalloc is not used (#8533)

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index b72605013e..9b87b49fb1 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  79bbb894f9dceb33ca699ee3ca4a4e1228be7fb5547aeb2f99d921e86c1285bd  redis-6.0.10.tar.gz
+sha256  f16ad973d19f80f121e53794d5eb48a997e2c6a85b5be41bb3b66750cc17bf6b  redis-6.0.12.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 96132ae962..c851e589c4 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.10
+REDIS_VERSION = 6.0.12
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
