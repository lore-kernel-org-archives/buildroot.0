From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 13:54:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/xbmc: add option to enable libva
Message-ID: <1410090876-18822-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |    7 +++++++
 package/xbmc/xbmc.mk   |    2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index ed0d4ed..3eda3b2 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -210,6 +210,13 @@ config BR2_PACKAGE_XBMC_LIBUSB
 	help
 	  Enable libusb support.
 
+config BR2_PACKAGE_XBMC_LIBVA
+	bool "va"
+	select BR2_PACKAGE_LIBVA
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  Enable libva support.
+
 config BR2_PACKAGE_XBMC_WAVPACK
 	bool "wavpack"
 	select BR2_PACKAGE_WAVPACK
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 42320b8..75fc63b 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -193,7 +193,7 @@ XBMC_DEPENDENCIES += libtheora
 endif
 
 # xbmc needs libva & libva-glx
-ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+ifeq ($(BR2_PACKAGE_XBMC_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
 XBMC_DEPENDENCIES += mesa3d libva
 XBMC_CONF_OPT += --enable-vaapi
 else
-- 
1.7.10.4
