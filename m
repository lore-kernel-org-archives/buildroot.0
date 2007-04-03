From: kumar.gireesh at wipro.com <kumar.gireesh@wipro.com>
Date: Tue, 3 Apr 2007 10:18:01 +0530
Subject: [Buildroot] Buildroot fails to compile for QEMU,
	with flag BR2_TARGET_ARM_INTEGRATOR_926=y
Message-ID: <545178E7F5D6364CA182451CF7958ADAE14422@BLR-EC-MBX01.wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi,

I'm using buildroot-20070330.tar.bz2 for compiling an arm-linux-uclibc toolchain. 
My intention is to run it on qemu, but when I compile the toolchain with option BR2_TARGET_ARM_INTEGRATOR_926=y, it fails.

Kindly help me if anyone has fixed this.

Please find the error log and config file inline.

Thanks,
Gireesh 

ERROR LOG:
----------

make[1]: Entering directory `/home/wipro/arm-cross-tools/arm-qemu-test/buildroot/build_arm/linux-2.6.20.4'
  CHK     include/linux/version.h
make[2]: `include/asm-arm/mach-types.h' is up to date.
  CHK     include/linux/utsrelease.h
  CC      arch/arm/kernel/asm-offsets.s
cc1: error: invalid option `abi=aapcs-linux'
make[2]: *** [arch/arm/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make[1]: Leaving directory `/home/wipro/arm-cross-tools/arm-qemu-test/buildroot/build_arm/linux-2.6.20.4'
make: *** [/home/wipro/arm-cross-tools/arm-qemu-test/buildroot/build_arm/linux-2.6.20.4/.depend_done] Error 2



CONFIG FILE:
--------------

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
BR2_generic_arm=y
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="GENERIC_ARM"
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
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
BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
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
# BR2_KERNEL_HEADERS_2_6_12 is not set
# BR2_KERNEL_HEADERS_2_6_19_2 is not set
BR2_KERNEL_HEADERS_2_6_20=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.20.4"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28 is not set
BR2_UCLIBC_VERSION_0_9_28_3=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
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
# BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
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
BR2_GCC_VERSION_3_4_6=y
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2 is not set
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="3.4.6"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_LIBSTDCPP is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y

#
# Ccache Options
#
BR2_CCACHE=y

#
# Gdb Options
#
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
# BR2_PACKAGE_GDB_HOST is not set
# BR2_GDB_VERSION_6_2_1 is not set
BR2_GDB_VERSION_6_3=y
# BR2_GDB_VERSION_6_4 is not set
# BR2_GDB_VERSION_6_5 is not set
# BR2_GDB_VERSION_SNAPSHOT is not set
BR2_GDB_VERSION="6.3"

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
# BR2_PACKAGE_BUSYBOX is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_COREUTILS=y
BR2_PACKAGE_DIFFUTILS=y
BR2_PACKAGE_ED=y
BR2_PACKAGE_FINDUTILS=y
BR2_PACKAGE_FLEX=y
# BR2_PACKAGE_FLEX_LIBFL is not set
BR2_PACKAGE_GAWK=y
BR2_PACKAGE_GCC_TARGET=y
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
BR2_PACKAGE_GREP=y
BR2_PACKAGE_MAKE=y
BR2_PACKAGE_PATCH=y
BR2_PACKAGE_SED=y
BR2_PACKAGE_TAR=y

#
# Other development stuff
#
BR2_PACKAGE_AUTOCONF=y
BR2_PACKAGE_AUTOMAKE=y
# BR2_PACKAGE_BISON is not set
BR2_PACKAGE_CCACHE_TARGET=y
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_LIBMPFR is not set
BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_M4=y
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
BR2_PACKAGE_FILE=y
# BR2_PACKAGE_KEXEC is not set
BR2_PACKAGE_LESS=y
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_MICROCOM is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_MODUTILS is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_PORTAGE is not set
BR2_PACKAGE_PROCPS=y
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SQLITE is not set
BR2_PACKAGE_STRACE=y
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_TINYLOGIN is not set
# BR2_PACKAGE_UEMACS is not set
BR2_PACKAGE_UTIL-LINUX=y
# BR2_PACKAGE_WHICH is not set
# BR2_NETWORK_SUPPORT is not set
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_NETKITBASE=y
BR2_PACKAGE_RSYNC=y
# BR2_BLOCKDEV_SUPPORT is not set
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_PCIUTILS=y
# BR2_AUDIO_SUPPORT is not set
# BR2_GRAPHIC_SUPPORT is not set
BR2_PACKAGE_NCURSES=y
# BR2_COMPRESSOR_SUPPORT is not set
BR2_PACKAGE_GZIP=y
BR2_PACKAGE_ZLIB=y
# BR2_SCRIPTING_SUPPORT is not set

#
# Target Options
#

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
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
BR2_PACKAGE_LINUX=y

#
# Arm based Device Support
#
BR2_TARGET_ARM_INTEGRATOR_926=y

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
BR2_TARGET_GENERIC_DEV_SYSTEM=y





The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments. 

WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.
 
www.wipro.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070403/dbd5d384/attachment.htm 
