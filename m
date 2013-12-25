From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 10:26:15 +0100
Subject: [Buildroot] [git commit] redis: bump to version 2.6.17
Message-ID: <20131225092626.41AEA9C1BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=142a81d60533ef179300c44fd29aaefbfae62d3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes since 2.6.16:
* [FIX] redis-cli: fix big keys search when the key no longer exist.
* [FIX] Allow AUTH / PING when disconnected from slave with serve-stale-data on.
* [FIX] redis-benchmark: update help for new __rand_int__ form.
* [FIX] Fix broken rdbWriteRaw() return value check in rdb.c (harmless).
* [FIX] Log to what master a slave is going to connect to.
* [FIX] Only run the fast active expire cycle if master & enabled.
* [FIX] Fixed a replication bug involving 32 bit instances and big datasets
        hard to compress that resulted into more than 2GB of RDB file sent.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/redis.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 6974a35..c41469e 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 2.6.16
+REDIS_VERSION = 2.6.17
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
