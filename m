From: yoseph <yosephcz@yahoo.com>
Date: Fri, 8 Dec 2006 07:02:43 -0800 (PST)
Subject: [Buildroot] buildroot for ARM target problem
Message-ID: <10551.72920.qm@web33202.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
please help me with following problem. I have tried
make buildroot for ARM target, I am using buildroot
snapshot 20061201. I did "make menuconfig" - I set ARM
target / 920T core, EABI, globally disabled floating
point support (for details please see config file
below) and finally I did "make". Make process stopped
with error. I have tried this on SUSE 10.2 and Redhat
Enterprise 4 - the same error result. I have installed
development tools (gcc etc.) on host computers
correctly - on SUSE host gcc 4.0 and Redhat host gcc
3.4.4. I am trying two days to solve this error, but
no success. I tried "make" with no "make menuconfig" =
with default configurayion i386 target, but there was
other error.

Could anybody send me some functional config for ARM
target?



Error message - ARM / 920T target:

/cc/buildroot2/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-ar
cr libc.a obj.string
/cc/buildroot2/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-ar
cr libc.a obj.sysdeps.common
/cc/buildroot2/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-ar
cr libc.a obj.sysdeps.arm
cp libc.a shared_libc.a
/cc/buildroot2/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-ar
cr libc.a misc/internals/static.o
/cc/buildroot2/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-ranlib
libc.a
/cc/buildroot2/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-ld
-EL -shared --warn-common --warn-once -z combreloc -z
defs -s  -soname=libc.so.0 -o libuClibc-0.9.28.so \
                --whole-archive shared_libc.a \
                ../libc/misc/internals/interp.o
--no-whole-archive \
                -init __uClibc_init
../lib/ld-uClibc.so.0
/cc/buildroot2/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibcgnueabi/4.0.3/libgcc.a
shared_libc.a(difftime.o): In function `difftime':
time.c:(.text+0x8): undefined reference to
`__floatsidf'
time.c:(.text+0x2c): undefined reference to `__subdf3'
shared_libc.a(_fpmaxtostr.o): In function
`_fpmaxtostr':
_fpmaxtostr.c:(.text+0xe4): undefined reference to
`__nedf2'
_fpmaxtostr.c:(.text+0x108): undefined reference to
`__eqdf2'
_fpmaxtostr.c:(.text+0x124): undefined reference to
`__divdf3'
_fpmaxtostr.c:(.text+0x130): undefined reference to
`__ltdf2'
_fpmaxtostr.c:(.text+0x1d4): undefined reference to
`__muldf3'
_fpmaxtostr.c:(.text+0x3b4): undefined reference to
`__gedf2'
_fpmaxtostr.c:(.text+0x458): undefined reference to
`__adddf3'
shared_libc.a(__psfs_do_numeric.o): In function
`__psfs_do_numeric':
scanf.c:(.text+0x530): undefined reference to
`__truncdfsf2'
shared_libc.a(strtof.o): In function `strtof':
strtod.c:(.text+0x1c): undefined reference to
`__extendsfdf2'
/cc/buildroot2/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibcgnueabi/4.0.3/libgcc.a(_fixunsdfsi.o):
In function `__fixunsdfsi':
libgcc2.c:(.text+0x3c): undefined reference to
`__fixdfsi'
make[2]: *** [shared] Error 1
make[2]: Leaving directory
`/cc/buildroot2/toolchain_build_arm_nofpu/uClibc-0.9.28/libc'
make[1]: *** [shared] Error 2
make[1]: Leaving directory
`/cc/buildroot2/toolchain_build_arm_nofpu/uClibc-0.9.28'
make: ***
[/cc/buildroot2/toolchain_build_arm_nofpu/uClibc-0.9.28/lib/libc.a]
Error 2









My config:

#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
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
BR2_arm920t=y
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm1136jf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
BR2_ARM_TYPE="ARM920T"
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="zcat"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_JLEVEL=1

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
# BR2_KERNEL_HEADERS_2_6_18 is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.12"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
# BR2_ENABLE_LOCALE is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set

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
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
BR2_BINUTILS_VERSION_2_17_50_0_7=y
BR2_BINUTILS_VERSION="2.17.50.0.7"
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
BR2_GCC_VERSION_4_0_3=y
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_2 is not set
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="4.0.3"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_LIBSTDCPP is not set
# BR2_INSTALL_OBJC is not set
BR2_GCC_SHARED_LIBGCC=y

#
# Ccache Options
#
BR2_CCACHE=y

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
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#

#
# The default minimal system
#
BR2_PACKAGE_BUSYBOX=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"

#
# The minimum needed to build a uClibc development
system
#
# BR2_PACKAGE_BASH is not set
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_SED is not set
# BR2_PACKAGE_TAR is not set

#
# Other stuff
#
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_ASTERISK is not set
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_ISC_DHCP is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_GZIP is not set
# BR2_PACKAGE_HASERL is not set
BR2_PACKAGE_HDPARM=y
# BR2_PACKAGE_HOSTAP is not set
# BR2_PACKAGE_HOTPLUG is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZMA_TARGET is not set
# BR2_PACKAGE_LZMA_HOST is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MICROCOM is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_MICROWIN is not set
# BR2_PACKAGE_MKDOSFS is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_MODUTILS is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_OPENSWAN is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PKGCONFIG is not set
# BR2_PACKAGE_PORTAGE is not set
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_QTE is not set
# BR2_PACKAGE_RAIDTOOLS is not set
# BR2_READLINE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_RXVT is not set
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SLANG is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SQLITE is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_STUNNEL is not set
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYLOGIN is not set
# BR2_PACKAGE_TINYX is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_UDHCP is not set
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_UTIL-LINUX is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WHICH is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_XFSPROGS is not set
# BR2_PACKAGE_XORG is not set
# BR2_PACKAGE_ZLIB is not set

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
# BR2_TARGET_ROOTFS_EXT2_GZ is not set
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



Best regards,
yosephcz


 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
