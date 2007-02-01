From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  1 Feb 2007 11:20:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20070201192016.6D951485AF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-01 11:20:16 -0800 (Thu, 01 Feb 2007)
New Revision: 17699

Log:
bump version


Removed:
   trunk/buildroot/package/libglib2/configure-libtool.patch

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Deleted: trunk/buildroot/package/libglib2/configure-libtool.patch
===================================================================
--- trunk/buildroot/package/libglib2/configure-libtool.patch	2007-02-01 19:19:59 UTC (rev 17698)
+++ trunk/buildroot/package/libglib2/configure-libtool.patch	2007-02-01 19:20:16 UTC (rev 17699)
@@ -1,11 +0,0 @@
---- glib-2.8.4/configure.in.orig	2006-06-05 13:34:08.000000000 +0100
-+++ glib-2.8.4/configure.in	2006-06-05 13:34:36.000000000 +0100
-@@ -1106,7 +1106,7 @@
-   dnl No use for this on Win32
-   G_MODULE_LDFLAGS=
- else
--  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- fi
- dnl G_MODULE_IMPL= don't reset, so cmd-line can override
- G_MODULE_NEED_USCORE=0

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2007-02-01 19:19:59 UTC (rev 17698)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-02-01 19:20:16 UTC (rev 17699)
@@ -3,7 +3,7 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION:=2.12.6
+LIBGLIB2_VERSION:=2.12.9
 LIBGLIB2_SOURCE:=glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.12
 LIBGLIB2_CAT:=$(BZCAT)
