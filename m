From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 17 Oct 2006 09:57:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/AMD/DBAu1500
Message-ID: <20061017165749.DA6E0486BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-17 09:57:49 -0700 (Tue, 17 Oct 2006)
New Revision: 16400

Log:
update config files


Modified:
   trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mips
   trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mipsel


Changeset:
Modified: trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mips
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mips	2006-10-17 16:57:02 UTC (rev 16399)
+++ trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mips	2006-10-17 16:57:49 UTC (rev 16400)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sat Mar 18 22:41:24 2006
+# Mon Oct  2 08:55:19 2006
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -41,6 +41,7 @@
 ARCH_ANY_ENDIAN=y
 ARCH_BIG_ENDIAN=y
 ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_LITTLE_ENDIAN is not set
 # ARCH_WANTS_LITTLE_ENDIAN is not set
 ARCH_HAS_MMU=y
 ARCH_USE_MMU=y
@@ -68,9 +69,10 @@
 # LDSO_RUNPATH is not set
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-PTHREADS_DEBUG_SUPPORT=y
-LINUXTHREADS_OLD=y
+# UCLIBC_HAS_THREADS is not set
+# PTHREADS_DEBUG_SUPPORT is not set
+# UCLIBC_HAS_THREADS_NATIVE is not set
+# LINUXTHREADS_OLD is not set
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
@@ -97,7 +99,6 @@
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
 UCLIBC_HAS_REENTRANT_RPC=y
-# UCLIBC_USE_NETLINK is not set
 
 #
 # String and Stdio Support
@@ -125,7 +126,7 @@
 UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT=n
 UCLIBC_HAS_STDIO_GETC_MACRO=y
 UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
@@ -138,19 +139,16 @@
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
-UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
 # Big and Tall
 #
 UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_REGEX_OLD=y
-UCLIBC_HAS_FNMATCH=y
-UCLIBC_HAS_FNMATCH_OLD=y
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options
@@ -160,12 +158,11 @@
 DEVEL_PREFIX="/usr/"
 
 #
-# Security options
+# uClibc security related options
 #
-# UCLIBC_BUILD_PIE is not set
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
+# UCLIBC_SECURITY is not set
+UCLIBC_BUILD_PIE=n
+UCLIBC_HAS_SSP=n
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
 UCLIBC_BUILD_NOEXECSTACK=y
@@ -176,11 +173,9 @@
 CROSS_COMPILER_PREFIX=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-NOSTRIP=y
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
 WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
 # DOMULTI is not set
 # UCLIBC_MJN3_ONLY is not set

Modified: trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mipsel
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mipsel	2006-10-17 16:57:02 UTC (rev 16399)
+++ trunk/buildroot/target/device/AMD/DBAu1500/uClibc.config.mipsel	2006-10-17 16:57:49 UTC (rev 16400)
@@ -1,82 +1,93 @@
 #
 # Automatically generated make config: don't edit
 #
-# TARGET_alpha=y
-# TARGET_arm=y
-# TARGET_bfin=y
-# TARGET_cris=y
-# TARGET_e1=y
-# TARGET_frv=y
-# TARGET_h8300=y
-# TARGET_hppa=y
-# TARGET_i386=y
-# TARGET_i960=y
-# TARGET_m68k=y
-# TARGET_microblaze=y
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
 TARGET_mips=y
-# TARGET_nios=y
-# TARGET_nios2=y
-# TARGET_powerpc=y
-# TARGET_sh=y
-# TARGET_sh64=y
-# TARGET_sparc=y
-# TARGET_v850=y
-# TARGET_x86_64=y
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
 
 #
 # Target Architecture Features and Options
 #
 HAVE_ELF=y
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-TARGET_ARCH="mips"
-ARCH_CFLAGS="-mno-split-addresses"
-ARCH_SUPPORTS_BIG_ENDIAN=y
-# CONFIG_MIPS_ISA_1=y
-# CONFIG_MIPS_ISA_2=y
-# CONFIG_MIPS_ISA_3=y
-# CONFIG_MIPS_ISA_4=y
-CONFIG_MIPS_ISA_MIPS32=y
-# CONFIG_MIPS_ISA_MIPS64=y
-ARCH_LITTLE_ENDIAN=y
+TARGET_ARCH="none"
+# ARCH_LITTLE_ENDIAN is not set
 # ARCH_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU=y
-ARCH_HAS_MMU=y
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+# ARCH_WANTS_BIG_ENDIAN is not set
+# ARCH_HAS_NO_MMU is not set
 UCLIBC_HAS_FLOATS=y
