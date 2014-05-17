From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 17:57:50 +0200
Subject: [Buildroot] [PATCH v8 22/28] xbmc: Add VA-API support
In-Reply-To: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400342276-10303-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 7fdaafc..6718d46 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -40,7 +40,6 @@ XBMC_CONF_OPT +=  \
 	--disable-projectm \
 	--disable-pulse \
 	--disable-ssh \
-	--disable-vaapi \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -56,6 +55,14 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+# xbmc needs libva & libva-glx
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+XBMC_DEPENDENCIES += libva
+XBMC_CONF_OPT += --enable-vaapi
+else
+XBMC_CONF_OPT += --disable-vaapi
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 XBMC_DEPENDENCIES += \
 	libglew \
-- 
1.7.10.4
