From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Jul 2014 21:19:15 +0200
Subject: [Buildroot] [PATCH v14 20/20] xbmc: Add VA-API support
In-Reply-To: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405451955-10204-21-git-send-email-bernd.kuhls@t-online.de>
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
index 3637db7..c0447c9 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -52,7 +52,6 @@ XBMC_CONF_OPT +=  \
 	--disable-projectm \
 	--disable-pulse \
 	--disable-ssh \
-	--disable-vaapi \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -112,6 +111,14 @@ XBMC_CONF_OPT += --disable-gles
 endif
 endif
 
+# xbmc needs libva & libva-glx
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+XBMC_DEPENDENCIES += mesa3d libva
+XBMC_CONF_OPT += --enable-vaapi
+else
+XBMC_CONF_OPT += --disable-vaapi
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
