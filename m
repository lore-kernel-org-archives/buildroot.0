From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:20 +0200
Subject: [Buildroot] [PATCH/RFC v2 21/44] package/kodi-pvr-mythtv: new
	package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-22-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mythtv/Config.in          |    7 +++++++
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk |   17 +++++++++++++++++
 package/kodi/Config.in                     |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-mythtv/Config.in
 create mode 100644 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk

diff --git a/package/kodi-pvr-mythtv/Config.in b/package/kodi-pvr-mythtv/Config.in
new file mode 100644
index 0000000..798ff3e
--- /dev/null
+++ b/package/kodi-pvr-mythtv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_MYTHTV
+	bool "kodi-pvr-mythtv"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  MythTV PVR for Kodi
+
+	  https://github.com/kodi-pvr/pvr.mythtv
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
new file mode 100644
index 0000000..f454949
--- /dev/null
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-mythtv
+#
+################################################################################
+
+KODI_PVR_MYTHTV_VERSION = 43ab825f9c0ba2f34117083df08e83f08f058677
+KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
+KODI_PVR_MYTHTV_LICENSE = GPLv2+
+KODI_PVR_MYTHTV_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
+
+KODI_PVR_MYTHTV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ad1d23e..80ffe3a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -260,6 +260,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
+	source "package/kodi-pvr-mythtv/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
