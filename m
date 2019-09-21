From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 22:59:07 +0200
Subject: [Buildroot] [git commit] package/kodi-visualisation-waveforhue:
 remove package
Message-ID: <20190921205424.866728F0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeb069f96252d9e7cef6c9d53ee45d436085e3f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is incompatible with Kodi 18.x, configure is broken:

CMake Error at output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/share/kodi/cmake/AddonHelpers.cmake:197 (message):
  "@ADDON_DEPENDS@" not found in addon.xml.in.

For details read PR 2857 of https://github.com/LibreELEC/LibreELEC.tv

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                            |  6 ++++++
 package/kodi-visualisation-waveforhue/Config.in             |  6 ------
 .../kodi-visualisation-waveforhue.hash                      |  2 --
 .../kodi-visualisation-waveforhue.mk                        | 13 -------------
 package/kodi/Config.in                                      |  1 -
 5 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b453f544c6..e3e83b43d6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE
+	bool "kodi-visualisation-waveforhue package was removed"
+	select BR2_LEGACY
+	help
+	  This package is incompatible with Kodi 18.x.
+
 config BR2_PACKAGE_KODI_AUDIODECODER_OPUS
 	bool "kodi-audiodecoder-opus package was removed"
 	select BR2_LEGACY
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
index 32dda14c1f..2cef12ea6b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -363,7 +363,6 @@ menu "Visualisations"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
-	source "package/kodi-visualisation-waveforhue/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
