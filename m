From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Jul 2014 21:19:10 +0200
Subject: [Buildroot] [PATCH v14 15/20] xbmc: Add alsa support
In-Reply-To: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405451955-10204-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index f67f8e4..0c45d7d 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -39,7 +39,6 @@ XBMC_CONF_ENV = \
 
 XBMC_CONF_OPT +=  \
 	--with-arch=$(BR2_ARCH) \
-	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
@@ -73,6 +72,13 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+XBMC_DEPENDENCIES += alsa-lib
+XBMC_CONF_OPT += --enable-alsa
+else
+XBMC_CONF_OPT += --disable-alsa
+endif
+
 XBMC_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
 	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
-- 
1.7.10.4
