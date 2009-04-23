From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 23 Apr 2009 18:59:34 +0000 (UTC)
Subject: [Buildroot] svn commit: [26197] trunk/buildroot/package/qtopia4
Message-ID: <20090423185934.ABCB576454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-23 18:59:34 +0000 (Thu, 23 Apr 2009)
New Revision: 26197

Log:
Update to 4.5.1

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-23 14:24:58 UTC (rev 26196)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-23 18:59:34 UTC (rev 26197)
@@ -20,7 +20,7 @@
 # x86 crosscompiling under linux x86. Please remove it when the workaround
 # is no longer necessary.
 
-QTOPIA4_VERSION:=4.5.0
+QTOPIA4_VERSION:=4.5.1
 QTOPIA4_CAT:=$(BZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
@@ -35,11 +35,12 @@
 QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
 QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
-QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2
+QTOPIA4_CONFIGURE+= -commercial
 else # Good, good, we are free:
 QTOPIA4_SITE=http://get.qtsoftware.com/qt/source
 QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
+QTOPIA4_CONFIGURE+= -opensource
 ifeq ($(BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED),y)
 QTOPIA4_CONFIGURE+= -confirm-license
 endif
