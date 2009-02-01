From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Feb 2009 19:37:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20090201193710.3EEC97653E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-01 19:37:09 +0000 (Sun, 01 Feb 2009)
New Revision: 25208

Log:
mpfr: bump version

I know that changing something as fundamental as mpfr this close to the
release isn't really ideal, but it's listed as the minimum version
for gcc 4.3.x:

http://gcc.gnu.org/install/prerequisites.html

Bernhard's tree has been using 2.3.2 since October, so the risk is probably
not that big though.

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-02-01 19:37:06 UTC (rev 25207)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-02-01 19:37:09 UTC (rev 25208)
@@ -3,8 +3,8 @@
 # mpfr
 #
 #############################################################
-MPFR_VERSION:=2.3.0
-MPFR_PATCH:=patches
+MPFR_VERSION:=2.3.2
+#MPFR_PATCH:=patches
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
@@ -13,8 +13,7 @@
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
 MPFR_HOST_BINARY:=libmpfr$(HOST_SHREXT)
-MPFR_LIBVERSION:=1.0.1
-#MPFR_SVN_CMD:=svn co svn://scm.gforge.inria.fr/svn/mpfr/branches/2.3 mpfr-2.3
+MPFR_LIBVERSION:=1.1.2
 
 # need patch
 ifneq ($(MPFR_PATCH),)
