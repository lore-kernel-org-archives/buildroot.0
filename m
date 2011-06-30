From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 30 Jun 2011 07:07:57 +0300
Subject: [Buildroot] buildroot tool chain won't support SPE abi?
In-Reply-To: <BANLkTi=OQK2-HSPZ0V3W3Kmsh5wioOcLZw@mail.gmail.com>
References: <BANLkTi=OQK2-HSPZ0V3W3Kmsh5wioOcLZw@mail.gmail.com>
Message-ID: <20110630040757.GA18610@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi raymod,

On Wed, Jun 29, 2011 at 01:27:11PM -0400, raymond zhao wrote:
> My platform is freescale P1020 CPU, which uses e500v2 core.
> After tried and studied a few days, I think it is impossible to make
> buildroot to support spe abi with uclibc.

I've managed to build a uClibc (0.9.31) based toolchain for e500v2 with SPE 
using crosstool-ng (gcc version 4.4.6). With this I compiled a working 
statically lined Busybox, but I haven't tried anything else. .config and 
uClibc.config files are attached.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
#
# Automatically generated make config: don't edit
# crosstool-NG version: 1.11.3
# Thu Jun 30 06:43:56 2011
#
# CT_BACKEND is not set
CT_MODULES=y

#
# Paths and misc options
#

#
# crosstool-NG behavior
#
# CT_OBSOLETE is not set
CT_EXPERIMENTAL=y
# CT_DEBUG_CT is not set

#
# Paths
#
CT_LOCAL_TARBALLS_DIR=""
CT_WORK_DIR="${CT_TOP_DIR}/.build"
CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
CT_INSTALL_DIR="${CT_PREFIX_DIR}"
CT_RM_RF_PREFIX_DIR=y
CT_REMOVE_DOCS=y
CT_INSTALL_DIR_RO=y
CT_STRIP_ALL_TOOLCHAIN_EXECUTABLES=y

#
# Downloading
#
# CT_FORBID_DOWNLOAD is not set
# CT_FORCE_DOWNLOAD is not set
# CT_USE_MIRROR is not set
CT_CONNECT_TIMEOUT=10
# CT_ONLY_DOWNLOAD is not set

#
# Extracting
#
# CT_FORCE_EXTRACT is not set
CT_OVERIDE_CONFIG_GUESS_SUB=y
# CT_ONLY_EXTRACT is not set
CT_PATCH_BUNDLED=y
# CT_PATCH_LOCAL is not set
# CT_PATCH_BUNDLED_LOCAL is not set
# CT_PATCH_LOCAL_BUNDLED is not set
# CT_PATCH_BUNDLED_FALLBACK_LOCAL is not set
# CT_PATCH_LOCAL_FALLBACK_BUNDLED is not set
# CT_PATCH_NONE is not set
CT_PATCH_ORDER="bundled"
# CT_PATCH_SINGLE is not set
# CT_PATCH_USE_LOCAL is not set

#
# Build behavior
#
CT_PARALLEL_JOBS=4
CT_LOAD=0
CT_USE_PIPES=y
# CT_CONFIG_SHELL_SH is not set
# CT_CONFIG_SHELL_ASH is not set
CT_CONFIG_SHELL_BASH=y
# CT_CONFIG_SHELL_CUSTOM is not set
CT_CONFIG_SHELL="bash"

#
# Logging
#
# CT_LOG_ERROR is not set
# CT_LOG_WARN is not set
CT_LOG_INFO=y
# CT_LOG_EXTRA is not set
# CT_LOG_ALL is not set
# CT_LOG_DEBUG is not set
CT_LOG_LEVEL_MAX="INFO"
# CT_LOG_SEE_TOOLS_WARN is not set
CT_LOG_PROGRESS_BAR=y
CT_LOG_TO_FILE=y
CT_LOG_FILE_COMPRESS=y

