From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 03:23:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20070926102333.E52393004A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 03:23:31 -0700 (Wed, 26 Sep 2007)
New Revision: 20036

Log:
Document bugs in qtopia build, remove qt-mouse-tslib which breaks the build

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2007-09-26 10:21:18 UTC (rev 20035)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2007-09-26 10:23:31 UTC (rev 20036)
@@ -15,6 +15,11 @@
 #
 ######################################################################
 
+# BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
+# instead of at "dbus/dbus.h"
+# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus) 
+# to fix
+
 QTOPIA4_VERSION:=4.3.1
 QTOPIA4_CAT:=$(ZCAT)
 
@@ -79,7 +84,8 @@
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
-QTOPIA4_TSLIB=-qt-mouse-tslib
+#BUG: Qtopia refuse to recognize -qt-mouse-tslib
+#QTOPIA4_TSLIB=-qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
