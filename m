From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 23 Aug 2007 22:27:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: project toolchain
Message-ID: <20070824052717.15E63A4668@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-23 22:27:17 -0700 (Thu, 23 Aug 2007)
New Revision: 19668

Log:
Move VENDOR stuff to project

Modified:
   trunk/buildroot/project/Makefile.in
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2007-08-23 14:11:30 UTC (rev 19667)
+++ trunk/buildroot/project/Makefile.in	2007-08-24 05:27:17 UTC (rev 19668)
@@ -13,6 +13,8 @@
 #"))
 SVN:=$(strip $(subst ",, $(BR2_SVN)))
 #"))
+GIT:=$(strip $(subst ",, $(BR2_GIT)))
+#"))
 ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
 #"))
 BZCAT:=$(strip $(subst ",, $(BR2_BZCAT)))
@@ -54,3 +56,20 @@
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
 BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
 TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
+
+# define values for prepatched source trees for toolchains
+VENDOR_SITE:=$(strip $(subst ",,$(BR2_VENDOR_SITE)))
+#"))
+VENDOR_SUFFIX:=$(strip $(subst ",,$(BR2_VENDOR_SUFFIX)))
+#"))
+VENDOR_BINUTILS_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_BINUTILS_RELEASE)))
+#"))
+VENDOR_GCC_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_GCC_RELEASE)))
+#"))
+VENDOR_UCLIBC_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_UCLIBC_RELEASE)))
+#"))
+VENDOR_GDB_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_GDB_RELEASE)))
+#"))
+VENDOR_PATCH_DIR:=$(strip $(subst ",,$(BR2_VENDOR_PATCH_DIR)))
+#"))
+

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-08-23 14:11:30 UTC (rev 19667)
+++ trunk/buildroot/toolchain/Makefile.in	2007-08-24 05:27:17 UTC (rev 19668)
@@ -45,22 +45,5 @@
 # gcc-3.4 would need -combine, I only support 4.2, which correctly uses '--'
 CFLAGS_COMBINE = $(call cc-option,--combine,)
 
-# define values for prepatched source trees for toolchains
-#XXX: ulf, what about moving this to project/* ? (BF)
-VENDOR_SITE:=$(strip $(subst ",,$(BR2_VENDOR_SITE)))
-#"))
-VENDOR_SUFFIX:=$(strip $(subst ",,$(BR2_VENDOR_SUFFIX)))
-#"))
-VENDOR_BINUTILS_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_BINUTILS_RELEASE)))
-#"))
-VENDOR_GCC_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_GCC_RELEASE)))
-#"))
-VENDOR_UCLIBC_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_UCLIBC_RELEASE)))
-#"))
-VENDOR_GDB_RELEASE:=$(strip $(subst ",,$(BR2_VENDOR_GDB_RELEASE)))
-#"))
-VENDOR_PATCH_DIR:=$(strip $(subst ",,$(BR2_VENDOR_PATCH_DIR)))
-#"))
-
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
