From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:29 +0100
Subject: [Buildroot] [git commit] package/xbmc-addon-xvdr: rename to
	kodi-addon-xvdr
Message-ID: <20141227185849.85A7B80471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db78eb071546c74b7d2e06c9a567e5a3887880c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the rename of the XBMC project to Kodi, this commit renames
the xbmc-addon-xvdr package to kodi-addon-xvdr, and adds the
appropriate Config.in.legacy handling.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    7 +++++++
 .../{xbmc-addon-xvdr => kodi-addon-xvdr}/Config.in |    8 ++++----
 .../kodi-addon-xvdr.mk}                            |   20 ++++++++++----------
 package/kodi/Config.in                             |    2 +-
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 653eeac..de2c0ba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,13 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_XBMC_ADDON_XVDR
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_ADDON_XVDR
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
 config BR2_PACKAGE_XBMC_PVR_ADDONS
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
diff --git a/package/xbmc-addon-xvdr/Config.in b/package/kodi-addon-xvdr/Config.in
similarity index 68%
rename from package/xbmc-addon-xvdr/Config.in
rename to package/kodi-addon-xvdr/Config.in
index 7329a9a..6e713af 100644
--- a/package/xbmc-addon-xvdr/Config.in
+++ b/package/kodi-addon-xvdr/Config.in
@@ -1,8 +1,8 @@
-config BR2_PACKAGE_XBMC_ADDON_XVDR
-	bool "xbmc-addon-xvdr"
+config BR2_PACKAGE_KODI_ADDON_XVDR
+	bool "kodi-addon-xvdr"
 	help
-	  This is a PVR add-on for XBMC to add VDR (http://tvdr.de/)
-	  as a TV/PVR Backend to XBMC.
+	  This is a PVR add-on for Kodi to add VDR (http://tvdr.de/)
+	  as a TV/PVR Backend to Kodi.
 
 	  It adds support for Live TV watching, replaying of Recordings,
 	  programming Timers and EPG TV Guide to use on same computer or
diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
similarity index 53%
rename from package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
rename to package/kodi-addon-xvdr/kodi-addon-xvdr.mk
index 16f3a0d..14b08fe 100644
--- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
@@ -1,26 +1,26 @@
 ################################################################################
 #
-# xbmc-addon-xvdr
+# kodi-addon-xvdr
 #
 ################################################################################
 
 # This cset is on master. When a Gotham branch is made, we should
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
-XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
-XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
-XBMC_ADDON_XVDR_LICENSE = GPLv2+
-XBMC_ADDON_XVDR_LICENSE_FILES = COPYING
+KODI_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
+KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
+KODI_ADDON_XVDR_LICENSE = GPLv2+
+KODI_ADDON_XVDR_LICENSE_FILES = COPYING
 
 # There's no ./configure in the git tree, we need to generate it
-# xbmc-addon-xvdr uses a weird autogen.sh script, which
+# kodi-addon-xvdr uses a weird autogen.sh script, which
 # is even incorrect (it's missing the #! ) Sigh... :-(
 # Fortunately, with our little patch, it autoreconfs nicely! :-)
-XBMC_ADDON_XVDR_AUTORECONF = YES
+KODI_ADDON_XVDR_AUTORECONF = YES
 
-# This really is a runtime dependency, but we need XBMC to be installed
-# first, since we'll install files in XBMC's directories _after_ XBMC has
+# This really is a runtime dependency, but we need KODI to be installed
+# first, since we'll install files in KODI's directories _after_ KODI has
 # installed his own files
-XBMC_ADDON_XVDR_DEPENDENCIES = kodi
+KODI_ADDON_XVDR_DEPENDENCIES = kodi
 
 $(eval $(autotools-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d1286b7..4bc0178 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -237,7 +237,7 @@ config BR2_PACKAGE_KODI_WAVPACK
 
 comment "Kodi addons"
 
-source "package/xbmc-addon-xvdr/Config.in"
+source "package/kodi-addon-xvdr/Config.in"
 source "package/kodi-pvr-addons/Config.in"
 
 endif # BR2_PACKAGE_KODI
