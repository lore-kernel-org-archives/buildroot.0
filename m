From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:08 +0200
Subject: [Buildroot] [PATCH v6 07/25] package/kodi-screensaver-planestate:
 remove package
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is incompatible with Kodi 18.x, configure is broken:

CMake Error at output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/share/kodi/cmake/AddonHelpers.cmake:197 (message):
  "@ADDON_DEPENDS@" not found in addon.xml.in.

This package is also not part of the upstream binary repo:
https://github.com/xbmc/repo-binary-addons

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                      |  6 ++++++
 package/kodi-screensaver-planestate/Config.in         | 11 -----------
 .../kodi-screensaver-planestate.hash                  |  2 --
 .../kodi-screensaver-planestate.mk                    | 11 -----------
 package/kodi/Config.in                                |  1 -
 5 files changed, 6 insertions(+), 25 deletions(-)
 delete mode 100644 package/kodi-screensaver-planestate/Config.in
 delete mode 100644 package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
 delete mode 100644 package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e3e83b43d6..67d696a259 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
+	bool "kodi-screensaver-planestate package was removed"
+	select BR2_LEGACY
+	help
+	  This package is incompatible with Kodi 18.x.
+
 config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE
 	bool "kodi-visualisation-waveforhue package was removed"
 	select BR2_LEGACY
diff --git a/package/kodi-screensaver-planestate/Config.in b/package/kodi-screensaver-planestate/Config.in
deleted file mode 100644
index b63d70e641..0000000000
--- a/package/kodi-screensaver-planestate/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
-	bool "kodi-screensaver-planestate"
-	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
-	select BR2_PACKAGE_LIBSOIL
-	help
-	  PlaneState screensaver for Kodi
-
-	  https://github.com/notspiff/screensaver.planestate
-
-comment "kodi-screensaver-planestate needs OpenGL"
-	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
deleted file mode 100644
index de5f6cf5d3..0000000000
--- a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 6059630e56bd022a27f73fe7c94fcf6a66792e7bb10f54a7893f536c23b95b99  kodi-screensaver-planestate-5341406dd05439a1a0245ab3f6d1a8964461d0e5.tar.gz
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
deleted file mode 100644
index 0e90ffc5d1..0000000000
--- a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# kodi-screensaver-planestate
-#
-################################################################################
-
-KODI_SCREENSAVER_PLANESTATE_VERSION = 5341406dd05439a1a0245ab3f6d1a8964461d0e5
-KODI_SCREENSAVER_PLANESTATE_SITE = $(call github,notspiff,screensaver.planestate,$(KODI_SCREENSAVER_PLANESTATE_VERSION))
-KODI_SCREENSAVER_PLANESTATE_DEPENDENCIES = kodi libsoil
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2cef12ea6b..e8a504312c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -343,7 +343,6 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-matrixtrails/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
-	source "package/kodi-screensaver-planestate/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
 	source "package/kodi-screensaver-rsxs/Config.in"
 	source "package/kodi-screensaver-stars/Config.in"
-- 
2.20.1
