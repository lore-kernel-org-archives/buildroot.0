From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Jun 2020 08:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: remove ipv6 option
Message-ID: <20200611062505.642881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove --with-ipv6 as this option does nothing since version 1.11.5 and
https://github.com/nginx/nginx/commit/2c84f7af2c97a55bf138a5fcedeb164733dc9bea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/nginx.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 9bbb3fc201..0ceed7857f 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -14,8 +14,7 @@ NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
 	--with-cpp="$(TARGET_CC)" \
-	--with-ld-opt="$(TARGET_LDFLAGS)" \
-	--with-ipv6
+	--with-ld-opt="$(TARGET_LDFLAGS)"
 
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
-- 
2.26.2
