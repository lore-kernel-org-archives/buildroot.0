From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:50 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-pingpong: bump
 version to 2.4.0-Matrix
Message-ID: <20210308072139.1D51881607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d300aa916221f55cacce28c9f3056f2518f946b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove dependency to opengl, add dependency to glm, opengles support
was added upstream:
https://github.com/xbmc/screensaver.pingpong/commit/39ccbf75e6a7a56781329aeb508ae4f2ce210e4f

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-pingpong/Config.in                      | 5 +----
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash | 4 ++--
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk   | 6 +++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
index bc76fffd6e..2983f7c2ea 100644
--- a/package/kodi-screensaver-pingpong/Config.in
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
 	bool "kodi-screensaver-pingpong"
-	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_GLM
 	help
 	  Ping-pong screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.pingpong
-
-comment "kodi-screensaver-pingpong needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 4b6114fd16..245fdfdbe9 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b87e65d2e3c290de7167e1098899d5816103958a99769d84e930ffd2cbfa7d00  kodi-screensaver-pingpong-2.1.3-Leia.tar.gz
-sha256  96e9b817ea6384e3d2c5241c8a0504df11d6f8bd0a2f58f25df7152da64f263c  debian/copyright
+sha256  c38cda571b345d61882b43cea839536fa6fbfbb08e07231e8d8bc8adb8d28c08  kodi-screensaver-pingpong-2.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 929539f044..cd794128f3 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.3-Leia
+KODI_SCREENSAVER_PINGPONG_VERSION = 2.4.0-Matrix
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = debian/copyright
-KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
+KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
+KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
