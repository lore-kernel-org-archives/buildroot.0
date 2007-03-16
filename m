From: David Clark <dlclark@chtech.com>
Date: Fri, 16 Mar 2007 00:22:02 -0500
Subject: [Buildroot] PXA255 RFS and Toolchain
Message-ID: <007b01c7678b$07ca9320$0f01a8c0@longhorn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I trying to build a root filesystem, and toolchain using buildroot for a
Xscale PXA255 processor module (specifically the Compulab CM-X255).  I
have been unsuccessful and am hoping that someone more experienced can
take a look at my configs.  

Everything build without error and I get a RFS with Busybox and uClibc
and a toolchain.  If I take a simple hello world program and statically
build it against uClibc using the new toolchain, and make it be "init"
the boot log stops at "Freeing Init Memory..".  I do not see "Hello
World."  If I take the same hello world code and statically build it
against gLibc using a toolchain provided by Compulab, and make it "init"
I do see "Hello World."  In both cases the hello world code compiles
without error.

Obviously something in either my uClibc configuration or my
buildroot/toolchain configuration is incorrect.  Below are the relevant
config files.

David Clark

<<<<<<<<<<<<<<<<<<<<<<<<  buildroot  .config file
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_generic_arm is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm1136jf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
BR2_xscale=y
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM_XSCALE"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_
Design_Flow/Linux_Host/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Toolchain Options
#

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_4_25 is not set
# BR2_KERNEL_HEADERS_2_4_27 is not set
# BR2_KERNEL_HEADERS_2_4_29 is not set
# BR2_KERNEL_HEADERS_2_4_31 is not set
# BR2_KERNEL_HEADERS_2_6_9 is not set
# BR2_KERNEL_HEADERS_2_6_11 is not set
BR2_KERNEL_HEADERS_2_6_12=y
# BR2_KERNEL_HEADERS_2_6_19_2 is not set
# BR2_KERNEL_HEADERS_2_6_20 is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.12"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28 is not set
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
# BR2_ENABLE_LOCALE is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PTHREAD_DEBUG is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
# BR2_BINUTILS_VERSION_2_15 is not set
# BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
# BR2_BINUTILS_VERSION_2_16_1 is not set
# BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_5 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_6 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_7 is not set
BR2_BINUTILS_VERSION_2_17=y
# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
BR2_BINUTILS_VERSION="2.17"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
# BR2_GCC_VERSION_3_4_2 is not set
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_3_4_5 is not set
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_1_2 is not set
BR2_GCC_VERSION_4_2=y
BR2_GCC_IS_SNAP=y
BR2_GCC_SNAP_DATE="20061121"
BR2_GCC_VERSION="4.2"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libmudflap"
# BR2_INSTALL_LIBSTDCPP is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y

#
# Ccache Options
#
# BR2_CCACHE is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# elf2flt
#
# BR2_ELF2FLT is not set
# BR2_MKLIBS is not set

#
# Common Toolchain Options
#
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
BR2_LARGEFILE=y
# BR2_SOFT_FLOAT is not set
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#

#
# The default minimal system
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_0_1 is not set
# BR2_BUSYBOX_VERSION_1_1_3 is not set
# BR2_BUSYBOX_VERSION_1_2_2_1 is not set
# BR2_BUSYBOX_VERSION_1_4_0 is not set
BR2_BUSYBOX_VERSION_1_4_1=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.2.2.1.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GCC_TARGET is not set
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
# BR2_PACKAGE_MAKE is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_MPATROL is not set
# BR2_PACKAGE_PKGCONFIG is not set
# BR2_READLINE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_MICROCOM is not set
# BR2_PACKAGE_PORTAGE is not set
# BR2_PACKAGE_SQLITE is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set
BR2_NETWORK_SUPPORT=y
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_HOSTAP is not set
# BR2_PACKAGE_IPERF is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_OPENSWAN is not set
BR2_PACKAGE_PORTMAP=y
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
BR2_PACKAGE_TFTPD=y
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
BR2_BLOCKDEV_SUPPORT=y
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MKDOSFS is not set
# BR2_PACKAGE_MTD is not set
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_RAIDTOOLS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set
# BR2_AUDIO_SUPPORT is not set
# BR2_GRAPHIC_SUPPORT is not set
BR2_PACKAGE_NCURSES=y
BR2_COMPRESSOR_SUPPORT=y
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZMA_TARGET is not set
# BR2_PACKAGE_LZMA_HOST is not set
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_ZLIB_TARGET_HEADERS=y
# BR2_SCRIPTING_SUPPORT is not set

#
# Target Options
#

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set

#
# bootloader for target device
#

#
# Board Support Options
#
# BR2_PACKAGE_LINUX is not set

#
# Arm based Device Support
#
# BR2_TARGET_ARM_INTEGRATOR_926 is not set

