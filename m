From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:47 +0200
Subject: [Buildroot] [PATCH 25/47] package/kodi-pvr-stalker: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-stalker/Config.in           |    7 +++++++
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-stalker/Config.in
 create mode 100644 package/kodi-pvr-stalker/kodi-pvr-stalker.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f8c2001..0684c97 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -121,6 +121,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_NEXTPVR
 	select BR2_PACKAGE_KODI_PVR_NJOY
 	select BR2_PACKAGE_KODI_PVR_PCTV
+	select BR2_PACKAGE_KODI_PVR_STALKER
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
new file mode 100644
index 0000000..b327fd8
--- /dev/null
+++ b/package/kodi-pvr-stalker/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_STALKER
+	bool "kodi-pvr-stalker"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  A PVR Client that connects Kodi to Stalker Middleware
+
+	  https://github.com/kodi-pvr/pvr.stalker
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
new file mode 100644
index 0000000..8e98425
--- /dev/null
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-stalker
+#
+################################################################################
+
+KODI_PVR_STALKER_VERSION = 5f6eb1992ffd45a075ebb7bc4253c4a88bf65c80
+KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
+KODI_PVR_STALKER_LICENSE = GPLv2+
+KODI_PVR_STALKER_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_STALKER_DEPENDENCIES = kodi-platform
+
+KODI_PVR_STALKER_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6aaf72f..3cbc9aa 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -264,6 +264,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-nextpvr/Config.in"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
+	source "package/kodi-pvr-stalker/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
