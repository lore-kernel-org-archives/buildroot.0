From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Apr 2017 23:33:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpng: Cleanup neon support options
Message-ID: <20170420213302.31155-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/189086.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpng/libpng.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 249115702..4272f4e38 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -14,7 +14,12 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
-LIBPNG_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+LIBPNG_CONF_OPTS += --enable-arm-neon=yes
+else
+LIBPNG_CONF_OPTS += --disable-arm-neon
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
