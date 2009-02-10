From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 16:38:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20090210163854.C10CA765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 16:38:53 +0000 (Tue, 10 Feb 2009)
New Revision: 25295

Log:
gmp/mpfr: use static libraries as make targets

The host shared objects are no more.

Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2009-02-10 15:48:19 UTC (rev 25294)
+++ trunk/buildroot/package/gmp/gmp.mk	2009-02-10 16:38:53 UTC (rev 25295)
@@ -10,7 +10,7 @@
 GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp$(LIBTGTEXT)
-GMP_HOST_BINARY:=libgmp$(HOST_SHREXT)
+GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
 GMP_LIBVERSION:=3.4.2
 
 # this is a workaround for a bug in GMP, please see

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-02-10 15:48:19 UTC (rev 25294)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-02-10 16:38:53 UTC (rev 25295)
@@ -12,7 +12,7 @@
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
-MPFR_HOST_BINARY:=libmpfr$(HOST_SHREXT)
+MPFR_HOST_BINARY:=libmpfr$(HOST_LIBEXT)
 MPFR_LIBVERSION:=1.1.2
 
 # need patch
