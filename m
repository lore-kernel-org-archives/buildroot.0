From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 18 Jan 2009 10:57:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20090118105725.52A2177108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-18 10:57:23 +0000 (Sun, 18 Jan 2009)
New Revision: 24900

Log:
Cleanup libgtk2, and prepare for 2.15

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 10:53:06 UTC (rev 24899)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-01-18 10:57:23 UTC (rev 24900)
@@ -3,9 +3,13 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION = 2.12.12
+#LIBGTK2_VERSION = 2.15.0
+LIBGTK2_VERSION_MAJOR:=2.12
+LIBGTK2_VERSION_MINOR:=12
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
+
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
-LIBGTK2_SITE = ftp://ftp.gtk.org/pub/gtk/2.12
+LIBGTK2_SITE = ftp://ftp.gtk.org/pub/gtk/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_AUTORECONF = NO
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_INSTALL_TARGET = YES
@@ -96,6 +100,10 @@
 	LIBGTK2_CONF_OPT += --without-x
 endif
 
+# Buildroot does not support JPEG2000 library
+ifeq ($(LIBGTK2_VERSION_MAJOR),2.15)
+LIBGTK2_CONF_OPT += --without-libjasper
+endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LIBGTK2_DEPENDENCIES += libpng
