From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 09:37:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070901163756.62202A6076@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 09:37:55 -0700 (Sat, 01 Sep 2007)
New Revision: 19746

Log:
- precaution when looking at GCC_VERSION


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-01 12:21:42 UTC (rev 19745)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-01 16:37:55 UTC (rev 19746)
@@ -41,10 +41,10 @@
 BINUTILS_HOST_PREREQ:=
 BINUTILS_TARGET_PREREQ:=
 
-ifeq ($(findstring 3.,$(GCC_VERSION)),3.)
+ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
 BINUTILS_NO_MPFR:=y
 endif
-ifeq ($(findstring 4.0,$(GCC_VERSION)),4.0)
+ifeq ($(findstring x4.0,x$(GCC_VERSION)),x4.0)
 BINUTILS_NO_MPFR:=y
 endif
 
