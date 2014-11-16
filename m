From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:20 +0100
Subject: [Buildroot] [RFC/PATCH v6 07/17] Rename xbmc-pvr-addons to
	kodi-pvr-addons - part II - rename variables
In-Reply-To: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416167070-27299-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- adjust Config.in.legacy

The "Rename xbmc-pvr-addons to kodi-pvr-addons"-patch is split into
two parts for easier review, please apply both patches in one commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                           |    7 +++++++
 package/kodi-pvr-addons/Config.in          |    6 +++---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |   30 ++++++++++++++--------------
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c865e8..a642b14 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_PACKAGE_XBMC_PVR_ADDONS
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_PVR_ADDONS
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
 config BR2_PACKAGE_XBMC
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
diff --git a/package/kodi-pvr-addons/Config.in b/package/kodi-pvr-addons/Config.in
index 27f20e3..80916c7 100644
--- a/package/kodi-pvr-addons/Config.in
+++ b/package/kodi-pvr-addons/Config.in
@@ -1,6 +1,6 @@
-config BR2_PACKAGE_XBMC_PVR_ADDONS
-	bool "xbmc-pvr-addons"
+config BR2_PACKAGE_KODI_PVR_ADDONS
+	bool "kodi-pvr-addons"
 	help
-	  A collection of PVR backend addons for XBMC.
+	  A collection of PVR backend addons for Kodi
 
 	  https://github.com/opdenkamp/xbmc-pvr-addons
diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index 4410153..5e70bb3 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -1,34 +1,34 @@
 ################################################################################
 #
-# xbmc-pvr-addons
+# kodi-pvr-addons
 #
 ################################################################################
 
 # This cset is on the branch 'gotham'
-# When XBMC is updated, then this should be updated to the corresponding branch
-XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
-XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
-XBMC_PVR_ADDONS_LICENSE = GPLv3+
-XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
+KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
+KODI_PVR_ADDONS_LICENSE = GPLv3+
+KODI_PVR_ADDONS_LICENSE_FILES = COPYING
 
 # There's no ./configure in the git tree, we need to generate it
-XBMC_PVR_ADDONS_AUTORECONF = YES
+KODI_PVR_ADDONS_AUTORECONF = YES
 
-XBMC_PVR_ADDONS_DEPENDENCIES = boost zlib
-# This really is a runtime dependency, but we need XBMC to be installed
-# first, since we'll install files in XBMC's directories _after_ XBMC has
+KODI_PVR_ADDONS_DEPENDENCIES = boost zlib
+# This really is a runtime dependency, but we need KODI to be installed
+# first, since we'll install files in KODI's directories _after_ KODI has
 # installed its own files
-XBMC_PVR_ADDONS_DEPENDENCIES += kodi
+KODI_PVR_ADDONS_DEPENDENCIES += kodi
 
-XBMC_PVR_ADDONS_CONF_OPTS = \
+KODI_PVR_ADDONS_CONF_OPTS = \
 	--enable-release \
 	--enable-addons-with-dependencies
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-XBMC_PVR_ADDONS_CONF_OPTS += --enable-mysql
-XBMC_PVR_ADDONS_DEPENDENCIES += mysql
+KODI_PVR_ADDONS_CONF_OPTS += --enable-mysql
+KODI_PVR_ADDONS_DEPENDENCIES += mysql
 else
-XBMC_PVR_ADDONS_CONF_OPTS += --disable-mysql
+KODI_PVR_ADDONS_CONF_OPTS += --disable-mysql
 endif
 
 $(eval $(autotools-package))
-- 
1.7.10.4
