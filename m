From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  9 Dec 2008 02:09:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20081209100915.896263C6D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-09 02:09:15 -0800 (Tue, 09 Dec 2008)
New Revision: 24343

Log:
binutils: fix typo for detecting if BINUTILS_NO_MPFR is not set

Make the ifndef check the actual variable, typo bug.



Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-09 10:04:47 UTC (rev 24342)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-09 10:09:15 UTC (rev 24343)
@@ -54,7 +54,7 @@
 BINUTILS_NO_MPFR:=y
 endif
 
-ifndef BINUTILS_NO_MPFR
+ifndef $(BINUTILS_NO_MPFR)
 BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_SHREXT) \
 	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_SHREXT)
 
