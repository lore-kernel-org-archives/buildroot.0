From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] package/redis: Add redis
	system user
Message-ID: <20150808105640.D7DC67FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb1dae2da8f7488d0a8603793310a0ad58c4be1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a redis system user and set the home directory to /var/lib/redis

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/redis.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 51c1f9c..0135cf9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -9,6 +9,10 @@ REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
 
+define REDIS_USERS
+	redis -1 redis -1 * /var/lib/redis /bin/false - Redis Server
+endef
+
 # Redis doesn't support DESTDIR (yet, see
 # https://github.com/antirez/redis/pull/609).  We set PREFIX
 # instead.
