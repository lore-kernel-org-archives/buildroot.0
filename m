From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:26 +0200
Subject: [Buildroot] [PATCH/RFC v2 27/44] package/kodi-pvr-vdr: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vdr/Config.in       |    7 +++++++
 package/kodi-pvr-vdr/kodi-pvr-vdr.mk |   17 +++++++++++++++++
 package/kodi/Config.in               |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-vdr/Config.in
 create mode 100644 package/kodi-pvr-vdr/kodi-pvr-vdr.mk

diff --git a/package/kodi-pvr-vdr/Config.in b/package/kodi-pvr-vdr/Config.in
new file mode 100644
index 0000000..767c870
--- /dev/null
+++ b/package/kodi-pvr-vdr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VDR
+	bool "kodi-pvr-vdr"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi PVR addon VNSI
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-vdr/kodi-pvr-vdr.mk b/package/kodi-pvr-vdr/kodi-pvr-vdr.mk
new file mode 100644
index 0000000..b7e9e7a
--- /dev/null
+++ b/package/kodi-pvr-vdr/kodi-pvr-vdr.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-vdr
+#
+################################################################################
+
+KODI_PVR_VDR_VERSION = 033cc50b0ef7bf9dcbdfea405aa998b9b9ac703e
+KODI_PVR_VDR_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VERSION))
+KODI_PVR_VDR_LICENSE = GPLv2+
+KODI_PVR_VDR_LICENSE_FILES = src/VNSIAdmin.cpp
+
+KODI_PVR_VDR_DEPENDENCIES = kodi-platform
+
+KODI_PVR_VDR_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7b497fc..636ea25 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -266,6 +266,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-pctv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
+	source "package/kodi-pvr-vdr/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
