From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 22:59:15 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/redis: bump
 version to 4.0.14
Message-ID: <20191122215315.A98A18F53B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa8296ac64675d50c549ebe196e0509ef666a29c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Brings additional fixes to the 4.x series. From the release notes:

https://raw.githubusercontent.com/antirez/redis/4.0/00-RELEASENOTES

================================================================================
Redis 4.0.14     Released Mon Mar 18 17:22:10 CEST 2019
================================================================================

This release just backports a few fixes from Redis 5:

3c62ad19 HyperLogLog: handle wrong offset in the base case.
cc2b3a68 Fix hyperloglog corruption
e10c79d3 redis-check-aof: fix potential overflow.
6fa16f58 Fix mismatching keyspace notification classes
64311052 Fix zlexrangespec mem-leak in genericZrangebylexCommand
b0e86319 Make comment in #5911 stay inside 80 cols.
39ccce03 Replicas aren't allowed to run the replicaof command

================================================================================
Redis 4.0.13     Released Wed Feb 20 17:25:31 CEST 2019
================================================================================

This release just backports a few fixes from Redis 5:

60b2537f rewrite BRPOPLPUSH as RPOPLPUSH to propagate
afc4b36c Don't treat unsupported protocols as fatal errors

================================================================================
Redis 4.0.12     Released Tue Dec 11 18:06:12 CEST 2018
================================================================================

This backports the following Redis 5 fixes back into Redis 4.
Please check the Redis 5 changelog or see the full commit messages
for more information. Note that there are important fixes to the AOF
implementation so Redis 4.0.12 should be considered as a worthwhile
upgrade in production environments where AOF is used and there is the
idea of sticking with Redis 4 for some time.

b6cd3b3c asyncCloseClientOnOutputBufferLimitReached(): don't free fake clients.
e16402b0 Don't call sdscmp() with shared.maxstring or shared.minstring
49d9f411 Fix stringmatchlen() read past buffer bug.
97192e2d Merge pull request #5569 from maximebedard/backport-4497
1908aba7 add linkClient(): adds the client and caches the list node.
239b0857 networking: optimize unlinkClient() in freeClient()
54b17f98 When replica kills a pending RDB save during SYNC, log it.
b31c08db Move child termination to readSyncBulkPayload
21971ac8 Prevent RDB autosave from overwriting full resync results
3a91fcbc aof.c: improve indentation and change warning message.
e6f287d5 AOF: discard if we lost EXEC when loading aof
e0d4c66a Fix AOF comment to report the current behavior.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 0b4e25c61d..59c16e12ea 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 fc53e73ae7586bcdacb4b63875d1ff04f68c5474c1ddeda78f00e5ae2eed1bbb  redis-4.0.11.tar.gz
+sha256 1e1e18420a86cfb285933123b04a82e1ebda20bfb0a289472745a087587e93a7  redis-4.0.14.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index da2307d693..783f2c5c44 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 4.0.11
+REDIS_VERSION = 4.0.14
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
