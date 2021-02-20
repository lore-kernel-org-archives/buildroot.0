From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:52 +0100
Subject: [Buildroot] [PATCH/next 33/54] package/kodi-screensaver-asteroids:
 bump version to 2.6.0-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-34-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove dependency to opengl, opengles support was fixed upstream:
https://github.com/xbmc/screensaver.asteroids/commit/360a02fc20925fa17179f3298dd4515b4354e266

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asteroids/Config.in                  | 4 ----
 .../kodi-screensaver-asteroids.hash                           | 4 ++--
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk  | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
index 3d66c3dcc3..833e065dfa 100644
--- a/package/kodi-screensaver-asteroids/Config.in
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
 	bool "kodi-screensaver-asteroids"
-	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_GLM
 	help
 	  Asteroids screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.asteroids
-
-comment "kodi-screensaver-asteroids needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index e6855a3bc6..a8886d2733 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f4b54ed79eedd1a39e24dcbe8d372dbfc9edbc9358499ea9ab28777dd9082ee3  kodi-screensaver-asteroids-2.3.3-Leia.tar.gz
-sha256  297a1d34e6000f1b1a924f5ab75c16c2270968bfa47357dd8fa3799c9dfc47d8  debian/copyright
+sha256  b60d0123dd2ad2326a03b2a66a3cdba3ac17f0a109c4ecedc3216699ca28cae2  kodi-screensaver-asteroids-2.6.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index dcd0a3d34c..add0ca5b9b 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.3.3-Leia
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 2.6.0-Matrix
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = debian/copyright
+KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
