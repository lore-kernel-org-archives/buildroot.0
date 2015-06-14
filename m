From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:23 +0200
Subject: [Buildroot] [PATCH/RFC v2 24/44] package/kodi-pvr-pctv: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-25-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-pctv/Config.in        |    8 ++++++++
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk |   17 +++++++++++++++++
 package/kodi/Config.in                 |    1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-pctv/Config.in
 create mode 100644 package/kodi-pvr-pctv/kodi-pvr-pctv.mk

diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
new file mode 100644
index 0000000..255cd4a
--- /dev/null
+++ b/package/kodi-pvr-pctv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_PCTV
+	bool "kodi-pvr-pctv"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  PCTV PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
new file mode 100644
index 0000000..07f44af
--- /dev/null
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-pctv
+#
+################################################################################
+
+KODI_PVR_PCTV_VERSION = 804dc37c9728a97a1bb7b847c3d779e54ff2471f
+KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
+KODI_PVR_PCTV_LICENSE = GPLv2+
+KODI_PVR_PCTV_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
+
+KODI_PVR_PCTV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f9a3602..6aaf72f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -263,6 +263,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-mythtv/Config.in"
 	source "package/kodi-pvr-nextpvr/Config.in"
 	source "package/kodi-pvr-njoy/Config.in"
+	source "package/kodi-pvr-pctv/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