#
# Target options
#
CT_ARCH="powerpc"
# CT_ARCH_SUPPORTS_BOTH_MMU is not set
# CT_ARCH_SUPPORTS_BOTH_ENDIAN is not set
CT_ARCH_SUPPORTS_32=y
CT_ARCH_SUPPORTS_64=y
# CT_ARCH_SUPPORT_ARCH is not set
CT_ARCH_SUPPORT_ABI=y
CT_ARCH_SUPPORT_CPU=y
CT_ARCH_SUPPORT_TUNE=y
# CT_ARCH_SUPPORT_FPU is not set
# CT_ARCH_DEFAULT_HAS_MMU is not set
# CT_ARCH_DEFAULT_BE is not set
# CT_ARCH_DEFAULT_LE is not set
CT_ARCH_DEFAULT_32=y
# CT_ARCH_DEFAULT_64 is not set
CT_ARCH_ABI=""
CT_ARCH_CPU="8548"
CT_ARCH_TUNE=""
CT_ARCH_32=y
# CT_ARCH_64 is not set
CT_ARCH_BITNESS=32
CT_ARCH_FLOAT_HW=y
# CT_ARCH_FLOAT_SW is not set
CT_TARGET_CFLAGS="-Wa,-me500x2"
CT_TARGET_LDFLAGS=""
# CT_ARCH_alpha is not set
# CT_ARCH_arm is not set
# CT_ARCH_avr32 is not set
# CT_ARCH_blackfin is not set
# CT_ARCH_m68k is not set
# CT_ARCH_mips is not set
CT_ARCH_powerpc=y
# CT_ARCH_s390 is not set
# CT_ARCH_sh is not set
# CT_ARCH_sparc is not set
# CT_ARCH_x86 is not set
CT_ARCH_alpha_AVAILABLE=y
CT_ARCH_arm_AVAILABLE=y
CT_ARCH_avr32_AVAILABLE=y
CT_ARCH_blackfin_AVAILABLE=y
CT_ARCH_m68k_AVAILABLE=y
CT_ARCH_mips_AVAILABLE=y
CT_ARCH_powerpc_AVAILABLE=y
CT_ARCH_s390_AVAILABLE=y
CT_ARCH_sh_AVAILABLE=y
CT_ARCH_sparc_AVAILABLE=y
CT_ARCH_x86_AVAILABLE=y

#
# Generic target options
#
CT_ARCH_USE_MMU=y

#
# Target optimisations
#

#
# powerpc other options
#
CT_ARCH_POWERPC_SPE=y

#
# Toolchain options
#

#
# General toolchain options
#
CT_FORCE_SYSROOT=y
CT_USE_SYSROOT=y
CT_SYSROOT_NAME="sysroot"
CT_SYSROOT_DIR_PREFIX=""
# CT_STATIC_TOOLCHAIN is not set

#
# Tuple completion and aliasing
#
CT_TARGET_VENDOR="e500v2"
CT_TARGET_ALIAS_SED_EXPR=""
CT_TARGET_ALIAS=""

#
# Toolchain type
#
# CT_NATIVE is not set
CT_CROSS=y
# CT_CROSS_NATIVE is not set
# CT_CANADIAN is not set
CT_TOOLCHAIN_TYPE="cross"

#
# Build system
#
CT_BUILD=""
CT_BUILD_PREFIX=""
CT_BUILD_SUFFIX=""

#
# Operating System
#
# CT_BARE_METAL is not set
# CT_MINGW32 is not set
CT_KERNEL_SUPPORTS_SHARED_LIBS=y
CT_KERNEL="linux"
CT_KERNEL_VERSION="2.6.38.4"
# CT_KERNEL_bare_metal is not set
CT_KERNEL_linux=y
# CT_KERNEL_mingw32 is not set
CT_KERNEL_bare_metal_AVAILABLE=y
CT_KERNEL_linux_AVAILABLE=y
CT_KERNEL_mingw32_AVAILABLE=y

#
# Common kernel options
#
CT_SHARED_LIBS=y

