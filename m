From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 08:18:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20071012151827.77955A6AB5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 08:18:27 -0700 (Fri, 12 Oct 2007)
New Revision: 20236

Log:
Update AVR32 uClibc configuration

Modified:
   trunk/buildroot/target/device/Atmel/uClibc.config.avr32


Changeset:
Modified: trunk/buildroot/target/device/Atmel/uClibc.config.avr32
===================================================================
--- trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2007-10-12 15:17:53 UTC (rev 20235)
+++ trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2007-10-12 15:18:27 UTC (rev 20236)
@@ -1,5 +1,6 @@
 #
 # Automatically generated make config: don't edit
+# Fri Oct 12 09:59:26 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -9,8 +10,10 @@
 # TARGET_e1 is not set
 # TARGET_frv is not set
 # TARGET_h8300 is not set
+# TARGET_hppa is not set
 # TARGET_i386 is not set
 # TARGET_i960 is not set
+# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -21,27 +24,33 @@
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
+# TARGET_vax is not set
 # TARGET_x86_64 is not set
 
 #
 # Target Architecture Features and Options
 #
-HAVE_ELF=y
 TARGET_ARCH="avr32"
-ARCH_SUPPORTS_BIG_ENDIAN=y
-UCLIBC_COMPLETELY_PIC=y
-CONFIG_AP7000=y
+FORCE_OPTIONS_FOR_ARCH=y
+CONFIG_AVR32_AP7=y
 LINKRELAX=y
-# ARCH_LITTLE_ENDIAN is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
 ARCH_BIG_ENDIAN=y
-# ARCH_HAS_NO_MMU is not set
+
+#
+# Using Big Endian
+#
 ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
-# HAS_FPU is not set
+# UCLIBC_HAS_FPU is not set
 UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
-KERNEL_SOURCE="/home/ulf/projects/Buildroot/20071001/buildroot/toolchain_build_avr32/linux"
-C_SYMBOL_PREFIX=""
+KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
 
 #
@@ -50,28 +59,32 @@
 # HAVE_NO_PIC is not set
 DOPIC=y
 # HAVE_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
 HAVE_SHARED=y
-# ARCH_HAS_NO_LDSO is not set
-BUILD_UCLIBC_LDSO=y
 FORCE_SHAREABLE_TEXT_SEGMENTS=y
 LDSO_LDD_SUPPORT=y
 LDSO_CACHE_SUPPORT=y
 # LDSO_PRELOAD_FILE_SUPPORT is not set
 LDSO_BASE_FILENAME="ld.so"
+# UCLIBC_STATIC_LDCONFIG is not set
 # LDSO_RUNPATH is not set
-# DL_FINI_CRT_COMPAT is not set
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
-PTHREADS_DEBUG_SUPPORT=y
+# PTHREADS_DEBUG_SUPPORT is not set
+LINUXTHREADS_OLD=y
 UCLIBC_HAS_LFS=y
-# UCLIBC_STATIC_LDCONFIG is not set
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
 MALLOC_STANDARD=y
 MALLOC_GLIBC_COMPAT=y
 UCLIBC_DYNAMIC_ATEXIT=y
-HAS_SHADOW=y
+# COMPAT_ATEXIT is not set
+# UCLIBC_SUSV3_LEGACY is not set
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_HAS_SHADOW=y
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
 UNIX98PTY_ONLY=y
 ASSUME_DEVPTS=y
 UCLIBC_HAS_TM_EXTENSIONS=y
@@ -81,11 +94,20 @@
 UCLIBC_TZ_FILE_PATH="/etc/TZ"
 
 #
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
 # Networking Support
 #
 UCLIBC_HAS_IPV6=y
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
+# UCLIBC_HAS_REENTRANT_RPC is not set
+# UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
 
 #
 # String and Stdio Support
@@ -126,14 +148,19 @@
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
 # Big and Tall
 #
 UCLIBC_HAS_REGEX=y
+UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+UCLIBC_HAS_FNMATCH_OLD=y
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
+# UCLIBC_HAS_GNU_GLOB is not set
 
 #
 # Library Installation Options
@@ -143,18 +170,28 @@
 DEVEL_PREFIX="/usr/"
 
 #
-# uClibc security related options
+# Security options
 #
-# UCLIBC_SECURITY is not set
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+UCLIBC_BUILD_RELRO=y
+# UCLIBC_BUILD_NOW is not set
+UCLIBC_BUILD_NOEXECSTACK=y
 
 #
 # uClibc development/debugging options
 #
-CROSS_COMPILER_PREFIX="/home/ulf/projects/Buildroot/20071001/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-"
+CROSS_COMPILER_PREFIX="/home/ulf/projects/Buildroot/20071011/buildroot/build_avr32/staging_dir/usr/bin/avr32-uclic-linux-"
+UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
+DOSTRIP=y
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
 WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
 # UCLIBC_MJN3_ONLY is not set
