From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:41 +0200
Subject: [Buildroot] [PATCH 19/47] package/kodi-pvr-iptvsimple: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                   |    1 +
 package/kodi-pvr-iptvsimple/Config.in              |    7 +++++++
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |   17 +++++++++++++++++
 package/kodi/Config.in                             |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-iptvsimple/Config.in
 create mode 100644 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9ee41cf..8c82cc6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -115,6 +115,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	select BR2_PACKAGE_KODI_PVR_FILMON
 	select BR2_PACKAGE_KODI_PVR_HTS
+	select BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
new file mode 100644
index 0000000..b596749
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
+	bool "kodi-pvr-iptvsimple"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  IPTV Live TV and Radio PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.iptvsimple
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
new file mode 100644
index 0000000..60329bd
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-iptvsimple
+#
+################################################################################
+
+KODI_PVR_IPTVSIMPLE_VERSION = 23defebace9a596d549a688c1d017900aeaf7761
+KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
+KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
+KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
+
+KODI_PVR_IPTVSIMPLE_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9a20d83..fe1d032 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -258,6 +258,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
+	source "package/kodi-pvr-iptvsimple/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
