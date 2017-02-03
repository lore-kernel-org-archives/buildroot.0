From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:29 +0100
Subject: [Buildroot] [PATCH v2 35/38] package/kodi-skin-confluence: new
	package
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-36-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-skin-confluence/Config.in                 |  6 ++++++
 package/kodi-skin-confluence/kodi-skin-confluence.hash |  2 ++
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 18 ++++++++++++++++++
 package/kodi/Config.in                                 |  4 ++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/kodi-skin-confluence/Config.in
 create mode 100644 package/kodi-skin-confluence/kodi-skin-confluence.hash
 create mode 100644 package/kodi-skin-confluence/kodi-skin-confluence.mk

diff --git a/package/kodi-skin-confluence/Config.in b/package/kodi-skin-confluence/Config.in
new file mode 100644
index 000000000..08b656808
--- /dev/null
+++ b/package/kodi-skin-confluence/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SKIN_CONFLUENCE
+	bool "kodi-skin-confluence"
+	help
+	  Kodi confluence skin
+
+	  https://github.com/xbmc/skin.confluence
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
new file mode 100644
index 000000000..7579f694c
--- /dev/null
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 54f08dd036c9d2fc0b19768060beae5ac2042263375cbaf8a41d5ca0ac7fdc47  kodi-skin-confluence-a87bd1ddd13aff52ad58d9d3f5af91e4567e58c6.tar.gz
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
new file mode 100644
index 000000000..65f27150a
--- /dev/null
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# kodi-skin-confluence
+#
+################################################################################
+
+KODI_SKIN_CONFLUENCE_VERSION = a87bd1ddd13aff52ad58d9d3f5af91e4567e58c6
+KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
+KODI_SKIN_CONFLUENCE_LICENSE = GPLv2+
+KODI_SKIN_CONFLUENCE_LICENSE_FILES = COPYING
+KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
+
+define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
+	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
+endef
+
+$(eval $(generic-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 63a58e59c..6a9348ac1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -322,6 +322,10 @@ menu "Screensavers"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
+menu "Skins"
+	source "package/kodi-skin-confluence/Config.in"
+endmenu
+
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
 	source "package/kodi-visualisation-fountain/Config.in"
-- 
2.11.0
