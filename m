From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 06:13:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070708131332.5FB91A687C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 06:13:29 -0700 (Sun, 08 Jul 2007)
New Revision: 19035

Log:
- factor-out common config options for staging and target compiler
- take extra options for the respective compilers into account


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-08 12:50:06 UTC (rev 19034)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-08 13:13:29 UTC (rev 19035)
@@ -53,8 +53,9 @@
 
 GCC_TARGET_LANGUAGES:=c
 
-GCC_TARGET_PREREQ += $(wildcard $(BASE_DIR)/include/config/br2/install/libstdcpp* $(BASE_DIR)/include/config/br2/install/libgcj* $(BASE_DIR)/include/config/br2/install/objc* $(BASE_DIR)/include/config/br2/install/fortran*)
-GCC_STAGING_PREREQ+= $(wildcard $(BASE_DIR)/include/config/br2/install/libstdcpp* $(BASE_DIR)/include/config/br2/install/libgcj* $(BASE_DIR)/include/config/br2/install/objc* $(BASE_DIR)/include/config/br2/install/fortran*)
+GCC_COMMON_PREREQ= $(wildcard $(BASE_DIR)/include/config/br2/install/libstdcpp* $(BASE_DIR)/include/config/br2/install/libgcj* $(BASE_DIR)/include/config/br2/install/objc* $(BASE_DIR)/include/config/br2/install/fortran* $(BASE_DIR)/include/config/br2/prefer/ima* $(BASE_DIR)/include/config/br2/toolchain/sysroot* $(BASE_DIR)/include/config/br2/use/sjlj/exceptions* $(BASE_DIR)/include/config/br2/gcc/shared/libgcc*)
+GCC_TARGET_PREREQ += $(GCC_COMMON_PREREQ) $(wildcard $(BASE_DIR)/include/config/br2/extra/target/gcc/config/options*)
+GCC_STAGING_PREREQ+= $(GCC_COMMON_PREREQ) $(wildcard $(BASE_DIR)/include/config/br2/extra/gcc/config/options*)
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
