From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:15:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20090111211547.22E7A76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:15:46 +0000 (Sun, 11 Jan 2009)
New Revision: 24769

Log:
Update AVR32 uclibc config for 0.9.30

Modified:
   trunk/buildroot/target/device/Atmel/uClibc.config.avr32


Changeset:
Modified: trunk/buildroot/target/device/Atmel/uClibc.config.avr32
===================================================================
--- trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2009-01-11 21:15:08 UTC (rev 24768)
+++ trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2009-01-11 21:15:46 UTC (rev 24769)
@@ -1,6 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 31 14:27:19 2008
+# Version: 0.9.30
+# Sat Jan 10 02:19:18 2009
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -26,6 +27,7 @@
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
@@ -50,7 +52,8 @@
 # UCLIBC_HAS_FPU is not set
 UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/home/john.voltz/avr32/BSP2/software/buildroot/buildroot-avr32-v2.1.0/toolchain_build_avr32_nofpu/linux/include"
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="/home/ulf/projects/Buildroot/20090110/buildroot-avr32/toolchain_build_avr32/linux/include"
 HAVE_DOT_CONFIG=y
 
 #
@@ -58,7 +61,7 @@
 #
 # HAVE_NO_PIC is not set
 DOPIC=y
-# HAVE_NO_SHARED is not set
+# ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
 HAVE_SHARED=y
 FORCE_SHAREABLE_TEXT_SEGMENTS=y
@@ -69,10 +72,12 @@
 # UCLIBC_STATIC_LDCONFIG is not set
 # LDSO_RUNPATH is not set
 UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
 # PTHREADS_DEBUG_SUPPORT is not set
 LINUXTHREADS_OLD=y
+UCLIBC_HAS_SYSLOG=y
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
@@ -82,11 +87,13 @@
 # COMPAT_ATEXIT is not set
 UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV3_LEGACY_MACROS=y
+# UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-UCLIBC_HAS___PROGNAME=y
+UCLIBC_HAS_PTY=y
+ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
-ASSUME_DEVPTS=y
+# UCLIBC_HAS_GETPT is not set
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
@@ -100,8 +107,27 @@
 UCLIBC_GRP_BUFFER_SIZE=256
 
 #
-# Networking Support
+# Support various families of functions
 #
+UCLIBC_LINUX_MODULE_24=y
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_BSD_ERR=y
+# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
+# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
+# UCLIBC_NTP_LEGACY is not set
+# UCLIBC_SV4_DEPRECATED is not set
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_EPOLL=y
+UCLIBC_HAS_XATTR=y
+UCLIBC_HAS_PROFILING=y
+UCLIBC_HAS_CRYPT_IMPL=y
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
 UCLIBC_HAS_IPV6=y
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
@@ -185,7 +211,7 @@
 #
 # uClibc development/debugging options
 #
-CROSS_COMPILER_PREFIX="/home/john.voltz/avr32/BSP2/software/buildroot/buildroot-avr32-v2.1.0/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-"
+CROSS_COMPILER_PREFIX="/home/ulf/projects/Buildroot/20090110/buildroot-avr32/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-"
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
