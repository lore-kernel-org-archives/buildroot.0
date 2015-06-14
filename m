From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:36 +0200
Subject: [Buildroot] [PATCH/RFC v2 37/44]
	package/kodi-screensaver-asteroids: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-38-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asteroids/Config.in          |    6 ++++++
 .../kodi-screensaver-asteroids.mk                     |   17 +++++++++++++++++
 package/kodi/Config.in                                |    4 ++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/kodi-screensaver-asteroids/Config.in
 create mode 100644 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
new file mode 100644
index 0000000..b1a1d20
--- /dev/null
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
+	bool "kodi-screensaver-asteroids"
+	help
+	  Asteroids screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.asteroids
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
new file mode 100644
index 0000000..cc25e40
--- /dev/null
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-screensaver-asteroids
+#
+################################################################################
+
+KODI_SCREENSAVER_ASTEROIDS_VERSION = d4c2e3b499544ef55be364b34e5569d9c31c9615
+KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
+KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
+KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
+
+KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_ASTEROIDS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c2e2d4e..64aefe7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -288,4 +288,8 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Screensavers"
+	source "package/kodi-screensaver-asteroids/Config.in"
+endmenu
+
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
