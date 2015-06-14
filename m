From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:38 +0200
Subject: [Buildroot] [PATCH/RFC v2 39/44]
	package/kodi-screensaver-crystalmorph: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-40-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-crystalmorph/Config.in       |   10 ++++++++++
 .../kodi-screensaver-crystalmorph.mk                  |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 28 insertions(+)
 create mode 100644 package/kodi-screensaver-crystalmorph/Config.in
 create mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk

diff --git a/package/kodi-screensaver-crystalmorph/Config.in b/package/kodi-screensaver-crystalmorph/Config.in
new file mode 100644
index 0000000..88edbf0
--- /dev/null
+++ b/package/kodi-screensaver-crystalmorph/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
+	bool "kodi-screensaver-crystalmorph"
+	depends on BR2_PACKAGE_KODI_GL # libglu
+	help
+	  CrystalMorph screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.crystalmorph
+
+comment "crystalmorph needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
new file mode 100644
index 0000000..afa48ff
--- /dev/null
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-screensaver-crystalmorph
+#
+################################################################################
+
+KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 2e7c10e3543f5aaab6fd2f5aa9d05b976a43ba68
+KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
+KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPLv2+
+KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
+
+KODI_SCREENSAVER_CRYSTALMORPH_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_CRYSTALMORPH_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7ad0249..b6ed801 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -291,6 +291,7 @@ endmenu
 menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
+	source "package/kodi-screensaver-crystalmorph/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
