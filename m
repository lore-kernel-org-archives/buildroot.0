From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 22:09:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20090303220958.B35FC7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 22:09:58 +0000 (Tue, 03 Mar 2009)
New Revision: 25514

Log:
binutils: remove handling of ancient versions

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2009-03-03 22:09:50 UTC (rev 25513)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2009-03-03 22:09:58 UTC (rev 25514)
@@ -21,30 +21,6 @@
 ifeq ($(BINUTILS_VERSION),2.17)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
-ifeq ($(BINUTILS_VERSION),2.16)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-BINUTILS_NO_MPFR:=y
-endif
-ifeq ($(BINUTILS_VERSION),2.16.1)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-BINUTILS_NO_MPFR:=y
-endif
-ifeq ($(BINUTILS_VERSION),2.15)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-BINUTILS_NO_MPFR:=y
-endif
-ifeq ($(BINUTILS_VERSION),2.14)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-BINUTILS_NO_MPFR:=y
-endif
-ifeq ($(BINUTILS_VERSION),2.13)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-BINUTILS_NO_MPFR:=y
-endif
-ifeq ($(BINUTILS_VERSION),2.15.97)
-BINUTILS_SITE:=ftp://sources.redhat.com/pub/binutils/snapshots/
-BINUTILS_NO_MPFR:=y
-endif
 
 # We do not rely on the host's gmp/mpfr but use a known working one
 BINUTILS_HOST_PREREQ:=
