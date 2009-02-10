From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 15:48:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20090210154820.CC5D076275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 15:48:19 +0000 (Tue, 10 Feb 2009)
New Revision: 25294

Log:
binutils: depend on static version of gmp/mpfr

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2009-02-10 15:19:57 UTC (rev 25293)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2009-02-10 15:48:19 UTC (rev 25294)
@@ -55,8 +55,8 @@
 endif
 
 ifndef BINUTILS_NO_MPFR
-BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_SHREXT) \
-	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_SHREXT)
+BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
+	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
 
 BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/usr/lib/libgmp$(LIBTGTEXT) \
 	$(TARGET_DIR)/usr/lib/libmpfr$(LIBTGTEXT)
