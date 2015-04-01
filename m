From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:00 +0200
Subject: [Buildroot] [PATCH/RFC 07/27] package/kodi-pvr-dvblink: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvblink/Config.in           |    8 ++++++++
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-dvblink/Config.in
 create mode 100644 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk

diff --git a/package/kodi-pvr-dvblink/Config.in b/package/kodi-pvr-dvblink/Config.in
new file mode 100644
index 0000000..57f1127
--- /dev/null
+++ b/package/kodi-pvr-dvblink/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_DVBLINK
+	bool "kodi-pvr-dvblink"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML2
+	help
+	  Kodi's DVBLink client addon
+
+	  https://github.com/kodi-pvr/pvr.dvblink
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
new file mode 100644
index 0000000..ba606e3
--- /dev/null
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-dvblink
+#
+################################################################################
+
+KODI_PVR_DVBLINK_VERSION = 5d505b876b06cf09f156a324de8b112d178da16d
+KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
+KODI_PVR_DVBLINK_LICENSE = GPLv2+
+KODI_PVR_DVBLINK_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
+
+KODI_PVR_DVBLINK_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 274c413..79ddc52 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -268,6 +268,7 @@ if BR2_PACKAGE_KODI_PVR_ADDONS
 comment "Kodi PVR addons"
 
 source "package/kodi-pvr-argustv/Config.in"
+source "package/kodi-pvr-dvblink/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
