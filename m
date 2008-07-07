From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  7 Jul 2008 05:04:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/midori
Message-ID: <20080707120419.EC24EF8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-07 05:04:19 -0700 (Mon, 07 Jul 2008)
New Revision: 22672

Log:
Bump midori version

Added:
   trunk/buildroot/package/midori/midori-0.0.18-webkit.patch

Removed:
   trunk/buildroot/package/midori/midori-0.0.17-webkit.patch

Modified:
   trunk/buildroot/package/midori/midori.mk


Changeset:
Deleted: trunk/buildroot/package/midori/midori-0.0.17-webkit.patch
===================================================================
--- trunk/buildroot/package/midori/midori-0.0.17-webkit.patch	2008-07-07 11:09:20 UTC (rev 22671)
+++ trunk/buildroot/package/midori/midori-0.0.17-webkit.patch	2008-07-07 12:04:19 UTC (rev 22672)
@@ -1,67 +0,0 @@
-diff -rup midori-0.0.17-orig/configure.in midori-0.0.17/configure.in
---- midori-0.0.17-orig/configure.in	2008-01-23 21:47:18.000000000 -0500
-+++ midori-0.0.17/configure.in	2008-02-11 14:11:08.000000000 -0500
-@@ -53,13 +53,13 @@ GTK_VER=`pkg-config --modversion gtk+-2.
- AC_DEFINE_UNQUOTED([GTK_VER], "$GTK_VER", [GTK+ version])
- 
- # Checks for WebKitGtk
--PKG_CHECK_MODULES(WEBKIT, WebKitGtk, have_webkit=true, have_webkit=false)
-+PKG_CHECK_MODULES(WEBKIT, webkit-1.0, have_webkit=true, have_webkit=false)
- if test "x${have_webkit}" = "xfalse" ; then
-     AC_MSG_ERROR([No WebKitGtk package information found])
- fi
- AC_SUBST(WEBKIT_CFLAGS)
- AC_SUBST(WEBKIT_LIBS)
--WEBKIT_VER=`pkg-config --modversion WebKitGtk`
-+WEBKIT_VER=`pkg-config --modversion webkit-1.0`
- AC_DEFINE_UNQUOTED([WEBKIT_VER], "$WEBKITGTK_VER", [WebKitGtk version])
- 
- # Checks for libsexy
-diff -rup midori-0.0.17-orig/src/global.h midori-0.0.17/src/global.h
---- midori-0.0.17-orig/src/global.h	2008-01-22 21:13:40.000000000 -0500
-+++ midori-0.0.17/src/global.h	2008-02-11 14:01:54.000000000 -0500
-@@ -16,7 +16,7 @@
- #include "../katze/katze.h"
- 
- #include <gtk/gtk.h>
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- // -- globals
- 
-diff -rup midori-0.0.17-orig/src/helpers.c midori-0.0.17/src/helpers.c
---- midori-0.0.17-orig/src/helpers.c	2008-01-20 11:46:16.000000000 -0500
-+++ midori-0.0.17/src/helpers.c	2008-02-11 14:03:57.000000000 -0500
-@@ -16,7 +16,7 @@
- #include "../katze/katze.h"
- 
- #include <string.h>
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- GtkIconTheme* get_icon_theme(GtkWidget* widget)
- {
-diff -rup midori-0.0.17-orig/src/webSearch.h midori-0.0.17/src/webSearch.h
---- midori-0.0.17-orig/src/webSearch.h	2007-12-14 22:09:47.000000000 -0500
-+++ midori-0.0.17/src/webSearch.h	2008-02-11 14:03:25.000000000 -0500
-@@ -16,7 +16,7 @@
- 
- #include <gtk/gtk.h>
- #include <libsexy/sexy.h>
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- // -- Types
- 
-diff -rup midori-0.0.17-orig/src/webView.h midori-0.0.17/src/webView.h
---- midori-0.0.17-orig/src/webView.h	2008-01-04 02:46:44.000000000 -0500
-+++ midori-0.0.17/src/webView.h	2008-02-11 14:02:49.000000000 -0500
-@@ -16,7 +16,7 @@
- #include "browser.h"
- #include "debug.h"
- 
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- WebKitNavigationResponse
- on_webView_navigation_requested(GtkWidget* webView, WebKitWebFrame* frame

Copied: trunk/buildroot/package/midori/midori-0.0.18-webkit.patch (from rev 22671, trunk/buildroot/package/midori/midori-0.0.17-webkit.patch)
===================================================================
--- trunk/buildroot/package/midori/midori-0.0.18-webkit.patch	                        (rev 0)
+++ trunk/buildroot/package/midori/midori-0.0.18-webkit.patch	2008-07-07 12:04:19 UTC (rev 22672)
@@ -0,0 +1,67 @@
+diff -rup midori-0.0.17-orig/configure.in midori-0.0.17/configure.in
+--- midori-0.0.17-orig/configure.in	2008-01-23 21:47:18.000000000 -0500
++++ midori-0.0.17/configure.in	2008-02-11 14:11:08.000000000 -0500
+@@ -53,13 +53,13 @@ GTK_VER=`pkg-config --modversion gtk+-2.
+ AC_DEFINE_UNQUOTED([GTK_VER], "$GTK_VER", [GTK+ version])
+ 
+ # Checks for WebKitGtk
+-PKG_CHECK_MODULES(WEBKIT, WebKitGtk, have_webkit=true, have_webkit=false)
++PKG_CHECK_MODULES(WEBKIT, webkit-1.0, have_webkit=true, have_webkit=false)
+ if test "x${have_webkit}" = "xfalse" ; then
+     AC_MSG_ERROR([No WebKitGtk package information found])
+ fi
+ AC_SUBST(WEBKIT_CFLAGS)
+ AC_SUBST(WEBKIT_LIBS)
+-WEBKIT_VER=`pkg-config --modversion WebKitGtk`
++WEBKIT_VER=`pkg-config --modversion webkit-1.0`
+ AC_DEFINE_UNQUOTED([WEBKIT_VER], "$WEBKITGTK_VER", [WebKitGtk version])
+ 
+ # Checks for libsexy
+diff -rup midori-0.0.17-orig/src/global.h midori-0.0.17/src/global.h
+--- midori-0.0.17-orig/src/global.h	2008-01-22 21:13:40.000000000 -0500
++++ midori-0.0.17/src/global.h	2008-02-11 14:01:54.000000000 -0500
+@@ -16,7 +16,7 @@
+ #include "../katze/katze.h"
+ 
+ #include <gtk/gtk.h>
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ // -- globals
+ 
+diff -rup midori-0.0.17-orig/src/helpers.c midori-0.0.17/src/helpers.c
+--- midori-0.0.17-orig/src/helpers.c	2008-01-20 11:46:16.000000000 -0500
++++ midori-0.0.17/src/helpers.c	2008-02-11 14:03:57.000000000 -0500
+@@ -16,7 +16,7 @@
+ #include "../katze/katze.h"
+ 
+ #include <string.h>
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ GtkIconTheme* get_icon_theme(GtkWidget* widget)
+ {
+diff -rup midori-0.0.17-orig/src/webSearch.h midori-0.0.17/src/webSearch.h
+--- midori-0.0.17-orig/src/webSearch.h	2007-12-14 22:09:47.000000000 -0500
++++ midori-0.0.17/src/webSearch.h	2008-02-11 14:03:25.000000000 -0500
+@@ -16,7 +16,7 @@
+ 
+ #include <gtk/gtk.h>
+ #include <libsexy/sexy.h>
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ // -- Types
+ 
+diff -rup midori-0.0.17-orig/src/webView.h midori-0.0.17/src/webView.h
+--- midori-0.0.17-orig/src/webView.h	2008-01-04 02:46:44.000000000 -0500
++++ midori-0.0.17/src/webView.h	2008-02-11 14:02:49.000000000 -0500
+@@ -16,7 +16,7 @@
+ #include "browser.h"
+ #include "debug.h"
+ 
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ WebKitNavigationResponse
+ on_webView_navigation_requested(GtkWidget* webView, WebKitWebFrame* frame

Modified: trunk/buildroot/package/midori/midori.mk
===================================================================
--- trunk/buildroot/package/midori/midori.mk	2008-07-07 11:09:20 UTC (rev 22671)
+++ trunk/buildroot/package/midori/midori.mk	2008-07-07 12:04:19 UTC (rev 22672)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.0.17
+MIDORI_VERSION = 0.0.18
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.gz
 MIDORI_SITE = http://software.twotoasts.de/media/midori/
 MIDORI_AUTORECONF = YES
