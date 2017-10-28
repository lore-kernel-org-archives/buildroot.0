From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 19:05:11 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] redis: bump to version
	3.2.11
Message-ID: <20171028171232.2C45D801D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58ea6ad528a53b1b3f19efb441bbeb6451695b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

3.2.11 fixes important issues. From the release notes:

================================================================================
Redis 3.2.11     Released Thu Sep 21 15:47:53 CEST 2017
================================================================================

Upgrade urgency HIGH: Potentially critical bugs fixed.

AOF flush on SHUTDOWN did not cared to really write the AOF buffers
(not in the kernel but in the Redis process memory) to disk before exiting.
Calling SHUTDOWN during traffic resulted into not every operation to be
persisted on disk.

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 751cd4cfab88ff15143d13eccf87f982a274e4e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 4 +++-
 package/redis/redis.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 2eef91c..ce2d66b 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,2 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 6eaacfa983b287e440d0839ead20c2231749d5d6b78bbe0e0ffa3a890c59ff26  redis-3.2.9.tar.gz
+sha256 31ae927cab09f90c9ca5954aab7aeecc3bb4da6087d3d12ba0a929ceb54081b5  redis-3.2.11.tar.gz
+# Locally calculated
+sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 671ffac..d356b23 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.9
+REDIS_VERSION = 3.2.11
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
