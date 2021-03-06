From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit branch/next]
 package/kodi-visualisation-goom: bump version 3.4.0-Matrix
Message-ID: <20210306213556.480CC86DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6c294916072cee037933a59d769b497dffec74a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switched opengl dependency to render system used by Kodi.

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-goom/Config.in                    | 6 +++---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 4 ++--
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/kodi-visualisation-goom/Config.in b/package/kodi-visualisation-goom/Config.in
index 065bc1d773..18905bba3a 100644
--- a/package/kodi-visualisation-goom/Config.in
+++ b/package/kodi-visualisation-goom/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_KODI_VISUALISATION_GOOM
 	bool "kodi-visualisation-goom"
-	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_GLM
 	help
 	  GOOM visualiser for Kodi
 
 	  https://github.com/notspiff/visualization.goom
 
-comment "kodi-visualization-goom needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
+comment "kodi-visualization-goom needs OpenGL as Kodi render system"
+	depends on !BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index c9fa7dea9f..ab5bda33c4 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fdd656721f6d1b1962fd0a1e240eafb4710237ba70809dd0391cd10cacf4417c  kodi-visualisation-goom-2.2.3-Leia.tar.gz
-sha256  a6b36f495079206146ae0b11624a8db49a538f421ffe1341f8651c9e6b06f0b0  debian/copyright
+sha256  8de34cd33977bb8fa5fd721993341f7d64bbf5b08e481438740287dd2a366079  kodi-visualisation-goom-3.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index d83f857ae1..45f2f05ece 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 2.2.3-Leia
+KODI_VISUALISATION_GOOM_VERSION = 3.4.0-Matrix
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
-KODI_VISUALISATION_GOOM_LICENSE_FILES = debian/copyright
+KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
 
 KODI_VISUALISATION_GOOM_DEPENDENCIES = glm kodi
 
