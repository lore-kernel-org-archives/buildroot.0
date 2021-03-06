From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-shadertoy: bump
 version to 2.3.0-Matrix
Message-ID: <20210308072139.88AD881607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb9cef745cf6595617ae102dda1aacd48c2462b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/xbmc/visualization.shadertoy/commit/3fa4d118dcee2025620eb342d1a22a956beb06e5

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-shadertoy/Config.in                      | 1 -
 .../kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash  | 4 ++--
 .../kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk    | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index 1fabba5ef5..aa671aae13 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
 	select BR2_PACKAGE_GLM
-	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Shadertoy visualiser for Kodi
 
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 67ab8867e6..8ecdfb6d50 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  07724fc59cc5f960a941b8255af326e87fa9fbc8234498c7e21d8a46050e0dd4  kodi-visualisation-shadertoy-1.2.4-Leia.tar.gz
-sha256  e33ac3ac6ca1bdd4a4a411481d43579d855622e7ecc207809b5f49ea617db480  debian/copyright
+sha256  fbee4d8d4a41013705848eb89d4dcd55fe915a1ff997a60c800aa1bdd157530b  kodi-visualisation-shadertoy-2.3.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 865abf02cc..f5ad505fe7 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.4-Leia
+KODI_VISUALISATION_SHADERTOY_VERSION = 2.3.0-Matrix
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
-KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = debian/copyright
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi libplatform
+KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
