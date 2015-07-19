From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:26 +0200
Subject: [Buildroot] [PATCH/RFC v3 21/50]
	package/kodi-pvr-mediaportal-tvserver: new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mediaportal-tvserver/Config.in       |    7 +++++++
 .../kodi-pvr-mediaportal-tvserver.mk                  |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/Config.in
 create mode 100644 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk

diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
new file mode 100644
index 0000000..733ca88
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
+	bool "kodi-pvr-mediaportal-tvserver"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  MediaPortal TVServer PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.mediaportal.tvserver
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
new file mode 100644
index 0000000..3509b28
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-mediaportal-tvserver
+#
+################################################################################
+
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 29809d10010a21b08b9e652e36bc51dac2171690
+KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/README
+
+KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
+
+KODI_PVR_MEDIAPORTAL_TVSERVER_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fe1d032..ad1d23e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -259,6 +259,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-filmon/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
+	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
