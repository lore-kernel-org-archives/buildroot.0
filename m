From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:12 +0200
Subject: [Buildroot] [PATCH/RFC 19/27] package/kodi-pvr-wmc: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-wmc/Config.in       |    7 +++++++
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk |   17 +++++++++++++++++
 package/kodi/Config.in               |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-wmc/Config.in
 create mode 100644 package/kodi-pvr-wmc/kodi-pvr-wmc.mk

diff --git a/package/kodi-pvr-wmc/Config.in b/package/kodi-pvr-wmc/Config.in
new file mode 100644
index 0000000..2672c83
--- /dev/null
+++ b/package/kodi-pvr-wmc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_WMC
+	bool "kodi-pvr-wmc"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's Windows Media Center client addon
+
+	  https://github.com/kodi-pvr/pvr.wmc
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
new file mode 100644
index 0000000..c406f0f
--- /dev/null
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-wmc
+#
+################################################################################
+
+KODI_PVR_WMC_VERSION = b48784adffed1ad3324cb4b235ab96b47e385195
+KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
+KODI_PVR_WMC_LICENSE = GPLv2+
+KODI_PVR_WMC_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_WMC_DEPENDENCIES = kodi-platform
+
+KODI_PVR_WMC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9970a84..62fae07 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -280,6 +280,7 @@ source "package/kodi-pvr-njoy/Config.in"
 source "package/kodi-pvr-pctv/Config.in"
 source "package/kodi-pvr-vdr/Config.in"
 source "package/kodi-pvr-vuplus/Config.in"
+source "package/kodi-pvr-wmc/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
