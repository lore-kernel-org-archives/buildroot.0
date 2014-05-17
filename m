From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 13:39:59 +0200
Subject: [Buildroot] [PATCH v7 24/31] xbmc: Add alsa support
In-Reply-To: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400326806-16428-25-git-send-email-bernd.kuhls@t-online.de>
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
index cb3db38..42388e8 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -27,7 +27,6 @@ XBMC_CONF_ENV = \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
-	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
@@ -95,6 +94,13 @@ else
 XBMC_CONF_OPT += --disable-gles
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+XBMC_DEPENDENCIES += alsa-lib
+XBMC_CONF_OPT += --enable-alsa
+else
+XBMC_CONF_OPT += --disable-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
