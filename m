From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:23 +0200
Subject: [Buildroot] [PATCH/RFC v3 18/50] package/kodi-pvr-filmon: new
	package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-19-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..8dabb03
--- /dev/null
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-filmon
+#
+################################################################################
+
+KODI_PVR_FILMON_VERSION = 5c41f4e361c9bcdd6e53cffd541222c5aa131a27
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
