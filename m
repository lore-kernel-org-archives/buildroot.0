From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:50 +0200
Subject: [Buildroot] [PATCH 28/47] package/kodi-pvr-vuplus: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                           |    1 +
 package/kodi-pvr-vuplus/Config.in          |    7 +++++++
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk |   17 +++++++++++++++++
 package/kodi/Config.in                     |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-vuplus/Config.in
 create mode 100644 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0802f17..37ff81f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -124,6 +124,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_STALKER
 	select BR2_PACKAGE_KODI_PVR_VBOX
 	select BR2_PACKAGE_KODI_PVR_VDR_VNSI
+	select BR2_PACKAGE_KODI_PVR_VUPLUS
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
new file mode 100644
index 0000000..a56c4ed
--- /dev/null
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VUPLUS
+	bool "kodi-pvr-vuplus"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  VuPlus PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.vuplus
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
new file mode 100644
index 0000000..c44bdc4
--- /dev/null
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-vuplus
+#
+################################################################################
+
+KODI_PVR_VUPLUS_VERSION = 96115e9b8898ed6bde36874b43b2fba531cfef5c
+KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
+KODI_PVR_VUPLUS_LICENSE = GPLv2+
+KODI_PVR_VUPLUS_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
+
+KODI_PVR_VUPLUS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 92f10df..f184db0 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -267,6 +267,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
+	source "package/kodi-pvr-vuplus/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