#
# linux other options
#
CT_KERNEL_LINUX_INSTALL=y
# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
CT_KERNEL_V_2_6_38_4=y
# CT_KERNEL_V_2_6_38_3 is not set
# CT_KERNEL_V_2_6_38_2 is not set
# CT_KERNEL_V_2_6_38_1 is not set
# CT_KERNEL_V_2_6_38 is not set
# CT_KERNEL_V_2_6_37_6 is not set
# CT_KERNEL_V_2_6_36_4 is not set
# CT_KERNEL_V_2_6_35_13 is not set
# CT_KERNEL_V_2_6_34_9 is not set
# CT_KERNEL_V_2_6_33_12 is not set
# CT_KERNEL_V_2_6_32_39 is not set
# CT_KERNEL_V_2_6_31_14 is not set
# CT_KERNEL_V_2_6_27_58 is not set
# CT_KERNEL_LINUX_CUSTOM is not set
CT_KERNEL_LINUX_VERBOSITY_0=y
# CT_KERNEL_LINUX_VERBOSITY_1 is not set
# CT_KERNEL_LINUX_VERBOSITY_2 is not set
CT_KERNEL_LINUX_VERBOSE_LEVEL=0
CT_KERNEL_LINUX_INSTALL_CHECK=y

#
# Binary utilities
#
CT_ARCH_BINFMT_ELF=y
# CT_ARCH_BINFMT_FLAT is not set
# CT_ARCH_BINFMT_FDPIC is not set

#
# GNU binutils
#
CT_BINUTILS_V_2_21=y
# CT_BINUTILS_V_2_20_1 is not set
# CT_BINUTILS_V_2_20 is not set
# CT_BINUTILS_V_2_19_1 is not set
# CT_BINUTILS_V_2_19 is not set
# CT_BINUTILS_V_2_18 is not set
# CT_BINUTILS_V_2_17 is not set
# CT_BINUTILS_V_2_16_1 is not set
CT_BINUTILS_VERSION="2.21"
CT_BINUTILS_2_21_or_later=y
CT_BINUTILS_HAS_GOLD=y
CT_BINUTILS_HAS_PLUGINS=y
CT_BINUTILS_LINKER_LD=y
# CT_BINUTILS_LINKER_GOLD is not set
# CT_BINUTILS_LINKER_LD_GOLD is not set
# CT_BINUTILS_LINKER_GOLD_LD is not set
CT_BINUTILS_LINKERS_LIST="ld"
CT_BINUTILS_LINKER_DEFAULT="bfd"
# CT_BINUTILS_PLUGINS is not set
CT_BINUTILS_EXTRA_CONFIG="--enable-e500x2 --with-e500x2 --enable-spe=yes"
CT_BINUTILS_FOR_TARGET=y
CT_BINUTILS_FOR_TARGET_IBERTY=y
CT_BINUTILS_FOR_TARGET_BFD=y

