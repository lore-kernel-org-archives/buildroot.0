From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 May 2008 22:48:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080521054839.5B5853C671@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-20 22:48:38 -0700 (Tue, 20 May 2008)
New Revision: 22031

Log:
Bump qtopia version

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-05-20 21:35:55 UTC (rev 22030)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-05-21 05:48:38 UTC (rev 22031)
@@ -16,10 +16,8 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.4.0-snapshot-20080325
-# QTOPIA4_VERSION:=4.4.1-snapshot-20080511
-# QTOPIA4_VERSION:=4.5.0-snapshot-20080511
-QTOPIA4_CAT:=$(ZCAT)
+QTOPIA4_VERSION:=4.4.0
+QTOPIA4_CAT:=$(BZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
 #"))
@@ -29,14 +27,14 @@
 # What to download, free or commercial version.
 ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
 QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
-QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.gz
+QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
 QTOPIA4_NO_SQL_OCI:=-no-sql-oci
 QTOPIA4_NO_SQL_TDS:=-no-sql-tds
 QTOPIA4_NO_SQL_DB2:=-no-sql-db2
 else # Good, good, we are free:
-QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/snapshots
-QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.gz
+QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source
+QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
 ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
 QTOPIA4_APPROVE_GPL_LICENSE:=-confirm-license
