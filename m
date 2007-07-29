From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:32:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070729173222.EBF96A4560@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:32:21 -0700 (Sun, 29 Jul 2007)
New Revision: 19328

Log:
Add AVR32 needs to uClibc def config

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-07-29 14:59:06 UTC (rev 19327)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-07-29 17:32:21 UTC (rev 19328)
@@ -3,6 +3,7 @@
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
@@ -52,8 +53,10 @@
 #
 # HAVE_NO_PIC is not set
 DOPIC=y
+# LINKRELAX is not set
 # HAVE_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
+BUILD_UCLIBC_LDSO=y
 HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
@@ -62,6 +65,7 @@
 LDSO_BASE_FILENAME="ld.so"
 # UCLIBC_STATIC_LDCONFIG is not set
 # LDSO_RUNPATH is not set
+# DL_FINI_CRT_COMPAT is not set
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
@@ -74,6 +78,7 @@
 MALLOC_GLIBC_COMPAT=y
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
+HAS_SHADOW=y
 # UCLIBC_SUSV3_LEGACY is not set
 UCLIBC_SUSV3_LEGACY_MACROS=y
 UCLIBC_HAS_SHADOW=y
@@ -165,8 +170,9 @@
 DEVEL_PREFIX="/usr/"
 
 #
-# Security options
+# uClibc security related options
 #
+# UCLIBC_SECURITY is not set
 # UCLIBC_BUILD_PIE is not set
 # UCLIBC_HAS_ARC4RANDOM is not set
 # HAVE_NO_SSP is not set
