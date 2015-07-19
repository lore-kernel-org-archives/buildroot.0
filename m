From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:50 +0200
Subject: [Buildroot] [PATCH/RFC v3 45/50]
	package/kodi-visualisation-shadertoy: new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-46-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-shadertoy/Config.in        |    6 ++++++
 .../kodi-visualisation-shadertoy.mk                   |   17 +++++++++++++++++
 package/kodi/Config.in                                |    4 ++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/kodi-visualisation-shadertoy/Config.in
 create mode 100644 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk

diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
new file mode 100644
index 0000000..10a6e55
--- /dev/null
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
+	bool "kodi-visualisation-shadertoy"
+	help
+	  Shadertoy visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.shadertoy
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
new file mode 100644
index 0000000..72493c1
--- /dev/null
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-visualisation-shadertoy
+#
+################################################################################
+
+KODI_VISUALISATION_SHADERTOY_VERSION = a4eaaad4ab7204a30224f2c6952f7a7035ca1c38
+KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
+KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
+KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
+
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi
+
+KODI_VISUALISATION_SHADERTOY_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2cf6940..e60815c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -298,4 +298,8 @@ menu "Screensavers"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
+menu "Visualisations"
+	source "package/kodi-visualisation-shadertoy/Config.in"
+endmenu
+
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
