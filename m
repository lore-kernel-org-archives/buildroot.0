From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 18:06:41 +0100
Subject: [Buildroot] [PATCH 2/7] Remove XTrap (app,
	lib & proto) as removed from X11R7.5
In-Reply-To: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271264806-23336-3-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                            |    3 ---
 package/x11r7/xapp_xtrap/Config.in                 |    7 -------
 package/x11r7/xapp_xtrap/xapp_xtrap.mk             |   13 -------------
 package/x11r7/xlib_libXTrap/Config.in              |    9 ---------
 package/x11r7/xlib_libXTrap/xlib_libXTrap.mk       |   15 ---------------
 package/x11r7/xproto_trapproto/Config.in           |    6 ------
 package/x11r7/xproto_trapproto/xproto_trapproto.mk |   15 ---------------
 7 files changed, 0 insertions(+), 68 deletions(-)
 delete mode 100644 package/x11r7/xapp_xtrap/Config.in
 delete mode 100644 package/x11r7/xapp_xtrap/xapp_xtrap.mk
 delete mode 100644 package/x11r7/xlib_libXTrap/Config.in
 delete mode 100644 package/x11r7/xlib_libXTrap/xlib_libXTrap.mk
 delete mode 100644 package/x11r7/xproto_trapproto/Config.in
 delete mode 100644 package/x11r7/xproto_trapproto/xproto_trapproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index a333718..9c43aca 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -50,7 +50,6 @@ endmenu
 		source package/x11r7/xlib_libSM/Config.in
 		source package/x11r7/xlib_libX11/Config.in
 		source package/x11r7/xlib_libXScrnSaver/Config.in
-		source package/x11r7/xlib_libXTrap/Config.in
 		source package/x11r7/xlib_libXau/Config.in
 		source package/x11r7/xlib_libXaw/Config.in
 		source package/x11r7/xlib_libXcomposite/Config.in
@@ -169,7 +168,6 @@ endmenu
 		source package/x11r7/xapp_xsetroot/Config.in
 		source package/x11r7/xapp_xsm/Config.in
 		source package/x11r7/xapp_xstdcmap/Config.in
-		source package/x11r7/xapp_xtrap/Config.in
 		source package/x11r7/xapp_xvidtune/Config.in
 		source package/x11r7/xapp_xvinfo/Config.in
 		source package/x11r7/xapp_xwd/Config.in
@@ -295,7 +293,6 @@ endmenu
 		source package/x11r7/xproto_renderproto/Config.in
 		source package/x11r7/xproto_resourceproto/Config.in
 		source package/x11r7/xproto_scrnsaverproto/Config.in
-		source package/x11r7/xproto_trapproto/Config.in
 		source package/x11r7/xproto_videoproto/Config.in
 		source package/x11r7/xproto_windowswmproto/Config.in
 		source package/x11r7/xproto_xcmiscproto/Config.in
diff --git a/package/x11r7/xapp_xtrap/Config.in b/package/x11r7/xapp_xtrap/Config.in
deleted file mode 100644
index 55cb418..0000000
--- a/package/x11r7/xapp_xtrap/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XTRAP
-	bool "xtrap"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXTRAP
-	help
-	  xtrap 1.0.2
-	  X.Org xtrap application
diff --git a/package/x11r7/xapp_xtrap/xapp_xtrap.mk b/package/x11r7/xapp_xtrap/xapp_xtrap.mk
deleted file mode 100644
index a31279b..0000000
--- a/package/x11r7/xapp_xtrap/xapp_xtrap.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xtrap -- X.Org xtrap application
-#
-################################################################################
-
-XAPP_XTRAP_VERSION = 1.0.2
-XAPP_XTRAP_SOURCE = xtrap-$(XAPP_XTRAP_VERSION).tar.bz2
-XAPP_XTRAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XTRAP_AUTORECONF = NO
-XAPP_XTRAP_DEPENDENCIES = xlib_libX11 xlib_libXTrap
-
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xtrap))
diff --git a/package/x11r7/xlib_libXTrap/Config.in b/package/x11r7/xlib_libXTrap/Config.in
deleted file mode 100644
index 72ecf5b..0000000
--- a/package/x11r7/xlib_libXTrap/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXTRAP
-	bool "libXTrap"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_TRAPPROTO
-	help
-	  libXTrap 1.0.0
-	  X.Org XTrap library
diff --git a/package/x11r7/xlib_libXTrap/xlib_libXTrap.mk b/package/x11r7/xlib_libXTrap/xlib_libXTrap.mk
deleted file mode 100644
index 5b7982a..0000000
--- a/package/x11r7/xlib_libXTrap/xlib_libXTrap.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xlib_libXTrap -- X.Org XTrap library
-#
-################################################################################
-
-XLIB_LIBXTRAP_VERSION = 1.0.0
-XLIB_LIBXTRAP_SOURCE = libXTrap-$(XLIB_LIBXTRAP_VERSION).tar.bz2
-XLIB_LIBXTRAP_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXTRAP_AUTORECONF = NO
-XLIB_LIBXTRAP_INSTALL_STAGING = YES
-XLIB_LIBXTRAP_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXext xproto_trapproto
-XLIB_LIBXTRAP_CONF_OPT = --enable-shared --disable-static
-
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXTrap))
diff --git a/package/x11r7/xproto_trapproto/Config.in b/package/x11r7/xproto_trapproto/Config.in
deleted file mode 100644
index 0f9c470..0000000
--- a/package/x11r7/xproto_trapproto/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XPROTO_TRAPPROTO
-	bool "trapproto"
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  trapproto 3.4.3
-	  X.Org Trap protocol headers
diff --git a/package/x11r7/xproto_trapproto/xproto_trapproto.mk b/package/x11r7/xproto_trapproto/xproto_trapproto.mk
deleted file mode 100644
index 29c4356..0000000
--- a/package/x11r7/xproto_trapproto/xproto_trapproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_trapproto -- X.Org Trap protocol headers
-#
-################################################################################
-
-XPROTO_TRAPPROTO_VERSION = 3.4.3
-XPROTO_TRAPPROTO_SOURCE = trapproto-$(XPROTO_TRAPPROTO_VERSION).tar.bz2
-XPROTO_TRAPPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_TRAPPROTO_AUTORECONF = NO
-XPROTO_TRAPPROTO_INSTALL_STAGING = YES
-XPROTO_TRAPPROTO_INSTALL_TARGET = NO
-XPROTO_TRAPPROTO_DEPENDENCIES = xlib_libXt
-
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_trapproto))
-- 
1.7.0
