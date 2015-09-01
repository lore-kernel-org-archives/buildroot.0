From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:10 +0200
Subject: [Buildroot] [PATCHv3 09/15] divine: remove package
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441144876-2628-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes the divine package, since the corresponding
functionality has been merged in DirectFB itself since 1.7.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy         | 13 +++++++++++++
 package/Config.in        |  1 -
 package/divine/Config.in |  8 --------
 package/divine/divine.mk | 19 -------------------
 4 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 package/divine/Config.in
 delete mode 100644 package/divine/divine.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3330566..3d4551c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -105,6 +105,19 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2015.11"
+
+config BR2_PACKAGE_DIVINE
+	bool "divine package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DIRECTFB_DIVINE
+	help
+	  This option has been removed because the divine package no
+	  longer exists: it was merged inside DirectFB itself. This
+	  feature can now be enabled using the
+	  BR2_PACKAGE_DIRECTFB_DIVINE option.
+
+###############################################################################
 comment "Legacy options removed in 2015.08"
 
 config BR2_PACKAGE_KODI_PVR_ADDONS
diff --git a/package/Config.in b/package/Config.in
index 58b7380..be1c18f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -227,7 +227,6 @@ comment "Graphic libraries"
 	source "package/cegui06/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
-	source "package/divine/Config.in"
 	source "package/fbdump/Config.in"
 	source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/divine/Config.in b/package/divine/Config.in
deleted file mode 100644
index 7909004..0000000
--- a/package/divine/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_DIVINE
-	bool "directfb virtual input extension"
-	depends on BR2_PACKAGE_DIRECTFB
-	help
-	  DiVine provides a DirectFB input driver that reads input
-	  events from a pipe and dispatches them via a virtual input
-	  device. It also installs the tool 'spooky' that allows to
-	  send input events to DirectFB applications.
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
deleted file mode 100644
index 322e5fc..0000000
--- a/package/divine/divine.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# divine
-#
-################################################################################
-
-# tagged version 1.6.3, tarball is missing files
-DIVINE_VERSION = 83cafc257a42b9465cd9d6185bf66b8c1b7ed704
-DIVINE_SITE = git://git.directfb.org/git/directfb/extras/DiVine.git
-DIVINE_LICENSE = LGPLv2.1+
-DIVINE_LICENSE_FILES = COPYING
-DIVINE_INSTALL_STAGING = YES
-DIVINE_DEPENDENCIES = directfb
-DIVINE_CONFIG_SCRIPTS = divine-config
-
-# package has no configure script so we have to generate it
-DIVINE_AUTORECONF = YES
-
-$(eval $(autotools-package))
-- 
2.5.1
