From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:30:27 +0100
Subject: [Buildroot] [git commit branch/next]
 package/kodi-screensaver-crystalmorph: remove package
Message-ID: <20210306213553.E2FB186782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49eb73cac119d96822e8b758de18aec840b98d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package received its last updates in 2017, is not part of the
official Kodi github repo and its build is broken with Kodi 19.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                            | 10 ++++++++++
 package/kodi-screensaver-crystalmorph/Config.in             | 10 ----------
 .../kodi-screensaver-crystalmorph.hash                      |  3 ---
 .../kodi-screensaver-crystalmorph.mk                        | 13 -------------
 package/kodi/Config.in                                      |  1 -
 5 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9deb67b31f..8ebbc4c295 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,16 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2021.05"
+
+config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
+	bool "kodi-screensaver-crystalmorph removed"
+	select BR2_LEGACY
+	help
+	  The package received its last updates in 2017, is not part
+	  of the official Kodi github repo and its build is broken
+	  with Kodi 19.x, so it was removed.
+
 comment "Legacy options removed in 2021.02"
 
 config BR2_PACKAGE_MPD_AUDIOFILE
diff --git a/package/kodi-screensaver-crystalmorph/Config.in b/package/kodi-screensaver-crystalmorph/Config.in
deleted file mode 100644
index 1303d229fd..0000000000
--- a/package/kodi-screensaver-crystalmorph/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
-	bool "kodi-screensaver-crystalmorph"
-	depends on BR2_PACKAGE_HAS_LIBGL # libglu
-	help
-	  CrystalMorph screensaver for Kodi
-
-	  https://github.com/notspiff/screensaver.crystalmorph
-
-comment "kodi-screensaver-crystalmorph needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
deleted file mode 100644
index 59e0703255..0000000000
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  d8ed548222f1118964104fefc8ac3056dfe6c9d2ee35cd7c8355c9ea9fcaffc5  kodi-screensaver-crystalmorph-4439c84c38abf889e19a1863e745942c0d7f8203.tar.gz
-sha256  febce1924ed772f22ec3fabec646b1401aad4f4a81a7f1baeb858f27ae4f5241  src/Fractal.cpp
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
deleted file mode 100644
index 35642d5580..0000000000
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# kodi-screensaver-crystalmorph
-#
-################################################################################
-
-KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 4439c84c38abf889e19a1863e745942c0d7f8203
-KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
-KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
-KODI_SCREENSAVER_CRYSTALMORPH_DEPENDENCIES = kodi
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8453ba0e07..e805aa9d31 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -357,7 +357,6 @@ menu "Screensavers"
 	source "package/kodi-screensaver-asterwave/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-cpblobs/Config.in"
-	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-matrixtrails/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
