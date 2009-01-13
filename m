From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 13 Jan 2009 18:42:39 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
Message-ID: <20090113184239.59FEF76C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-13 18:42:37 +0000 (Tue, 13 Jan 2009)
New Revision: 24819

Log:
Use GNU_MIRROR for libcgicc since www.cgicc.org is gone, change bz2 to gz and bump version

Modified:
   trunk/buildroot/package/libcgicc/libcgicc.mk


Changeset:
Modified: trunk/buildroot/package/libcgicc/libcgicc.mk
===================================================================
--- trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-13 16:57:21 UTC (rev 24818)
+++ trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-13 18:42:37 UTC (rev 24819)
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-LIBCGICC_VERSION=3.2.3
+LIBCGICC_VERSION=3.2.7
 LIBCGICC_DIR=$(BUILD_DIR)/cgicc-$(LIBCGICC_VERSION)
-LIBCGICC_SITE=http://www.cgicc.org/files
-LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.bz2
-LIBCGICC_CAT:=$(BZCAT)
+LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
+LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
+LIBCGICC_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(LIBCGICC_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBCGICC_SITE)/$(LIBCGICC_SOURCE)