-HAS_FPU=y
+UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_SOURCE="/home/andersen/SVN/buildroot/toolchain_build_mips/linux"
-C_SYMBOL_PREFIX=""
+WARNINGS="-Wall"
+KERNEL_SOURCE="/usr/src/linux"
 HAVE_DOT_CONFIG=y
+# CONFIG_ARM_EABI is not set
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
 
 #
 # General Library Settings
 #
-# HAVE_NO_PIC=y
+# HAVE_NO_PIC is not set
 DOPIC=y
-# HAVE_NO_SHARED=y
-# ARCH_HAS_NO_LDSO=y
+# HAVE_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
 HAVE_SHARED=y
-# FORCE_SHAREABLE_TEXT_SEGMENTS=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
 LDSO_CACHE_SUPPORT=y
-# LDSO_PRELOAD_FILE_SUPPORT=y
+# LDSO_PRELOAD_FILE_SUPPORT is not set
 LDSO_BASE_FILENAME="ld.so"
-# LDSO_RUNPATH=y
+# UCLIBC_STATIC_LDCONFIG is not set
+# LDSO_RUNPATH is not set
 UCLIBC_CTOR_DTOR=y
-# HAS_NO_THREADS=y
-UCLIBC_HAS_THREADS=y
-PTHREADS_DEBUG_SUPPORT=y
-LINUXTHREADS_OLD=y
+# HAS_NO_THREADS is not set
+# UCLIBC_HAS_THREADS is not set
+# PTHREADS_DEBUG_SUPPORT is not set
+# UCLIBC_HAS_THREADS_NATIVE is not set
+# LINUXTHREADS_OLD is not set
 UCLIBC_HAS_LFS=y
-# UCLIBC_STATIC_LDCONFIG=y
-# MALLOC=y
-# MALLOC_SIMPLE=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
 MALLOC_STANDARD=y
 MALLOC_GLIBC_COMPAT=y
 UCLIBC_DYNAMIC_ATEXIT=y
-COMPAT_ATEXIT=y
+# COMPAT_ATEXIT is not set
+# UCLIBC_SUSV3_LEGACY is not set
 HAS_SHADOW=y
-# UNIX98PTY_ONLY=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS___PROGNAME=y
+# UNIX98PTY_ONLY is not set
 ASSUME_DEVPTS=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
@@ -90,7 +101,7 @@
 UCLIBC_HAS_IPV6=y
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
-# UCLIBC_HAS_REENTRANT_RPC=y
+UCLIBC_HAS_REENTRANT_RPC=y
 
 #
 # String and Stdio Support
@@ -99,37 +110,37 @@
 UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
 UCLIBC_HAS_CTYPE_CHECKED=y
-# UCLIBC_HAS_CTYPE_ENFORCED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
 UCLIBC_HAS_WCHAR=y
-# UCLIBC_HAS_LOCALE=y
+# UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
 UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE=y
-# UCLIBC_HAS_STDIO_BUFSIZ_256=y
-# UCLIBC_HAS_STDIO_BUFSIZ_512=y
-# UCLIBC_HAS_STDIO_BUFSIZ_1024=y
-# UCLIBC_HAS_STDIO_BUFSIZ_2048=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
 UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
 UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8=y
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT=n
 UCLIBC_HAS_STDIO_GETC_MACRO=y
 UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
 UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
 
 #
@@ -137,10 +148,10 @@
 #
 UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_REGEX_OLD=y
-# UCLIBC_HAS_WORDEXP=y
+# UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
-# UCLIBC_HAS_GNU_GLOB is not set
+UCLIBC_HAS_GNU_GLOB=y
 
 #
 # Library Installation Options
@@ -150,24 +161,24 @@
 DEVEL_PREFIX="/usr/"
 
 #
-# Security options
+# uClibc security related options
 #
-# UCLIBC_BUILD_PIE=y
-# HAVE_NO_SSP=y
-# UCLIBC_HAS_SSP=y
+# UCLIBC_SECURITY is not set
+UCLIBC_BUILD_PIE=n
+UCLIBC_HAS_SSP=n
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
-# UCLIBC_BUILD_NOEXECSTACK=y
+UCLIBC_BUILD_NOEXECSTACK=y
 
 #
 # uClibc development/debugging options
 #
-CROSS_COMPILER_PREFIX="/home/andersen/SVN/buildroot/build_mips/staging_dir/bin/mips-linux-uclibc-"
-# DODEBUG=y
-# DODEBUG_PT=y
-# DOASSERTS=y
-# SUPPORT_LD_DEBUG=y
-# SUPPORT_LD_DEBUG_EARLY=y
+CROSS_COMPILER_PREFIX=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
 WARNINGS="-Wall"
-# DOMULTI=y
-# UCLIBC_MJN3_ONLY=y
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
