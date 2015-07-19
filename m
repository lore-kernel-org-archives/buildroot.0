From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:29 +0200
Subject: [Buildroot] [PATCH/RFC v3 24/50] package/kodi-pvr-njoy: new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-25-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-njoy/Config.in        |    7 +++++++
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk |   17 +++++++++++++++++
 package/kodi/Config.in                 |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-njoy/Config.in
 create mode 100644 package/kodi-pvr-njoy/kodi-pvr-njoy.mk

diff --git a/package/kodi-pvr-njoy/Config.in b/package/kodi-pvr-njoy/Config.in
new file mode 100644
index 0000000..33c493c
--- /dev/null
+++ b/package/kodi-pvr-njoy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_NJOY
+	bool "kodi-pvr-njoy"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's Njoy N7 client addon
+
+	  https://github.com/kodi-pvr/pvr.njoy
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
new file mode 100644
index 0000000..618e3be
--- /dev/null
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-njoy
+#
+################################################################################
+
+KODI_PVR_NJOY_VERSION = 4f88a097cb62b4604ffb0ac293a5dc8f40885e79
+KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
+KODI_PVR_NJOY_LICENSE = GPLv2+
+KODI_PVR_NJOY_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_NJOY_DEPENDENCIES = kodi-platform
+
+KODI_PVR_NJOY_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 53dfa42..f9a3602 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -262,6 +262,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 	source "package/kodi-pvr-mythtv/Config.in"
 	source "package/kodi-pvr-nextpvr/Config.in"
+	source "package/kodi-pvr-njoy/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
