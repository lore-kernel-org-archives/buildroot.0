From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  6 Feb 2007 08:34:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070206163454.EB6FB48688@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-06 08:34:54 -0800 (Tue, 06 Feb 2007)
New Revision: 17793

Log:
Made _DIR/_SOURCE/_SITE common for all non-snapshot versions

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-02-06 16:31:59 UTC (rev 17792)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-02-06 16:34:54 UTC (rev 17793)
@@ -6,37 +6,22 @@
 
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_0_1)),y)
 BUSYBOX_VER:=1.01
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
-BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
-BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_1_3)),y)
 BUSYBOX_VER:=1.1.3
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
-BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
-BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_2_2_1)),y)
 BUSYBOX_VER:=1.2.2.1
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
-BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
-BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_0)),y)
 BUSYBOX_VER:=1.4.0
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
-BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
-BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_1)),y)
 BUSYBOX_VER:=1.4.1
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
-BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
-BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
@@ -44,6 +29,10 @@
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
+else
+BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
+BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
+BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 BUSYBOX_UNZIP=$(BZCAT)
