From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:37 +0200
Subject: [Buildroot] [PATCH/RFC v2 38/44]
	package/kodi-screensaver-biogenesis: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-39-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-biogenesis/Config.in         |    6 ++++++
 .../kodi-screensaver-biogenesis.mk                    |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-screensaver-biogenesis/Config.in
 create mode 100644 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk

diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
new file mode 100644
index 0000000..31e1017
--- /dev/null
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
+	bool "kodi-screensaver-biogenesis"
+	help
+	  BioGenesis screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.biogenesis
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
new file mode 100644
index 0000000..3639198
--- /dev/null
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-screensaver-biogenesis
+#
+################################################################################
+
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 2eccbd4e46320de03fde6731c560660659fd34d7
+KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
+KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
+KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
+
+KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_BIOGENESIS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 64aefe7..7ad0249 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -290,6 +290,7 @@ endmenu
 
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
+	source "package/kodi-screensaver-biogenesis/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