#
# C compiler
#
CT_CC="gcc"
CT_CC_VERSION="4.4.6"
CT_CC_gcc=y
# CT_CC_GCC_SHOW_LINARO is not set
# CT_CC_V_linaro_4_6_2011_04_0 is not set
# CT_CC_V_4_6_0 is not set
# CT_CC_V_linaro_4_5_2011_04_0 is not set
# CT_CC_V_4_5_2 is not set
# CT_CC_V_4_5_1 is not set
# CT_CC_V_4_5_0 is not set
# CT_CC_V_linaro_4_4_2011_02_0 is not set
CT_CC_V_4_4_6=y
# CT_CC_V_4_4_5 is not set
# CT_CC_V_4_4_4 is not set
# CT_CC_V_4_4_3 is not set
# CT_CC_V_4_4_2 is not set
# CT_CC_V_4_4_1 is not set
# CT_CC_V_4_4_0 is not set
# CT_CC_V_4_3_5 is not set
# CT_CC_V_4_3_4 is not set
# CT_CC_V_4_3_3 is not set
# CT_CC_V_4_3_2 is not set
# CT_CC_V_4_3_1 is not set
# CT_CC_V_4_2_4 is not set
# CT_CC_V_4_2_3 is not set
# CT_CC_V_4_2_2 is not set
# CT_CC_V_4_2_1 is not set
# CT_CC_V_4_2_0 is not set
# CT_CC_V_4_1_2 is not set
# CT_CC_V_4_0_4 is not set
# CT_CC_V_3_4_6 is not set
# CT_CC_GCC_4_2 is not set
CT_CC_GCC_4_2_or_later=y
# CT_CC_GCC_4_3 is not set
CT_CC_GCC_4_3_or_later=y
CT_CC_GCC_4_4=y
CT_CC_GCC_4_4_or_later=y
# CT_CC_GCC_4_5 is not set
# CT_CC_GCC_4_5_or_later is not set
# CT_CC_GCC_4_6 is not set
# CT_CC_GCC_4_6_or_later is not set
CT_CC_GCC_HAS_GRAPHITE=y
# CT_CC_GCC_HAS_LTO is not set
CT_CC_GCC_USE_GMP_MPFR=y
CT_CC_GCC_USE_PPL_CLOOG=y
# CT_CC_GCC_USE_MPC is not set
# CT_CC_GCC_USE_LIBELF is not set
CT_CC_SUPPORT_CXX=y
CT_CC_SUPPORT_FORTRAN=y
CT_CC_SUPPORT_JAVA=y
CT_CC_SUPPORT_ADA=y
CT_CC_SUPPORT_OBJC=y
CT_CC_SUPPORT_OBJCXX=y

#
# Additional supported languages:
#
# CT_CC_LANG_CXX is not set
# CT_CC_LANG_FORTRAN is not set
# CT_CC_LANG_JAVA is not set
# CT_CC_LANG_ADA is not set
# CT_CC_LANG_OBJC is not set
# CT_CC_LANG_OBJCXX is not set
CT_CC_LANG_OTHERS=""

#
# gcc other options
#
CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
CT_CC_BUGURL=""
CT_CC_ENABLE_CXX_FLAGS=""
CT_CC_CORE_EXTRA_CONFIG=""
CT_CC_EXTRA_CONFIG="--with-cpu=8548"
CT_CC_STATIC_LIBSTDCXX=y

#
# Optimisation features
#
CT_CC_GCC_USE_GRAPHITE=y

#
# Settings for libraries running on target
#
CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
# CT_CC_GCC_LIBMUDFLAP is not set
# CT_CC_GCC_LIBGOMP is not set
# CT_CC_GCC_LIBSSP is not set

#
# Misc. obscure options.
#
CT_CC_CXA_ATEXIT=y
# CT_CC_GCC_DISABLE_PCH is not set
CT_CC_GCC_SJLJ_EXCEPTIONS=m
# CT_CC_GCC_LDBL_128 is not set

