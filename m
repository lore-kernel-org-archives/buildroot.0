From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:11 +0200
Subject: [Buildroot] [PATCH/RFC 18/27] package/kodi-pvr-vuplus: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/Config.in          |    7 +++++++
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk |   17 +++++++++++++++++
 package/kodi/Config.in                     |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-vuplus/Config.in
 create mode 100644 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
new file mode 100644
index 0000000..a56c4ed
--- /dev/null
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VUPLUS
+	bool "kodi-pvr-vuplus"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  VuPlus PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.vuplus
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
new file mode 100644
index 0000000..060d9e8
--- /dev/null
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-vuplus
+#
+################################################################################
+
+KODI_PVR_VUPLUS_VERSION = d6abad3899fc5d7c72182f745bf7689612cfa092
+KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
+KODI_PVR_VUPLUS_LICENSE = GPLv2+
+KODI_PVR_VUPLUS_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
+
+KODI_PVR_VUPLUS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5cf41f1..9970a84 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -279,6 +279,7 @@ source "package/kodi-pvr-nextpvr/Config.in"
 source "package/kodi-pvr-njoy/Config.in"
 source "package/kodi-pvr-pctv/Config.in"
 source "package/kodi-pvr-vdr/Config.in"
+source "package/kodi-pvr-vuplus/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
