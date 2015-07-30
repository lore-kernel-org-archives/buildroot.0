From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:49:19 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-pingpong: new
	package
Message-ID: <20150730132259.55F208007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7498d74b1427c54e54be62d2d1f56b41d0d93da6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-pingpong/Config.in        |   10 ++++++++++
 .../kodi-screensaver-pingpong.mk                   |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
new file mode 100644
index 0000000..4ccf4c4
--- /dev/null
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
+	bool "kodi-screensaver-pingpong"
+	depends on BR2_PACKAGE_KODI_GL
+	help
+	  Ping-pong screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.pingpong
+
+comment "kodi-screensaver-greynetic needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
new file mode 100644
index 0000000..324fe3a
--- /dev/null
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -0,0 +1,13 @@
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
+KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4fb1261..54f4d02 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -291,6 +291,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
+	source "package/kodi-screensaver-pingpong/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
