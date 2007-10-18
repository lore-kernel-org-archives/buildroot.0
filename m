From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Oct 2007 22:56:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20071018055605.BED72A65CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-17 22:56:05 -0700 (Wed, 17 Oct 2007)
New Revision: 20279

Log:
Remove hyphen from images if empty rootfs suffix

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-10-18 05:26:06 UTC (rev 20278)
+++ trunk/buildroot/package/Makefile.in	2007-10-18 05:56:05 UTC (rev 20279)
@@ -65,9 +65,12 @@
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
-ifeq ($(BR2_ROOTFS_SUFFIX),)
+#ifeq ($(BR2_ROOTFS_SUFFIX),)
+ROOTFS_SUFFIX:=$(strip $(subst ",, $(BR2_ROOTFS_SUFFIX)))
+ifeq ($(ROOTFS_SUFFIX),)
 ROOTFS_SUFFIX:=
 else
+XXXX=xxxx
 ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
@@ -315,3 +318,5 @@
 
 include package/Makefile.autotools.in
 
+package-status:
+	@echo	IMAGE=$(IMAGE)
