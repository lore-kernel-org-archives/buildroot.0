From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 12:07:32 +0100
Subject: [Buildroot] [PATCH v9 20/23] package/kodi-visualisation-spectrum:
 bump version to 3.0.2-Leia
In-Reply-To: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
Message-ID: <20200119110735.1104443-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added patch to fix cstddef include and license hash.

Repo was moved to the xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/89d0272e881557fd82bf5897d3d4fbc1123af46a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...Backport-Add-missing-cstddef-include.patch | 30 +++++++++++++++++++
 .../kodi-visualisation-spectrum.hash          |  3 +-
 .../kodi-visualisation-spectrum.mk            |  4 +--
 3 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch

diff --git a/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch b/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
new file mode 100644
index 0000000000..5b1bb0c47c
--- /dev/null
+++ b/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
@@ -0,0 +1,30 @@
+From b2c54c1043c2396678005b578e85db30bdf5ccb9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 18 Jan 2020 20:22:41 +0100
+Subject: [PATCH] [Backport] Add missing cstddef include
+
+Backported from https://github.com/xbmc/visualization.spectrum/pull/37
+
+Patch sent upstream:
+https://github.com/xbmc/visualization.spectrum/pull/38
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/opengl_spectrum.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/opengl_spectrum.cpp b/src/opengl_spectrum.cpp
+index 05409ea..2441fd6 100644
+--- a/src/opengl_spectrum.cpp
++++ b/src/opengl_spectrum.cpp
+@@ -38,6 +38,7 @@
+ #include <string.h>
+ #include <math.h>
+ #include <stdint.h>
++#include <cstddef>
+ 
+ #include <glm/glm.hpp>
+ #include <glm/gtc/type_ptr.hpp>
+-- 
+2.20.1
+
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 2d9ab0f3cf..4064184a75 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-1.1.1.tar.gz
+sha256 ec88defbb90fdb03f075abdba39c436906a8fbad8f034da3e3b31f75842206cc  kodi-visualisation-spectrum-3.0.2-Leia.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 016f405e40..c3d61c1ef4 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 1.1.1
-KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,v$(KODI_VISUALISATION_SPECTRUM_VERSION))
+KODI_VISUALISATION_SPECTRUM_VERSION = 3.0.2-Leia
+KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
-- 
2.20.1
