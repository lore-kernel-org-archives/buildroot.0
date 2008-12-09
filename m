From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  9 Dec 2008 03:38:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20081209113852.A07733C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-09 03:38:52 -0800 (Tue, 09 Dec 2008)
New Revision: 24345

Log:
binutils: revert bad commit 24343

This reverst the commit 24343, the original state was indeed correct. Blame
goes to my bad sight and too hasty decisions.



Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-09 10:23:43 UTC (rev 24344)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-09 11:38:52 UTC (rev 24345)
@@ -54,7 +54,7 @@
 BINUTILS_NO_MPFR:=y
 endif
 
-ifndef $(BINUTILS_NO_MPFR)
+ifndef BINUTILS_NO_MPFR
 BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_SHREXT) \
 	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_SHREXT)
 
