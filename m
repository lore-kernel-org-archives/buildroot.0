From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 10:26:57 +0000 (UTC)
Subject: [Buildroot] svn commit: [26218] trunk/buildroot/toolchain/gcc
Message-ID: <20090427102657.C6D967745E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-27 10:26:56 +0000 (Mon, 27 Apr 2009)
New Revision: 26218

Log:
toolchain/gcc: disable tls support

Fixes libstdc++ linking with gcc 4.4.x

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-04-27 08:36:04 UTC (rev 26217)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-04-27 10:26:56 UTC (rev 26218)
@@ -206,6 +206,7 @@
 		--with-gnu-ld \
 		--disable-shared \
 		--disable-libssp \
+		--disable-tls \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
@@ -281,6 +282,7 @@
 		--enable-target-optspace \
 		--with-gnu-ld \
 		--disable-libssp \
+		--disable-tls \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -410,6 +412,7 @@
 		--disable-__cxa_atexit \
 		--with-gnu-ld \
 		--disable-libssp \
+		--disable-tls \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
 		$(GCC_WITH_TARGET_MPFR) \