#
# Atmel Target
#

#
# Add Atmel Target here
#

#
# Sharp Specific Device Support
#
# BR2_TARGET_SHARP_LNODE80 is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set  


<<<<<<<<<<<<<<<<<<<<<<<<  uClibc-0.9.29.config
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#
# Automatically generated make config: don't edit
# Wed Mar 14 17:51:56 2007
#
# TARGET_alpha is not set
TARGET_arm=y
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
# TARGET_powerpc is not set
# TARGET_sh is not set
# TARGET_sh64 is not set
# TARGET_sparc is not set
# TARGET_v850 is not set
# TARGET_vax is not set
# TARGET_x86_64 is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
# CONFIG_ARM_OABI is not set
CONFIG_ARM_EABI=y
# USE_BX is not set
# CONFIG_GENERIC_ARM is not set
# CONFIG_ARM610 is not set
# CONFIG_ARM710 is not set
# CONFIG_ARM7TDMI is not set
# CONFIG_ARM720T is not set
# CONFIG_ARM920T is not set
# CONFIG_ARM922T is not set
# CONFIG_ARM926T is not set
# CONFIG_ARM10T is not set
# CONFIG_ARM1136JF_S is not set
# CONFIG_ARM_SA110 is not set
# CONFIG_ARM_SA1100 is not set
CONFIG_ARM_XSCALE=y
# CONFIG_ARM_IWMMXT is not set
TARGET_SUBARCH=""

#
# Using ELF file format
#
ARCH_ANY_ENDIAN=y
ARCH_LITTLE_ENDIAN=y
# ARCH_WANTS_BIG_ENDIAN is not set
ARCH_WANTS_LITTLE_ENDIAN=y
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
DO_C99_MATH=y
KERNEL_HEADERS="/home/devlab/em405-8/rootfs/sources/buildroot/toolchain_
build_arm/linux/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
# HAVE_NO_PIC is not set
# DOPIC is not set
# HAVE_NO_SHARED is not set
# ARCH_HAS_NO_LDSO is not set
HAVE_SHARED=y
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_LDD_SUPPORT=y
LDSO_CACHE_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
LDSO_BASE_FILENAME="ld.so"
# UCLIBC_STATIC_LDCONFIG is not set
# LDSO_RUNPATH is not set
# UCLIBC_CTOR_DTOR is not set
# HAS_NO_THREADS is not set
UCLIBC_HAS_THREADS=y
# PTHREADS_DEBUG_SUPPORT is not set
LINUXTHREADS_OLD=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
# MALLOC_GLIBC_COMPAT is not set
# UCLIBC_DYNAMIC_ATEXIT is not set
# COMPAT_ATEXIT is not set
# UCLIBC_SUSV3_LEGACY is not set
# UCLIBC_SUSV3_LEGACY_MACROS is not set
UCLIBC_HAS_SHADOW=y
# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
# UCLIBC_HAS___PROGNAME is not set
# UNIX98PTY_ONLY is not set
ASSUME_DEVPTS=y
# UCLIBC_HAS_TM_EXTENSIONS is not set
# UCLIBC_HAS_TZ_CACHING is not set
# UCLIBC_HAS_TZ_FILE is not set

#
# Networking Support
#
# UCLIBC_HAS_IPV6 is not set
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
# UCLIBC_USE_NETLINK is not set

#
# String and Stdio Support
#
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
UCLIBC_HAS_CTYPE_CHECKED=y
# UCLIBC_HAS_CTYPE_ENFORCED is not set
UCLIBC_HAS_WCHAR=y
# UCLIBC_HAS_LOCALE is not set
# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
# UCLIBC_HAS_GLIBC_CUSTOM_PRINTF is not set
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE is not set
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8=y
# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
# UCLIBC_HAS_PRINTF_M_SPEC is not set
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
# UCLIBC_HAS_SIGNUM_MESSAGES is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GNU_GETSUBOPT=y

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_REGEX_OLD is not set
UCLIBC_HAS_FNMATCH=y
UCLIBC_HAS_FNMATCH_OLD=y
# UCLIBC_HAS_WORDEXP is not set
# UCLIBC_HAS_FTW is not set
UCLIBC_HAS_GLOB=y
# UCLIBC_HAS_GNU_GLOB is not set

#
# Library Installation Options
#
SHARED_LIB_LOADER_PREFIX="/lib"
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
# UCLIBC_HAS_ARC4RANDOM is not set
# HAVE_NO_SSP is not set
# UCLIBC_HAS_SSP is not set
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
# UCLIBC_BUILD_NOEXECSTACK is not set

#
# uClibc development/debugging options
#
CROSS_COMPILER_PREFIX="/home/devlab/em405-8/rootfs/sources/buildroot/bui
ld_arm/staging_dir/bin/arm-linux-uclibcgnueabi-"
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
