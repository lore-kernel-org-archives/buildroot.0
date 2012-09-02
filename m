From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 03 Sep 2012 00:09:43 +0300
Subject: [Buildroot] Problems building Busybox 1.20.1 with Buildroot
	2012.05
In-Reply-To: <CAMPeO9x61f+1fU+qdOTQav3MEbqZRG8X2SR+WLjeQgHRWxsC4A@mail.gmail.com>
References: <CAMPeO9x61f+1fU+qdOTQav3MEbqZRG8X2SR+WLjeQgHRWxsC4A@mail.gmail.com>
Message-ID: <5043CB17.4040608@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David

2.9.2012 21:06, David Sanchez Herrero kirjoitti:
> Hi all,
>
> I'm trying to build a Buildroot toolchain using configuration files
> for Buildroot and uClibc downloaded from the official forum.
>
> During the full building process with Buildroot, I get the next error
> in Busybox building, and I'm blocked there:
>
>
> ...
> ...
> LINK    busybox_unstripped
> Trying libraries: crypt m
> Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
> Output of:
> /home/larcen/Escritorio/datos/
> Master/PFM/fuente-arm/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> -pipe -mfpu=vfp -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64
> -I/home/larcen/Escritorio/datos/Master/PFM/fuente-arm/buildroot/output/toolchain/linux/include
> -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
> -Wunused-parameter -Wunused-function -Wunused-value
> -Wmissing-prototypes -Wmissing-declarations
> -Wdeclaration-after-statement -Wold-style-definition
> -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer
> -ffunction-sections -fdata-sections -fno-guess-branch-probability
> -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1
> -falign-labels=1 -falign-loops=1 -Os -o busybox_unstripped
> -Wl,--sort-common -Wl,--sort-section,alignment -Wl,--gc-sections
> -Wl,--start-group applets/built-in.o archival/lib.a
> archival/libarchive/lib.a console-tools/lib.a coreutils/lib.a
> coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a
> editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a
> loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a
> networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a
> printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a
> sysklogd/lib.a util-linux/lib.a util-linux/volume_id/lib.a
> archival/built-in.o archival/libarchive/built-in.o
> console-tools/built-in.o coreutils/built-in.o
> coreutils/libcoreutils/built-in.o debianutils/built-in.o
> e2fsprogs/built-in.o editors/built-in.o findutils/built-in.o
> init/built-in.o libbb/built-in.o libpwdgrp/built-in.o
> loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o
> modutils/built-in.o networking/built-in.o
> networking/libiproute/built-in.o networking/udhcp/built-in.o
> printutils/built-in.o procps/built-in.o runit/built-in.o
> selinux/built-in.o shell/built-in.o sysklogd/built-in.o
> util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group
> -Wl,--start-group -lcrypt -lm -Wl,--end-group
> ==========
> networking/lib.a(nslookup.o): In function `nslookup_main':
> nslookup.c:(.text.nslookup_main+0x2c): undefined reference to `__res_init'
> nslookup.c:(.text.nslookup_main+0x54): undefined reference to
> `__res_state'
> nslookup.c:(.text.nslookup_main+0x78): undefined reference to
> `__res_state'
> nslookup.c:(.text.nslookup_main+0x8c): undefined reference to
> `__res_state'
> collect2: error: ld devolvi? el estado de salida 1
> make[1]: *** [busybox_unstripped] Error 1
> make[1]: se sale del directorio
> `/home/larcen/Escritorio/datos/Master/PFM/fuente-arm/buildroot/output/build/busybox-1.20.1'
> make: ***
> [/home/larcen/Escritorio/datos/Master/PFM/fuente-arm/buildroot/output/build/busybox-1.20.1/.stamp_built]
> Error 2
>
>
>
> I have tried to find where the problem could be, but I couldn't. I
> have changed Busybox, GCC and uClibc versions but nothing works. I
> have changed the machine too, from my x86_64 Debian Testing to a x86
> Debian Stable one, with no result. I have reviewed the configuration
> files but changes have not worked.
>
> Please, could you help me to find where the problem is??
>
Well, I also still happen to have buildroot 2012.05 here and happily
running on x86.
I vaguely remember that I had something similar network (DNS/resolver
stuff) related problems with my configs in the past.

