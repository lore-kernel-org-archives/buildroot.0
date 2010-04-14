From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 17:31:54 +0100
Subject: [Buildroot] [PATCH 4/7] Remove XEvIE (app & proto) as removed from
	X11R7.5
In-Reply-To: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
References: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271262717-2253-5-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                        |    2 --
 package/x11r7/xlib_libXevie/Config.in          |    9 ---------
 package/x11r7/xlib_libXevie/xlib_libXevie.mk   |   15 ---------------
 package/x11r7/xproto_evieext/Config.in         |    4 ----
 package/x11r7/xproto_evieext/xproto_evieext.mk |   14 --------------
 5 files changed, 0 insertions(+), 44 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXevie/Config.in
 delete mode 100644 package/x11r7/xlib_libXevie/xlib_libXevie.mk
 delete mode 100644 package/x11r7/xproto_evieext/Config.in
 delete mode 100644 package/x11r7/xproto_evieext/xproto_evieext.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 74c6510..55524a0 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -56,7 +56,6 @@ endmenu
 		source package/x11r7/xlib_libXcursor/Config.in
 		source package/x11r7/xlib_libXdamage/Config.in
 		source package/x11r7/xlib_libXdmcp/Config.in
-		source package/x11r7/xlib_libXevie/Config.in
 		source package/x11r7/xlib_libXext/Config.in
 		source package/x11r7/xlib_libXfixes/Config.in
 		source package/x11r7/xlib_libXfont/Config.in
@@ -279,7 +278,6 @@ endmenu
 		source package/x11r7/xproto_damageproto/Config.in
 		source package/x11r7/xproto_dmxproto/Config.in
 		source package/x11r7/xproto_dri2proto/Config.in
-		source package/x11r7/xproto_evieext/Config.in
 		source package/x11r7/xproto_fixesproto/Config.in
 		source package/x11r7/xproto_fontcacheproto/Config.in
 		source package/x11r7/xproto_fontsproto/Config.in
diff --git a/package/x11r7/xlib_libXevie/Config.in b/package/x11r7/xlib_libXevie/Config.in
deleted file mode 100644
index 9b5e52e..0000000
--- a/package/x11r7/xlib_libXevie/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXEVIE
-	bool "libXevie"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_EVIEEXT
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  libXevie 1.0.2
-	  X.Org Xevie library
diff --git a/package/x11r7/xlib_libXevie/xlib_libXevie.mk b/package/x11r7/xlib_libXevie/xlib_libXevie.mk
deleted file mode 100644
index 4a09c29..0000000
--- a/package/x11r7/xlib_libXevie/xlib_libXevie.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xlib_libXevie -- X.Org Xevie library
-#
-################################################################################
-
-XLIB_LIBXEVIE_VERSION = 1.0.2
-XLIB_LIBXEVIE_SOURCE = libXevie-$(XLIB_LIBXEVIE_VERSION).tar.bz2
-XLIB_LIBXEVIE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXEVIE_AUTORECONF = NO
-XLIB_LIBXEVIE_INSTALL_STAGING = YES
-XLIB_LIBXEVIE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_evieext xproto_xproto
-XLIB_LIBXEVIE_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXevie))
diff --git a/package/x11r7/xproto_evieext/Config.in b/package/x11r7/xproto_evieext/Config.in
deleted file mode 100644
index 95bfd6f..0000000
--- a/package/x11r7/xproto_evieext/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_EVIEEXT
-	bool "evieext"
-	help
-	  X.Org EvIE protocol headers
diff --git a/package/x11r7/xproto_evieext/xproto_evieext.mk b/package/x11r7/xproto_evieext/xproto_evieext.mk
deleted file mode 100644
index 1c45f12..0000000
--- a/package/x11r7/xproto_evieext/xproto_evieext.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_evieext -- X.Org EvIE protocol headers
-#
-################################################################################
-
-XPROTO_EVIEEXT_VERSION = 1.1.0
-XPROTO_EVIEEXT_SOURCE = evieext-$(XPROTO_EVIEEXT_VERSION).tar.bz2
-XPROTO_EVIEEXT_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_EVIEEXT_AUTORECONF = NO
-XPROTO_EVIEEXT_INSTALL_STAGING = YES
-XPROTO_EVIEEXT_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_evieext))
-- 
1.7.0