#
# C-library
#
CT_LIBC="uClibc"
CT_LIBC_VERSION="0.9.31"
# CT_LIBC_eglibc is not set
# CT_LIBC_glibc is not set
# CT_LIBC_mingw is not set
# CT_LIBC_newlib is not set
# CT_LIBC_none is not set
CT_LIBC_uClibc=y
CT_LIBC_eglibc_AVAILABLE=y
CT_LIBC_glibc_AVAILABLE=y
CT_LIBC_mingw_AVAILABLE=y
CT_LIBC_newlib_AVAILABLE=y
CT_LIBC_none_AVAILABLE=y
CT_LIBC_uClibc_AVAILABLE=y
CT_LIBC_UCLIBC_V_0_9_31=y
# CT_LIBC_UCLIBC_V_0_9_30_3 is not set
# CT_LIBC_UCLIBC_V_0_9_30_2 is not set
# CT_LIBC_UCLIBC_V_0_9_30_1 is not set
# CT_LIBC_UCLIBC_V_0_9_30 is not set
# CT_LIBC_UCLIBC_V_0_9_29 is not set
# CT_LIBC_UCLIBC_V_0_9_28_3 is not set
# CT_LIBC_UCLIBC_V_snapshot is not set
# CT_LIBC_UCLIBC_V_specific_date is not set
CT_LIBC_UCLIBC_0_9_30_or_later=y
CT_LIBC_UCLIBC_PARALLEL=y
CT_LIBC_UCLIBC_VERBOSITY_0=y
# CT_LIBC_UCLIBC_VERBOSITY_1 is not set
# CT_LIBC_UCLIBC_VERBOSITY_2 is not set
CT_LIBC_UCLIBC_VERBOSITY=""
CT_LIBC_UCLIBC_DEBUG_LEVEL_0=y
# CT_LIBC_UCLIBC_DEBUG_LEVEL_1 is not set
# CT_LIBC_UCLIBC_DEBUG_LEVEL_2 is not set
CT_LIBC_UCLIBC_DEBUG_LEVEL=0
CT_LIBC_UCLIBC_CONFIG_FILE="/home/baruch/download/crosstool-ng-ppc/uClibc.config"
CT_LIBC_SUPPORT_THREADS_ANY=y
# CT_LIBC_SUPPORT_NPTL is not set
CT_LIBC_SUPPORT_LINUXTHREADS=y
# CT_LIBC_SUPPORT_WIN32THREADS is not set
CT_LIBC_SUPPORT_THREADS_NONE=y
CT_THREADS="linuxthreads"

#
# Common C library options
#
# CT_THREADS_NPTL is not set
CT_THREADS_LINUXTHREADS=y
# CT_THREADS_WIN32THREADS is not set
# CT_THREADS_NONE is not set
CT_LIBC_XLDD=y

#
# uClibc other options
#
CT_LIBC_UCLIBC_LNXTHRD_OLD=y
# CT_LIBC_UCLIBC_LNXTHRD_NEW is not set
CT_LIBC_UCLIBC_LNXTHRD="old"
# CT_LIBC_UCLIBC_LOCALES is not set
# CT_LIBC_UCLIBC_WCHAR is not set

#
# Debug facilities
#
CT_DEBUG_dmalloc=y
CT_DMALLOC_V_5_5_2=y
CT_DMALLOC_VERSION="5.5.2"
CT_DEBUG_duma=y
CT_DUMA_A=y
CT_DUMA_SO=y
CT_DUMA_V_2_5_15=y
# CT_DUMA_V_2_5_14 is not set
# CT_DUMA_V_2_5_12 is not set
# CT_DUMA_V_2_5_8 is not set
# CT_DUMA_V_2_5_1 is not set
CT_DUMA_VERSION="2_5_15"
CT_DEBUG_gdb=y
CT_GDB_CROSS=y
# CT_GDB_CROSS_STATIC is not set
# CT_GDB_NATIVE is not set
CT_GDB_GDBSERVER=y
CT_GDB_GDBSERVER_STATIC=y

#
# gdb version
#
# CT_DEBUG_GDB_SHOW_LINARO is not set
# CT_GDB_V_linaro_7_2_2011_04_0 is not set
# CT_GDB_V_7_2 is not set
# CT_GDB_V_7_1 is not set
# CT_GDB_V_7_0_1 is not set
# CT_GDB_V_7_0 is not set
CT_GDB_V_6_8=y
CT_GDB_VERSION="6.8"
CT_DEBUG_ltrace=y
CT_LTRACE_V_0_5_3=y
# CT_LTRACE_V_0_5_2 is not set
# CT_LTRACE_V_0_5 is not set
# CT_LTRACE_V_0_4 is not set
CT_LTRACE_VERSION="0.5.3"
CT_LTRACE_0_5_3_or_later=y
CT_DEBUG_strace=y
# CT_STRACE_V_4_5_20 is not set
CT_STRACE_V_4_5_19=y
# CT_STRACE_V_4_5_18 is not set
# CT_STRACE_V_4_5_17 is not set
# CT_STRACE_V_4_5_16 is not set
# CT_STRACE_V_4_5_15 is not set
CT_STRACE_VERSION="4.5.19"

