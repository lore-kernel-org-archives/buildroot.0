From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:42 +0200
Subject: [Buildroot] [PATCH/RFC v2 43/44] package/kodi-screensaver-stars:
	new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-44-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-stars/Config.in              |    6 ++++++
 .../kodi-screensaver-stars/kodi-screensaver-stars.mk  |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-screensaver-stars/Config.in
 create mode 100644 package/kodi-screensaver-stars/kodi-screensaver-stars.mk

diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
new file mode 100644
index 0000000..e8f7862
--- /dev/null
+++ b/package/kodi-screensaver-stars/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_STARS
+	bool "kodi-screensaver-stars"
+	help
+	  Starfield screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.stars
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
new file mode 100644
index 0000000..bc86bd9
--- /dev/null
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-screensaver-stars
+#
+################################################################################
+
+KODI_SCREENSAVER_STARS_VERSION = 91b59f687ceb52488763aca4ba67d50a92f01731
+KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
+KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
+KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
+
+KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_STARS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d2ec088..b7516c0 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -295,6 +295,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
+	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
