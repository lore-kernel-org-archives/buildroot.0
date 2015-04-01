From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:05 +0200
Subject: [Buildroot] [PATCH/RFC 12/27]
	package/kodi-pvr-mediaportal-tvserver: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-13-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..9def3a7
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-mediaportal-tvserver
+#
+################################################################################
+
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 6f8ca82e94ac7ebbd40f3d982c0502c8245f9b83
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
index 701f03a..916aee2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -273,6 +273,7 @@ source "package/kodi-pvr-dvbviewer/Config.in"
 source "package/kodi-pvr-filmon/Config.in"
 source "package/kodi-pvr-hts/Config.in"
 source "package/kodi-pvr-iptvsimple/Config.in"
+source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
