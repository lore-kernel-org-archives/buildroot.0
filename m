From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:39 +0200
Subject: [Buildroot] [PATCH/RFC v2 40/44]
	package/kodi-screensaver-greynetic: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-41-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-greynetic/Config.in          |    6 ++++++
 .../kodi-screensaver-greynetic.mk                     |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-screensaver-greynetic/Config.in
 create mode 100644 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk

diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
new file mode 100644
index 0000000..fd83295
--- /dev/null
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
+	bool "kodi-screensaver-greynetic"
+	help
+	  Greynetic screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.greynetic
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
new file mode 100644
index 0000000..fb72b70
--- /dev/null
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-screensaver-greynetic
+#
+################################################################################
+
+KODI_SCREENSAVER_GREYNETIC_VERSION = 5f370b0f1a51e57719f605344e94824105316c17
+KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
+KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
+KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
+
+KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_GREYNETIC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b6ed801..4e9451e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -292,6 +292,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
+	source "package/kodi-screensaver-greynetic/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