This is a long shot but here's a part of what I have in my current
working custom uclibc config:

# Support various families of functions
#
UCLIBC_LINUX_MODULE_26=y
# UCLIBC_LINUX_MODULE_24 is not set
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
UCLIBC_BSD_SPECIFIC=y
UCLIBC_HAS_BSD_ERR=y
# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
# UCLIBC_NTP_LEGACY is not set
# UCLIBC_SV4_DEPRECATED is not set
UCLIBC_HAS_REALTIME=y
UCLIBC_HAS_ADVANCED_REALTIME=y
UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_XATTR=y
UCLIBC_HAS_PROFILING=y
UCLIBC_HAS_CRYPT_IMPL=y
UCLIBC_HAS_SHA256_CRYPT_IMPL=y
UCLIBC_HAS_SHA512_CRYPT_IMPL=y
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_USE_NETLINK=y
UCLIBC_SUPPORT_AI_ADDRCONFIG=y
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
UCLIBC_HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y
UCLIBC_HAS_LIBNSL_STUB=y

Best regards

Stefan Fr?berg

> Thanks in advance, David.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120903/4e34614f/attachment.html>
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Version: 0.9.33
# Sat Feb 25 23:36:53 2012
#
# TARGET_alpha is not set
# TARGET_arm is not set
# TARGET_avr32 is not set
# TARGET_bfin is not set
# TARGET_cris is not set
# TARGET_e1 is not set
# TARGET_frv is not set
# TARGET_h8300 is not set
# TARGET_hppa is not set
TARGET_i386=y
# TARGET_i960 is not set
# TARGET_ia64 is not set
# TARGET_m68k is not set
# TARGET_microblaze is not set
# TARGET_mips is not set
# TARGET_nios is not set
# TARGET_nios2 is not set
# TARGET_powerpc is not set
# TARGET_sh is not set
# TARGET_sh64 is not set
# TARGET_sparc is not set
# TARGET_v850 is not set
# TARGET_vax is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set
# TARGET_c6x is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="i386"
FORCE_OPTIONS_FOR_ARCH=y
# CONFIG_GENERIC_386 is not set
# CONFIG_386 is not set
# CONFIG_486 is not set
CONFIG_586=y
# CONFIG_586MMX is not set
# CONFIG_686 is not set
# CONFIG_PENTIUMII is not set
# CONFIG_PENTIUMIII is not set
# CONFIG_PENTIUM4 is not set
# CONFIG_K6 is not set
# CONFIG_K7 is not set
# CONFIG_ELAN is not set
# CONFIG_CRUSOE is not set
# CONFIG_WINCHIPC6 is not set
# CONFIG_WINCHIP2 is not set
# CONFIG_CYRIXIII is not set
# CONFIG_NEHEMIAH is not set
TARGET_SUBARCH="i586"

#
# Using ELF file format
#
ARCH_LITTLE_ENDIAN=y

#
# Using Little Endian
#
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
DO_C99_MATH=y
# DO_XSI_MATH is not set
UCLIBC_HAS_FENV=y
UCLIBC_HAS_LONG_DOUBLE_MATH=y
KERNEL_HEADERS="/buildroot/output/toolchain/linux/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
DOPIC=y
HAVE_SHARED=y
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_LDD_SUPPORT=y
# LDSO_CACHE_SUPPORT is not set
LDSO_PRELOAD_ENV_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
# LDSO_STANDALONE_SUPPORT is not set
# LDSO_PRELINK_SUPPORT is not set
# UCLIBC_STATIC_LDCONFIG is not set
LDSO_RUNPATH=y
LDSO_SEARCH_INTERP_PATH=y
LDSO_LD_LIBRARY_PATH=y
# LDSO_NO_CLEANUP is not set
UCLIBC_CTOR_DTOR=y
LDSO_GNU_HASH_SUPPORT=y
# HAS_NO_THREADS is not set
# LINUXTHREADS_OLD is not set
# LINUXTHREADS_NEW is not set
UCLIBC_HAS_THREADS_NATIVE=y
UCLIBC_HAS_THREADS=y
UCLIBC_HAS_TLS=y
# PTHREADS_DEBUG_SUPPORT is not set
UCLIBC_HAS_SYSLOG=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
# COMPAT_ATEXIT is not set
UCLIBC_SUSV3_LEGACY=y
# UCLIBC_SUSV3_LEGACY_MACROS is not set
UCLIBC_SUSV4_LEGACY=y
# UCLIBC_STRICT_HEADERS is not set
# UCLIBC_HAS_STUBS is not set
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
UCLIBC_HAS___PROGNAME=y
UCLIBC_HAS_PTY=y
ASSUME_DEVPTS=y
UNIX98PTY_ONLY=y
UCLIBC_HAS_GETPT=y
UCLIBC_HAS_LIBUTIL=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y

