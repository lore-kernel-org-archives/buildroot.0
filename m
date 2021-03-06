From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit branch/next]
 package/kodi-visualisation-spectrum: bump version to 3.4.0-Matrix
Message-ID: <20210306213556.5BE588754D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc992625b3eacef3530784c59aa12455ba6f33c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch applied upstream:
https://github.com/xbmc/visualization.spectrum/commit/46b605516b057823855c7f76dbc3f622dcf5983b

Add dependency to glm due to upstream commit:
https://github.com/xbmc/visualization.spectrum/commit/0a3e3885b87f61e9a511ec942b3c01679e4b3414

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Backport-Add-missing-cstddef-include.patch | 30 ----------------------
 package/kodi-visualisation-spectrum/Config.in      |  1 +
 .../kodi-visualisation-spectrum.hash               |  4 +--
 .../kodi-visualisation-spectrum.mk                 |  6 ++---
 4 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch b/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
deleted file mode 100644
index 5b1bb0c47c..0000000000
--- a/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b2c54c1043c2396678005b578e85db30bdf5ccb9 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 18 Jan 2020 20:22:41 +0100
-Subject: [PATCH] [Backport] Add missing cstddef include
-
-Backported from https://github.com/xbmc/visualization.spectrum/pull/37
-
-Patch sent upstream:
-https://github.com/xbmc/visualization.spectrum/pull/38
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/opengl_spectrum.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/opengl_spectrum.cpp b/src/opengl_spectrum.cpp
-index 05409ea..2441fd6 100644
---- a/src/opengl_spectrum.cpp
-+++ b/src/opengl_spectrum.cpp
-@@ -38,6 +38,7 @@
- #include <string.h>
- #include <math.h>
- #include <stdint.h>
-+#include <cstddef>
- 
- #include <glm/glm.hpp>
- #include <glm/gtc/type_ptr.hpp>
--- 
-2.20.1
-
diff --git a/package/kodi-visualisation-spectrum/Config.in b/package/kodi-visualisation-spectrum/Config.in
index 3b2b0a25e2..deb623087f 100644
--- a/package/kodi-visualisation-spectrum/Config.in
+++ b/package/kodi-visualisation-spectrum/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM
 	bool "kodi-visualisation-spectrum"
+	select BR2_PACKAGE_GLM
 	help
 	  Spectrum visualiser for Kodi
 
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index ae78fbd355..e6473ab0a1 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ec88defbb90fdb03f075abdba39c436906a8fbad8f034da3e3b31f75842206cc  kodi-visualisation-spectrum-3.0.2-Leia.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  0b08b99c0289a421425a5d3b39eafdf6262021e213bd3093e98704efb410d348  kodi-visualisation-spectrum-3.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index c3d61c1ef4..42abc156cd 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 3.0.2-Leia
+KODI_VISUALISATION_SPECTRUM_VERSION = 3.4.0-Matrix
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
-KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
-KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
+KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
+KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
