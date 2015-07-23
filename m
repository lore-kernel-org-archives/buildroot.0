From: Martin Bark <martin@barkynet.com>
Date: Thu, 23 Jul 2015 12:20:26 +0100
Subject: [Buildroot] [v2 1/4] package/redis: Add redis system user
Message-ID: <1437650429-13748-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a redis system user and set the home directory to /var/lib/redis

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - Set redis user shell to /bin/false (Suggested by Thomas Petazzoni)
 - Removed $(INSTALL) of /var/lib/redis (Suggested by Thomas Petazzoni)
---
 package/redis/redis.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
2.1.4
