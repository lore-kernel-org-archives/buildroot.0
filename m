From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:21 +0200
Subject: [Buildroot] [PATCH/RFC v2 22/44] package/kodi-pvr-nextpvr: new
	package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/Config.in           |    7 +++++++
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-nextpvr/Config.in
 create mode 100644 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk

diff --git a/package/kodi-pvr-nextpvr/Config.in b/package/kodi-pvr-nextpvr/Config.in
new file mode 100644
index 0000000..e520426
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_NEXTPVR
+	bool "kodi-pvr-nextpvr"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's NextPVR client addon
+
+	  https://github.com/kodi-pvr/pvr.nextpvr
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
new file mode 100644
index 0000000..074b74f
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-nextpvr
+#
+################################################################################
+
+KODI_PVR_NEXTPVR_VERSION = 74168dc9d963503df90f56386d70b2093b60d33e
+KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
+KODI_PVR_NEXTPVR_LICENSE = GPLv2+
+KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
+
+KODI_PVR_NEXTPVR_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 80ffe3a..53dfa42 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -261,6 +261,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 	source "package/kodi-pvr-mythtv/Config.in"
+	source "package/kodi-pvr-nextpvr/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
