From: antab at uclibc.org <antab@uclibc.org>
Date: Sat,  1 Nov 2008 19:16:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081102021653.EF636F8036@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-11-01 19:16:53 -0700 (Sat, 01 Nov 2008)
New Revision: 23900

Log:
Fixes for Qt from Markus Heidelberg


Modified:
   trunk/buildroot/package/qtopia4/Config.gfx.in
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/Config.mouse.in
   trunk/buildroot/package/qtopia4/Config.sql.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.gfx.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.gfx.in	2008-11-02 00:55:41 UTC (rev 23899)
+++ trunk/buildroot/package/qtopia4/Config.gfx.in	2008-11-02 02:16:53 UTC (rev 23900)
@@ -6,18 +6,14 @@
 
 config BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED
 	bool "Transformed"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_GFX_QVFB
 	bool "Qt Virtual Framebuffer"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_GFX_VNC
 	bool "VNC"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
 	bool "multiscreen"
-	default y
 
 endmenu

Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-11-02 00:55:41 UTC (rev 23899)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-11-02 02:16:53 UTC (rev 23900)
@@ -185,7 +185,7 @@
 	  Select freetype2 support.
 
 config BR2_PACKAGE_QTOPIA4_NOFREETYPE
-        bool "no freetype2 support"
+	bool "no freetype2 support"
 	help
 	  Do not compile in Freetype2 support.
 

Modified: trunk/buildroot/package/qtopia4/Config.mouse.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.mouse.in	2008-11-02 00:55:41 UTC (rev 23899)
+++ trunk/buildroot/package/qtopia4/Config.mouse.in	2008-11-02 02:16:53 UTC (rev 23900)
@@ -2,30 +2,23 @@
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_PC
 	bool "pc"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_BUS
 	bool "bus"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP
 	bool "linuxtp"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_YOPY
 	bool "yopy"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX
-	bool "vxr41xx"
-	default n
+	bool "vr41xx"
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB
 	bool "tslib"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_QVFB
 	bool "qvfb"
-	default n
 
 endmenu

Modified: trunk/buildroot/package/qtopia4/Config.sql.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.sql.in	2008-11-02 00:55:41 UTC (rev 23899)
+++ trunk/buildroot/package/qtopia4/Config.sql.in	2008-11-02 02:16:53 UTC (rev 23900)
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
-    bool "SQL Module"
-    help
-      Compile Qtopia SQL Module
+	bool "SQL Module"
+	help
+	  Compile Qtopia SQL Module
 
 if BR2_PACKAGE_QTOPIA4_SQL_MODULE
 config BR2_PACKAGE_QTOPIA4_MYSQL

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-11-02 00:55:41 UTC (rev 23899)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-11-02 02:16:53 UTC (rev 23900)
@@ -95,32 +95,32 @@
 
 ### Mouse drivers
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_PC),y)
-QTOPIA4_CONFIGURE += qt-mouse-pc
+QTOPIA4_CONFIGURE += -qt-mouse-pc
 else
 QTOPIA4_CONFIGURE += -no-mouse-pc
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_BUS),y)
-QTOPIA4_CONFIGURE += qt-mouse-bus
+QTOPIA4_CONFIGURE += -qt-mouse-bus
 else
 QTOPIA4_CONFIGURE += -no-mouse-bus
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP),y)
-QTOPIA4_CONFIGURE += qt-mouse-linuxtp
+QTOPIA4_CONFIGURE += -qt-mouse-linuxtp
 else
 QTOPIA4_CONFIGURE += -no-mouse-linuxtp
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_YOPY),y)
-QTOPIA4_CONFIGURE += qt-mouse-yopy
+QTOPIA4_CONFIGURE += -qt-mouse-yopy
 else
 QTOPIA4_CONFIGURE += -no-mouse-yopy
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX),y)
-QTOPIA4_CONFIGURE += qt-mouse-vr41xx
+QTOPIA4_CONFIGURE += -qt-mouse-vr41xx
 else
 QTOPIA4_CONFIGURE += -no-mouse-vr41xx
 endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB),y)
-QTOPIA4_CONFIGURE += qt-mouse-tslib
+QTOPIA4_CONFIGURE += -qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
@@ -128,6 +128,11 @@
 else
 QTOPIA4_CONFIGURE += -no-mouse-tslib
 endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_QVFB),y)
+QTOPIA4_CONFIGURE += -qt-mouse-qvfb
+else
+QTOPIA4_CONFIGURE += -no-mouse-qvfb
+endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
 QTOPIA4_CONFIGURE+= "-debug $(QTOPIA4_TSLIB_DEB)"
