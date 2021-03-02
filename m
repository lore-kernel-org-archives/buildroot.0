From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:06:58 +0100
Subject: [Buildroot] [PATCH v2 03/54] package/kodi-screensaver-crystalmorph:
 remove package
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package received its last updates in 2017, is not part of the
official Kodi github repo and its build is broken with Kodi 19.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-crystalmorph/Config.in     | 10 ----------
 .../kodi-screensaver-crystalmorph.hash              |  3 ---
 .../kodi-screensaver-crystalmorph.mk                | 13 -------------
 package/kodi/Config.in                              |  1 -
 4 files changed, 27 deletions(-)
 delete mode 100644 package/kodi-screensaver-crystalmorph/Config.in
 delete mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
 delete mode 100644 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk

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
index ecc5a05324..745df41e20 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -356,7 +356,6 @@ menu "Screensavers"
 	source "package/kodi-screensaver-asterwave/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
 	source "package/kodi-screensaver-cpblobs/Config.in"
-	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-matrixtrails/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
-- 
2.29.2
