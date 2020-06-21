From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jun 2020 23:39:21 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to 5.0.9
Message-ID: <20200621213921.11923-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a critical issue related to streams. From the release notes:

================================================================================
Redis 5.0.9     Released Thu Apr 17 12:41:00 CET 2020
================================================================================

Upgrade urgency:CRITICAL if you use Streams with AOF ore replicas.
                Otherwise the upgrade urgency is LOW.

This release has a speed improvement and a critical fix:

    * FIX: XREADGROUP when fetching data in a blocking way, would not
           emit the XCLAIM in the AOF file and to replicas. This means
           that the last ID is not updated, and that restarting the server
           will have the effect of reprocessing some entries.
    * NEW: Clients blocked on the same key are now unblocked on
           O(1) time. Backported from Redis 6.

Commits:

    1fc8ef81a Fix XCLAIM propagation in AOF/replicas for blocking XREADGROUP.
    a5e24eabc Speedup: unblock clients on keys in O(1).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index ee15b75e08..7fd6f1b0df 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7  redis-5.0.8.tar.gz
+sha256 53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85  redis-5.0.9.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index d3954d87ca..baef2e235f 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.8
+REDIS_VERSION = 5.0.9
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.20.1
