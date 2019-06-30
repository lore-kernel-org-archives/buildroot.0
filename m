From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:05:02 +0200
Subject: [Buildroot] [PATCH 08/31] package/kodi-visualisation-waveforhue:
 remove package
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is incompatible with Kodi 18.x, configure is broken:

CMake Error at output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/share/kodi/cmake/AddonHelpers.cmake:197 (message):
  "@ADDON_DEPENDS@" not found in addon.xml.in.

For details read PR 2857 of https://github.com/LibreELEC/LibreELEC.tv

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-waveforhue/Config.in     |  6 ------
 .../kodi-visualisation-waveforhue.hash              |  2 --
 .../kodi-visualisation-waveforhue.mk                | 13 -------------
 package/kodi/Config.in                              |  1 -
 4 files changed, 22 deletions(-)
 delete mode 100644 package/kodi-visualisation-waveforhue/Config.in
 delete mode 100644 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
 delete mode 100644 package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk

diff --git a/package/kodi-visualisation-waveforhue/Config.in b/package/kodi-visualisation-waveforhue/Config.in
deleted file mode 100644
index 9694027d2a..0000000000
--- a/package/kodi-visualisation-waveforhue/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE
-	bool "kodi-visualisation-waveforhue"
-	help
-	  WaveForHue visualiser for Kodi
-
-	  https://github.com/notspiff/visualization.waveforhue
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
deleted file mode 100644
index e7e97f1d86..0000000000
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 80c466c55aee97d01442892135d4785070333e39f45942da17b65239758e5ae9  kodi-visualisation-waveforhue-b1805dbdba07e5e5b62115490c703aca43e9065c.tar.gz
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
deleted file mode 100644
index 3ff32e658e..0000000000
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# kodi-visualisation-waveforhue
-#
-################################################################################
-
-KODI_VISUALISATION_WAVEFORHUE_VERSION = b1805dbdba07e5e5b62115490c703aca43e9065c
-KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,hardyt,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
-KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPL-2.0+
-KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
-KODI_VISUALISATION_WAVEFORHUE_DEPENDENCIES = kodi
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c0727da7f8..40c07d8d3f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -374,7 +374,6 @@ menu "Visualisations"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
-	source "package/kodi-visualisation-waveforhue/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
-- 
2.20.1
