From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 03:38:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061222113808.2BF924858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 03:38:07 -0800 (Fri, 22 Dec 2006)
New Revision: 17044

Log:
- fix setting the REAL_GCC_VERSION if no snapdate was given (i.e. we're using a svn co of the branch).
  sjhill, please verify that this still works for you!


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-22 11:29:52 UTC (rev 17043)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-22 11:38:07 UTC (rev 17044)
@@ -336,8 +336,8 @@
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
 ifeq ($(findstring 4.2,$(GCC_VERSION)),4.2)
-ifneq ($(GCC_SNAP_DATE),)
-REAL_GCC_VERSION:=`cat ${GCC_DIR}/gcc/BASE-VER`
+ifneq ($(findstring 4.2.,$(GCC_VERSION)),4.2.)
+REAL_GCC_VERSION=$(shell cat $(GCC_DIR)/gcc/BASE-VER)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(REAL_GCC_VERSION)
 else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