#
# Advanced Library Settings
#
UCLIBC_PWD_BUFFER_SIZE=256
UCLIBC_GRP_BUFFER_SIZE=256

#
# Support various families of functions
#
UCLIBC_LINUX_MODULE_26=y
# UCLIBC_LINUX_MODULE_24 is not set
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
UCLIBC_BSD_SPECIFIC=y
UCLIBC_HAS_BSD_ERR=y
# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
# UCLIBC_NTP_LEGACY is not set
# UCLIBC_SV4_DEPRECATED is not set
UCLIBC_HAS_REALTIME=y
UCLIBC_HAS_ADVANCED_REALTIME=y
UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_XATTR=y
UCLIBC_HAS_PROFILING=y
UCLIBC_HAS_CRYPT_IMPL=y
UCLIBC_HAS_SHA256_CRYPT_IMPL=y
UCLIBC_HAS_SHA512_CRYPT_IMPL=y
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_USE_NETLINK=y
UCLIBC_SUPPORT_AI_ADDRCONFIG=y
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
UCLIBC_HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y
UCLIBC_HAS_LIBNSL_STUB=y

#
# String and Stdio Support
#
# UCLIBC_HAS_STRING_GENERIC_OPT is not set
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
# UCLIBC_HAS_CTYPE_CHECKED is not set
UCLIBC_HAS_CTYPE_ENFORCED=y
UCLIBC_HAS_WCHAR=y
UCLIBC_HAS_LOCALE=y
UCLIBC_BUILD_ALL_LOCALE=y
# UCLIBC_BUILD_MINIMAL_LOCALE is not set
# UCLIBC_PREGENERATED_LOCALE_DATA is not set
UCLIBC_HAS_XLOCALE=y
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_STDIO_FUTEXES=y
# UCLIBC_HAS_GNU_GETSUBOPT is not set

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_REGEX_OLD is not set
UCLIBC_HAS_FNMATCH=y
# UCLIBC_HAS_FNMATCH_OLD is not set
# UCLIBC_HAS_WORDEXP is not set
UCLIBC_HAS_NFTW=y
UCLIBC_HAS_FTW=y
# UCLIBC_HAS_FTS is not set
UCLIBC_HAS_GLOB=y
UCLIBC_HAS_GNU_GLOB=y
# UCLIBC_HAS_UTMPX is not set

#
# Library Installation Options
#
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"
MULTILIB_DIR="lib"
HARDWIRED_ABSPATH=y

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
UCLIBC_HAS_ARC4RANDOM=y
UCLIBC_HAS_SSP=y
# UCLIBC_HAS_SSP_COMPAT is not set
# SSP_QUICK_CANARY is not set
PROPOLICE_BLOCK_ABRT=y
# PROPOLICE_BLOCK_SEGV is not set
# UCLIBC_BUILD_SSP is not set
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y

#
# Development/debugging options
#
CROSS_COMPILER_PREFIX="/buildroot/output/host/usr/bin/i586-unknown-linux-uclibc-"
UCLIBC_EXTRA_CFLAGS=""
# DODEBUG is not set
DOSTRIP=y
# DOASSERTS is not set
# SUPPORT_LD_DEBUG is not set
# SUPPORT_LD_DEBUG_EARLY is not set
# UCLIBC_MALLOC_DEBUGGING is not set
# UCLIBC_HAS_BACKTRACE is not set
WARNINGS="-Wall"
# EXTRA_WARNINGS is not set
# DOMULTI is not set
# UCLIBC_MJN3_ONLY is not set
