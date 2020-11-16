From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:17:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/redis: security
 bump to version 5.0.10
Message-ID: <20201116211335.922A286696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd21b79f1fc87a81a216117ee2aa2e0c2d293c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This release fixes a potential heap overflow when using a heap allocator
other than jemalloc or glibc's malloc. See:
https://github.com/redis/redis/pull/7963

https://raw.githubusercontent.com/redis/redis/5.0/00-RELEASENOTES

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 7fd6f1b0df..73e28fac0d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85  redis-5.0.9.tar.gz
+sha256 e30a5e7d1593a715cdda2a82deb90190816d06c9d1dc1ef5b36874878c683382  redis-5.0.10.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index baef2e235f..5ab1d34fd2 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.9
+REDIS_VERSION = 5.0.10
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
