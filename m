From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 28 Jan 2007 08:38:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070128163849.790E6485F3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-28 08:38:48 -0800 (Sun, 28 Jan 2007)
New Revision: 17602

Log:
- fix prereq of current binutils wrt gmp


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-01-28 16:07:45 UTC (rev 17601)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-01-28 16:38:48 UTC (rev 17602)
@@ -14,27 +14,33 @@
 endif
 ifeq ($(BINUTILS_VERSION),2.16)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.16.1)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.15)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.14)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.13)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.15.97)
 BINUTILS_SITE:=ftp://sources.redhat.com/pub/binutils/snapshots/
+BINUTILS_NO_MPFR:=y
 endif
 
 # We do not rely on the host's gmp/mpfr but use a known working one
-BINUTILS_HOST_PREREQ:= #nothing
-BINUTILS_TARGET_PREREQ:= #nothing
-ifeq ($(BR2_BINUTILS_VERSION_2_17_50_0_9),y)
+BINUTILS_HOST_PREREQ:=
+BINUTILS_TARGET_PREREQ:=
+ifndef BINUTILS_NO_MPFR
 
 BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp.so \
 	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
