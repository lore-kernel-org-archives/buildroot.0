From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:40 +0200
Subject: [Buildroot] [PATCH/RFC v2 41/44] package/kodi-screensaver-pingpong:
	new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-42-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-pingpong/Config.in           |    6 ++++++
 .../kodi-screensaver-pingpong.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                                |    1 +
 3 files changed, 24 insertions(+)
 create mode 100644 package/kodi-screensaver-pingpong/Config.in
 create mode 100644 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk

diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
new file mode 100644
index 0000000..916b8c2
--- /dev/null
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
+	bool "kodi-screensaver-pingpong"
+	help
+	  Ping-pong screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.pingpong
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
new file mode 100644
index 0000000..57bcc92
--- /dev/null
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-screensaver-pingpong
+#
+################################################################################
+
+KODI_SCREENSAVER_PINGPONG_VERSION = 00fd2a7c70d581ada1bc89829c6870530b4c65b9
+KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
+KODI_SCREENSAVER_PINGPONG_LICENSE = GPLv2+
+KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
+
+KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
+
+KODI_SCREENSAVER_PINGPONG_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4e9451e..4ce965f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -293,6 +293,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
+	source "package/kodi-screensaver-pingpong/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