#
# Companion libraries
#
CT_COMPLIBS_NEEDED=y
CT_GMP_NEEDED=y
CT_MPFR_NEEDED=y
CT_PPL_NEEDED=y
CT_CLOOG_NEEDED=y
# CT_MPC_NEEDED is not set
# CT_LIBELF_NEEDED is not set
CT_COMPLIBS=y
CT_GMP=y
CT_MPFR=y
CT_PPL=y
CT_CLOOG=y
CT_LIBELF_TARGET=y
# CT_GMP_V_5_0_1 is not set
CT_GMP_V_4_3_2=y
# CT_GMP_V_4_3_1 is not set
# CT_GMP_V_4_3_0 is not set
# CT_GMP_V_4_2_4 is not set
# CT_GMP_V_4_2_2 is not set
CT_GMP_VERSION="4.3.2"
CT_MPFR_V_3_0_0=y
# CT_MPFR_V_2_4_2 is not set
# CT_MPFR_V_2_4_1 is not set
# CT_MPFR_V_2_4_0 is not set
# CT_MPFR_V_2_3_2 is not set
# CT_MPFR_V_2_3_1 is not set
CT_MPFR_VERSION="3.0.0"
# CT_PPL_V_0_11_2 is not set
# CT_PPL_V_0_11_1 is not set
# CT_PPL_V_0_11 is not set
CT_PPL_V_0_10_2=y
CT_PPL_VERSION="0.10.2"
# CT_PPL_0_11 is not set
# CT_PPL_NEEDS_LIBPWL is not set
CT_CLOOG_V_0_15_10=y
# CT_CLOOG_V_0_15_9 is not set
# CT_CLOOG_V_0_15_8 is not set
# CT_CLOOG_V_0_15_7 is not set
# CT_CLOOG_V_0_15_6 is not set
CT_CLOOG_VERSION="0.15.10"

#
# libelf version needed to build for target
#
CT_LIBELF_V_0_8_13=y
# CT_LIBELF_V_0_8_12 is not set
CT_LIBELF_VERSION="0.8.13"

#
# Companion libraries common options
#
# CT_COMPLIBS_CHECK is not set

#
# Companion tools
#

#
# READ HELP before you say 'Y' below !!!
#
# CT_COMP_TOOLS is not set

#
# Test suite
#
# CT_TEST_SUITE is not set
# CT_TEST_SUITE_GCC is not set
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Version: 0.9.31
# Tue Jun 28 10:36:08 2011
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
# TARGET_i386 is not set
# TARGET_i960 is not set
# TARGET_ia64 is not set
# TARGET_m68k is not set
# TARGET_microblaze is not set
# TARGET_mips is not set
# TARGET_nios is not set
# TARGET_nios2 is not set
TARGET_powerpc=y
# TARGET_sh is not set
# TARGET_sh64 is not set
# TARGET_sparc is not set
# TARGET_v850 is not set
# TARGET_vax is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="powerpc"
FORCE_OPTIONS_FOR_ARCH=y
# CONFIG_CLASSIC is not set
CONFIG_E500=y
TARGET_SUBARCH="e500"

#
# Using ELF file format
#
ARCH_BIG_ENDIAN=y

