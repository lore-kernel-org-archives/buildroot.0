From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:41:32 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] redis: security bump to
 version 3.2.12
Message-ID: <20180617155627.6091D826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9102f069d29264f5a4aebe8e5e087f13a045e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

From the release notes:

================================================================================
Redis 3.2.12     Released Wed Jun 13 12:43:01 CEST 2018
================================================================================

Upgrade urgency CRITICAL:

* Multilple security issues fixed.
* Backport of an older AOF fsync=always fix. Check 4.x release notes.
* Backport of a *SCAN bug. Sometimes elements could be missing from the scan.
* Other minor things.

https://raw.githubusercontent.com/antirez/redis/3.2/00-RELEASENOTES

For more details about the lua related security issues, see the blog:

http://antirez.com/news/119

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3bf2745a0f310f2d0b173cc30645bb8ecadaa0a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index ce2d66b8c2..d9a14cef6c 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 31ae927cab09f90c9ca5954aab7aeecc3bb4da6087d3d12ba0a929ceb54081b5  redis-3.2.11.tar.gz
+sha256 98c4254ae1be4e452aa7884245471501c9aa657993e0318d88f048093e7f88fd  redis-3.2.12.tar.gz
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 82969c9022..cbd2d7bdcb 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.2.11
+REDIS_VERSION = 3.2.12
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
