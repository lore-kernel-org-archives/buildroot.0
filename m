From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 06:58:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20080312135800.60398120150@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 06:57:59 -0700 (Wed, 12 Mar 2008)
New Revision: 21316

Log:
Fixed URL for fakeroot sources

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-12 13:53:02 UTC (rev 21315)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-12 13:57:59 UTC (rev 21316)
@@ -4,14 +4,13 @@
 #
 #############################################################
 FAKEROOT_VERSION:=1.9.3
-FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
+FAKEROOT_SOURCE:=fakeroot-$(FAKEROOT_VERSION).tar.gz
+FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/02/06/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
 FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
 FAKEROOT_DIR2:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-target
 
-
 $(DL_DIR)/$(FAKEROOT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(FAKEROOT_SITE)/$(FAKEROOT_SOURCE)
 