#
# Using Big Endian
#
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
DO_C99_MATH=y
# DO_XSI_MATH is not set
UCLIBC_HAS_FENV=y
UCLIBC_HAS_LONG_DOUBLE_MATH=y
KERNEL_HEADERS="/usr/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
# HAVE_NO_PIC is not set
# DOPIC is not set
# ARCH_HAS_NO_SHARED is not set
# ARCH_HAS_NO_LDSO is not set
HAVE_SHARED=y
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_LDD_SUPPORT=y
LDSO_CACHE_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
LDSO_BASE_FILENAME="ld.so"
UCLIBC_STATIC_LDCONFIG=y
LDSO_RUNPATH=y
LDSO_SEARCH_INTERP_PATH=y
UCLIBC_CTOR_DTOR=y
# LDSO_GNU_HASH_SUPPORT is not set
# HAS_NO_THREADS is not set
LINUXTHREADS_OLD=y
# LINUXTHREADS_NEW is not set
UCLIBC_HAS_THREADS=y
# PTHREADS_DEBUG_SUPPORT is not set
UCLIBC_HAS_SYSLOG=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
# MALLOC_GLIBC_COMPAT is not set
UCLIBC_DYNAMIC_ATEXIT=y
# COMPAT_ATEXIT is not set
UCLIBC_SUSV3_LEGACY=y
UCLIBC_SUSV3_LEGACY_MACROS=y
UCLIBC_SUSV4_LEGACY=y
# UCLIBC_HAS_STUBS is not set
UCLIBC_HAS_SHADOW=y
# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
UCLIBC_HAS_PTY=y
ASSUME_DEVPTS=y
UNIX98PTY_ONLY=y
# UCLIBC_HAS_GETPT is not set
# UCLIBC_HAS_LIBUTIL is not set
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"

#
# Advanced Library Settings
#
UCLIBC_PWD_BUFFER_SIZE=256
UCLIBC_GRP_BUFFER_SIZE=256

#
# Support various families of functions
#
UCLIBC_LINUX_MODULE_24=y
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
# UCLIBC_BSD_SPECIFIC is not set
# UCLIBC_HAS_BSD_ERR is not set
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
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
# UCLIBC_HAS_FULL_RPC is not set
# UCLIBC_HAS_REENTRANT_RPC is not set
# UCLIBC_USE_NETLINK is not set
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
# UCLIBC_HAS_LIBRESOLV_STUB is not set
# UCLIBC_HAS_LIBNSL_STUB is not set

#
# String and Stdio Support
#
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
UCLIBC_HAS_CTYPE_UNSAFE=y
# UCLIBC_HAS_CTYPE_CHECKED is not set
# UCLIBC_HAS_CTYPE_ENFORCED is not set
# UCLIBC_HAS_WCHAR is not set
# UCLIBC_HAS_LOCALE is not set
# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
# UCLIBC_HAS_GLIBC_CUSTOM_PRINTF is not set
# USE_OLD_VFPRINTF is not set
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
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
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
# UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not set
# UCLIBC_HAS_PRINTF_M_SPEC is not set
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GNU_GETSUBOPT=y

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
UCLIBC_HAS_REGEX_OLD=y
UCLIBC_HAS_FNMATCH=y
UCLIBC_HAS_FNMATCH_OLD=y
# UCLIBC_HAS_WORDEXP is not set
# UCLIBC_HAS_NFTW is not set
# UCLIBC_HAS_FTW is not set
UCLIBC_HAS_GLOB=y
# UCLIBC_HAS_GNU_GLOB is not set

#
# Library Installation Options
#
RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
DEVEL_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/usr/"
MULTILIB_DIR="lib"
HARDWIRED_ABSPATH=y

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
# UCLIBC_HAS_ARC4RANDOM is not set
# HAVE_NO_SSP is not set
# UCLIBC_HAS_SSP is not set
UCLIBC_BUILD_RELRO=y
# UCLIBC_BUILD_NOW is not set
UCLIBC_BUILD_NOEXECSTACK=y

#
# uClibc development/debugging options
#
CROSS_COMPILER_PREFIX=""
UCLIBC_EXTRA_CFLAGS=""
# DODEBUG is not set
# DODEBUG_PT is not set
DOSTRIP=y
# DOASSERTS is not set
# SUPPORT_LD_DEBUG is not set
# SUPPORT_LD_DEBUG_EARLY is not set
# UCLIBC_MALLOC_DEBUGGING is not set
WARNINGS="-Wall"
# EXTRA_WARNINGS is not set
# DOMULTI is not set
# UCLIBC_MJN3_ONLY is not set
