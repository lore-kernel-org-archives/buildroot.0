From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:33 +0200
Subject: [Buildroot] [PATCH/RFC v3 28/50] package/kodi-pvr-vdr-vnsi: new
	package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vdr-vnsi/Config.in            |    7 +++++++
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk |   17 +++++++++++++++++
 package/kodi/Config.in                         |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-vdr-vnsi/Config.in
 create mode 100644 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk

diff --git a/package/kodi-pvr-vdr-vnsi/Config.in b/package/kodi-pvr-vdr-vnsi/Config.in
new file mode 100644
index 0000000..768dec8
--- /dev/null
+++ b/package/kodi-pvr-vdr-vnsi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VDR_VNSI
+	bool "kodi-pvr-vdr-vnsi"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi PVR addon VNSI
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
new file mode 100644
index 0000000..bac61ab
--- /dev/null
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-vdr-vnsi
+#
+################################################################################
+
+KODI_PVR_VDR_VNSI_VERSION = 550a4a2e093b4418394cdbe6f72cd7c76f0327b7
+KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
+KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
+KODI_PVR_VDR_VNSI_LICENSE_FILES = src/VNSI_Admin.cpp
+
+KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
+
+KODI_PVR_VDR_VNSI_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7b497fc..92f10df 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -266,6 +266,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-pctv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
+	source "package/kodi-pvr-vdr-vnsi/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
