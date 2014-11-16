From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:21 +0100
Subject: [Buildroot] [RFC/PATCH v6 08/17] package/kodi-pvr-addons: Bump
	version for Helix-compatibility
In-Reply-To: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416167070-27299-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |   15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index 5e70bb3..f6b6ec6 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'gotham'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
+# This cset is on the branch 'master'
+# When Kodi is released this should be updated to the corresponding branch
+KODI_PVR_ADDONS_VERSION = 06842b90a383420650bd3e5c5b61acfc3f224d83
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
@@ -14,7 +14,7 @@ KODI_PVR_ADDONS_LICENSE_FILES = COPYING
 # There's no ./configure in the git tree, we need to generate it
 KODI_PVR_ADDONS_AUTORECONF = YES
 
-KODI_PVR_ADDONS_DEPENDENCIES = boost zlib
+KODI_PVR_ADDONS_DEPENDENCIES = zlib
 # This really is a runtime dependency, but we need KODI to be installed
 # first, since we'll install files in KODI's directories _after_ KODI has
 # installed its own files
@@ -24,11 +24,4 @@ KODI_PVR_ADDONS_CONF_OPTS = \
 	--enable-release \
 	--enable-addons-with-dependencies
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-KODI_PVR_ADDONS_CONF_OPTS += --enable-mysql
-KODI_PVR_ADDONS_DEPENDENCIES += mysql
-else
-KODI_PVR_ADDONS_CONF_OPTS += --disable-mysql
-endif
-
 $(eval $(autotools-package))
-- 
1.7.10.4
