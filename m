From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:45 +0200
Subject: [Buildroot] [git commit] kodi-addon-xvdr: remove deprecated package
Message-ID: <20161015211550.48F7380262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c2a63ad6d724d933cbb2a43d5dd08f19c5c17e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                | 15 +++++++++++---
 package/kodi-addon-xvdr/0001-xbmc-rebrand.patch | 19 ------------------
 package/kodi-addon-xvdr/Config.in               | 16 ---------------
 package/kodi-addon-xvdr/kodi-addon-xvdr.hash    |  2 --
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk      | 26 -------------------------
 package/kodi/Config.in                          |  1 -
 6 files changed, 12 insertions(+), 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c27ae3d..5e65d7b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_KODI_ADDON_XVDR
+	bool "kodi-addon-xvdr removed"
+	select BR2_LEGACY
+	help
+	  According to the github project page:
+	  https://github.com/pipelka/xbmc-addon-xvdr
+	  this package is discontinued.
+
 config BR2_PACKAGE_IPKG
 	bool "ipkg removed"
 	select BR2_LEGACY
@@ -1366,11 +1374,12 @@ config BR2_PACKAGE_STRONGSWAN_TOOLS
 	  deprecated.
 
 config BR2_PACKAGE_XBMC_ADDON_XVDR
-	bool "xbmc options have been renamed"
+	bool "xbmc-addon-xvdr removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_KODI_ADDON_XVDR
 	help
-	  The XBMC media center project was renamed to Kodi entertainment center
+	  According to the github project page:
+	  https://github.com/pipelka/xbmc-addon-xvdr
+	  this package is discontinued.
 
 config BR2_PACKAGE_XBMC_PVR_ADDONS
 	bool "xbmc options have been renamed"
diff --git a/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch b/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch
deleted file mode 100644
index 6e87b79..0000000
--- a/package/kodi-addon-xvdr/0001-xbmc-rebrand.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Update for Kodi
-
-Ported from OpenELEC:
-https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/kodi-addon-xvdr/patches/kodi-addon-xvdr-xbmc-rebrand.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Naur xbmc-addon-xvdr-2bf2563/configure.ac xbmc-addon-xvdr-2bf2563.patch/configure.ac
---- xbmc-addon-xvdr-2bf2563/configure.ac	2014-10-18 22:02:18.000000000 +0200
-+++ xbmc-addon-xvdr-2bf2563.patch/configure.ac	2014-10-20 03:03:20.525526996 +0200
-@@ -6,7 +6,7 @@
- AC_INIT([xbmc-addon-xvdr], [MAJOR.MINOR.MICRO], [alexander.pipelka at gmail.com])
- 
- AC_CONFIG_AUX_DIR(autotools)
--AC_PREFIX_DEFAULT(/usr/lib/xbmc)
-+AC_PREFIX_DEFAULT(/usr/lib/kodi)
- 
- AC_CANONICAL_HOST
- AC_CANONICAL_TARGET
diff --git a/package/kodi-addon-xvdr/Config.in b/package/kodi-addon-xvdr/Config.in
deleted file mode 100644
index 85e9d60..0000000
--- a/package/kodi-addon-xvdr/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_KODI_ADDON_XVDR
-	bool "kodi-addon-xvdr"
-	# upstream discontinued the development
-	depends on BR2_DEPRECATED_SINCE_2016_05
-	help
-	  This is a PVR add-on for Kodi to add VDR (http://tvdr.de/)
-	  as a TV/PVR Backend to Kodi.
-
-	  It adds support for Live TV watching, replaying of Recordings,
-	  programming Timers and EPG TV Guide to use on same computer or
-	  over the Network.
-
-	  https://github.com/pipelka/xbmc-addon-xvdr
-
-	  Note: since the VDR server is not packaged in Buildroot, using
-	  this addon requires that a remote VDR server be used.
diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.hash b/package/kodi-addon-xvdr/kodi-addon-xvdr.hash
deleted file mode 100644
index 933c7b8..0000000
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256	783796eccc19c639c59b7a05cad1df705d557993b15cc7e29f7dbbd8388d698b	kodi-addon-xvdr-ae66610bc2e1a3efe49f4fa0db55ff3a7808a247.tar.gz
diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
deleted file mode 100644
index ac7f3cb..0000000
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# kodi-addon-xvdr
-#
-################################################################################
-
-# This cset is on master. When a Jarvis branch is made, we should
-# follow it, as incompatible changes in the plugins API can happen
-# on the master branch.
-KODI_ADDON_XVDR_VERSION = ae66610bc2e1a3efe49f4fa0db55ff3a7808a247
-KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
-KODI_ADDON_XVDR_LICENSE = GPLv2+
-KODI_ADDON_XVDR_LICENSE_FILES = COPYING
-
-# There's no ./configure in the git tree, we need to generate it
-# kodi-addon-xvdr uses a weird autogen.sh script, which
-# is even incorrect (it's missing the #! ) Sigh... :-(
-# Fortunately, with our little patch, it autoreconfs nicely! :-)
-KODI_ADDON_XVDR_AUTORECONF = YES
-
-# This really is a runtime dependency, but we need KODI to be installed
-# first, since we'll install files in KODI's directories _after_ KODI has
-# installed his own files
-KODI_ADDON_XVDR_DEPENDENCIES = kodi
-
-$(eval $(autotools-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4174c6b..f2a3e2e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -279,7 +279,6 @@ menu "Audio encoder addons"
 endmenu
 
 menu "PVR addons"
-	source "package/kodi-addon-xvdr/Config.in"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
