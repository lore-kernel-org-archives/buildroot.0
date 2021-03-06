From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:49 +0100
Subject: [Buildroot] [git commit branch/next]
 package/kodi-screensaver-biogenesis: bump version to 2.5.0-Matrix
Message-ID: <20210306213555.99C3186782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=017984a553b6d3737b9bc3217732b4b590ba35e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove dependency to opengl, opengles support was fixed upstream:
https://github.com/xbmc/screensaver.biogenesis/commit/2de1b7eb5897001f7bdf72ec4e390be749ccac13

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-biogenesis/Config.in                        | 4 ----
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash | 4 ++--
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk   | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
index 9703e9091b..26f134d0bb 100644
--- a/package/kodi-screensaver-biogenesis/Config.in
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
 	bool "kodi-screensaver-biogenesis"
-	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  BioGenesis screensaver for Kodi
 
 	  https://github.com/xbmc/screensaver.biogenesis
-
-comment "kodi-screensaver-biogenesis needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index df07f9fbc5..1f2c5e6305 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b0f721d112282f633a769e7b077c5dd52e5045a8f1ae32c4e602b0e2e937acb0  kodi-screensaver-biogenesis-2.2.3-Leia.tar.gz
-sha256  d38b9e2768b49acdedcb21a202d12753c8f1d7e85e5ee24ff1e4aee3c7601a65  debian/copyright
+sha256  bf56384e6956674cd911c52b2807993d0a6e0ffa9623b5a1981a3153911e135a  kodi-screensaver-biogenesis-2.5.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 562c279ec6..8b2d6b2ee5 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.3-Leia
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.5.0-Matrix
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = debian/copyright
+KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
