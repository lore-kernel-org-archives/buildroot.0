From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:06 +0200
Subject: [Buildroot] [PATCH/RFC 13/27] package/kodi-pvr-mythtv: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-14-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..08cc7db
--- /dev/null
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-mythtv
+#
+################################################################################
+
+KODI_PVR_MYTHTV_VERSION = ef9cf412485b45df76bf26d167bbe318e37b19a9
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
index 916aee2..91ac27a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -274,6 +274,7 @@ source "package/kodi-pvr-filmon/Config.in"
 source "package/kodi-pvr-hts/Config.in"
 source "package/kodi-pvr-iptvsimple/Config.in"
 source "package/kodi-pvr-mediaportal-tvserver/Config.in"
+source "package/kodi-pvr-mythtv/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
