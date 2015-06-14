From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:16 +0200
Subject: [Buildroot] [PATCH/RFC v2 17/44] package/kodi-pvr-filmon: new
	package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-filmon/Config.in          |    8 ++++++++
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk |   17 +++++++++++++++++
 package/kodi/Config.in                     |    1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-filmon/Config.in
 create mode 100644 package/kodi-pvr-filmon/kodi-pvr-filmon.mk

diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
new file mode 100644
index 0000000..0b662df
--- /dev/null
+++ b/package/kodi-pvr-filmon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_FILMON
+	bool "kodi-pvr-filmon"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Filmon PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.filmon
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
new file mode 100644
index 0000000..7da8bde
--- /dev/null
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-filmon
+#
+################################################################################
+
+KODI_PVR_FILMON_VERSION = 8c02f43d3880b0c24c303f787ff1cf72d5164dae
+KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
+KODI_PVR_FILMON_LICENSE = GPLv2+
+KODI_PVR_FILMON_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
+
+KODI_PVR_FILMON_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 716f8e1..12d299c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -256,6 +256,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
+	source "package/kodi-pvr-filmon/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
