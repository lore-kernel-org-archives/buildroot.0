From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 10:25:40 +0200
Subject: [Buildroot] [git commit] package/kodi-visualisation-waveforhue: new
	package
Message-ID: <20150730132259.962397FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fea0919d797b33e331fc18bfb4bff73ff1349ad1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Adapt-xbmc_vis_dll.h-header-path.patch    |   26 ++++++++++++++++++++
 package/kodi-visualisation-waveforhue/Config.in    |    6 ++++
 .../kodi-visualisation-waveforhue.mk               |   13 ++++++++++
 package/kodi/Config.in                             |    1 +
 4 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/kodi-visualisation-waveforhue/0001-Adapt-xbmc_vis_dll.h-header-path.patch b/package/kodi-visualisation-waveforhue/0001-Adapt-xbmc_vis_dll.h-header-path.patch
new file mode 100644
index 0000000..baa69b4
--- /dev/null
+++ b/package/kodi-visualisation-waveforhue/0001-Adapt-xbmc_vis_dll.h-header-path.patch
@@ -0,0 +1,26 @@
+From d80b2dfeab475b066004d831c0d28c0dab064ca6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 30 Jul 2015 10:24:53 +0200
+Subject: [PATCH] Adapt xbmc_vis_dll.h header path
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Main_gles.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Main_gles.cpp b/src/Main_gles.cpp
+index 3c22bf8..f5666e9 100644
+--- a/src/Main_gles.cpp
++++ b/src/Main_gles.cpp
+@@ -38,7 +38,7 @@
+ #include <GLES2/gl2ext.h>
+ #endif
+ 
+-#include "addons/include/xbmc_vis_dll.h"
++#include "kodi/xbmc_vis_dll.h"
+ #include "VisGUIShader.h"
+ 
+ //th
+-- 
+2.5.0
+
diff --git a/package/kodi-visualisation-waveforhue/Config.in b/package/kodi-visualisation-waveforhue/Config.in
new file mode 100644
index 0000000..9694027
--- /dev/null
+++ b/package/kodi-visualisation-waveforhue/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE
+	bool "kodi-visualisation-waveforhue"
+	help
+	  WaveForHue visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.waveforhue
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
new file mode 100644
index 0000000..5599065
--- /dev/null
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-waveforhue
+#
+################################################################################
+
+KODI_VISUALISATION_WAVEFORHUE_VERSION = 330b5d0432a976993d8ea3e13f01ec9bd3d8b02e
+KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,notspiff,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
+KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPLv2+
+KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
+KODI_VISUALISATION_WAVEFORHUE_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 73ec88e..c3b3183 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -299,6 +299,7 @@ endmenu
 menu "Visualisations"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
+	source "package/kodi-visualisation-waveforhue/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
