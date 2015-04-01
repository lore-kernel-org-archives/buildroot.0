From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:02 +0200
Subject: [Buildroot] [PATCH/RFC 09/27] package/kodi-pvr-filmon: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-10-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..3a7d673
--- /dev/null
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-filmon
+#
+################################################################################
+
+KODI_PVR_FILMON_VERSION = 413fe9eca6f4a202e678e2dcc7dbf59f19e35164
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
index e2170f8..ad8cab4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -270,6 +270,7 @@ comment "Kodi PVR addons"
 source "package/kodi-pvr-argustv/Config.in"
 source "package/kodi-pvr-dvblink/Config.in"
 source "package/kodi-pvr-dvbviewer/Config.in"
+source "package/kodi-pvr-filmon/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
