From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:01 +0200
Subject: [Buildroot] [PATCH/RFC 08/27] package/kodi-pvr-dvbviewer: new
	package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvbviewer/Config.in             |    7 +++++++
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk |   17 +++++++++++++++++
 package/kodi/Config.in                           |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-dvbviewer/Config.in
 create mode 100644 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk

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
index 0000000..68c0265
--- /dev/null
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-dvbviewer
+#
+################################################################################
+
+KODI_PVR_DVBVIEWER_VERSION = bd2c01f51a80fdc1cf226b783f52911140f4fc82
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
index 79ddc52..e2170f8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -269,6 +269,7 @@ comment "Kodi PVR addons"
 
 source "package/kodi-pvr-argustv/Config.in"
 source "package/kodi-pvr-dvblink/Config.in"
+source "package/kodi-pvr-dvbviewer/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
