From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:38 +0200
Subject: [Buildroot] [PATCH 16/47] package/kodi-pvr-dvbviewer: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-17-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                 |    1 +
 package/kodi-pvr-dvbviewer/Config.in             |    7 +++++++
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk |   17 +++++++++++++++++
 package/kodi/Config.in                           |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-dvbviewer/Config.in
 create mode 100644 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5c545f2..a5fed65 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -112,6 +112,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_PVR_ARGUSTV
 	select BR2_PACKAGE_KODI_PVR_DVBLINK
+	select BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-dvbviewer/Config.in b/package/kodi-pvr-dvbviewer/Config.in
new file mode 100644
index 0000000..e7dd7b3
--- /dev/null
+++ b/package/kodi-pvr-dvbviewer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_DVBVIEWER
+	bool "kodi-pvr-dvbviewer"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's DVBViewer client addon
+
+	  https://github.com/kodi-pvr/pvr.dvbviewer
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
new file mode 100644
index 0000000..21e6372
--- /dev/null
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-dvbviewer
+#
+################################################################################
+
+KODI_PVR_DVBVIEWER_VERSION = cbfd4552a4381d289bcfb8eda33699ecfd156bd7
+KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
+KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
+KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
+
+KODI_PVR_DVBVIEWER_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b21530b..716f8e1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -255,6 +255,7 @@ menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
+	source "package/kodi-pvr-dvbviewer/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
