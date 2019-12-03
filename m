From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 10:53:25 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/redis: bump to
 version 5.0.7
Message-ID: <20191203094602.4527D83BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a45830441f79fa6ecfb4cab2112fc14cd48edefb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Changes announced upstream:

Upgrade urgency HIGH: many issues fixed, some may have an impact.
Redis 5.0.7 fixes a number of bugs, none is very critical, however
there are a few that may have an impact. It's a good idea to upgrade.
There are fixes in the area of replication from modules commands and
callbacks, AOF fsync (non critical issue), memory leaks (very rare and small),
streams beahvior (non critical), and a potential crash in commands
processing multiple keys at the same time that is there for years, and happens
very rarely, but is not impossible to trigger.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dfcb5fc9c93bd94c96b432eb49e5099d858a6648)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index aca1109d30..ac68e62814 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 6624841267e142c5d5d5be292d705f8fb6070677687c5aad1645421a936d22b3  redis-5.0.6.tar.gz
+sha256 61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b  redis-5.0.7.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 4ed90a749e..1729afe165 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.6
+REDIS_VERSION = 5.0.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
