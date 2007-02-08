From: Steve Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Thu, 8 Feb 2007 11:38:38 -0800
Subject: [Buildroot] Buildroot: Problem locating crt1.o on target system.
Message-ID: <200702081138.38218.hwstar@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been using buildroot for quite some time and recently decided to upgrade 
it as some of the packages in the older version I'm using are no longer 
available for download. 

I've run into a problem using the C compiler and linker on the target system. 
I can't compile a simple "hello world" program written in C on the target 
system. 

The compiler/linker complains it can't find crt1.o, even though it is located 
in /user/lib. The exact error message is:

?/usr/bin/ld: crt1.o: No such file: No such file or directory

I configured buildroot for gcc 3.4.2 and binutils 2.16. I selected the the 
2.4.31 kernel headers.

The system in question ?was built using the 2/6/07 snapshot tarball of 
buildroot.

The config file for buildroot is attached.

Is there some configuration option I missed?

TIA Steve.
-------------- next part --------------
#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_cris is not set
BR2_i386=y
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
BR2_x86_i586=y
# BR2_x86_i686 is not set
BR2_ARCH="i586"
BR2_ENDIAN="LITTLE"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
# BR2_TAR_VERBOSITY is not set
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
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
BR2_KERNEL_HEADERS_2_4_31=y
# BR2_KERNEL_HEADERS_2_6_11 is not set
# BR2_KERNEL_HEADERS_2_6_12 is not set
BR2_DEFAULT_KERNEL_HEADERS="2.4.31"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
# BR2_ENABLE_LOCALE is not set
BR2_PTHREADS=y
# BR2_PTHREADS_NATIVE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
# BR2_BINUTILS_VERSION_2_15 is not set
# BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
# BR2_BINUTILS_VERSION_2_15_97 is not set
# BR2_BINUTILS_VERSION_2_16 is not set
BR2_BINUTILS_VERSION_2_16_1=y
# BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_2 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_3 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_4 is not set
BR2_BINUTILS_VERSION="2.16.1"

#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
BR2_GCC_VERSION_3_4_2=y
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_1_0 is not set
BR2_GCC_VERSION="3.4.2"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_LIBSTDCPP is not set
# BR2_INSTALL_OBJC is not set

#
# Ccache Options
#
BR2_CCACHE=y

#
# Gdb Options
#
BR2_PACKAGE_GDB=y
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_CLIENT is not set
# BR2_GDB_VERSION_6_2_1 is not set
BR2_GDB_VERSION_6_3=y
# BR2_GDB_VERSION_SNAPSHOT is not set
BR2_GDB_VERSION="6.3"
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set

#
# Common Toolchain Options
#
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
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
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_COREUTILS=y
BR2_PACKAGE_DIFFUTILS=y
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_FINDUTILS is not set
BR2_PACKAGE_FLEX=y
BR2_PACKAGE_GAWK=y
BR2_PACKAGE_GCC_TARGET=y
# BR2_PACKAGE_CCACHE_TARGET is not set
BR2_PACKAGE_GREP=y
BR2_PACKAGE_MAKE=y
BR2_PACKAGE_PATCH=y
# BR2_PACKAGE_SED is not set
BR2_PACKAGE_TAR=y

#
# Other stuff
#
# BR2_PACKAGE_ACPID is not set
BR2_PACKAGE_AUTOCONF=y
BR2_PACKAGE_AUTOMAKE=y
# BR2_PACKAGE_BERKELEYDB is not set
BR2_PACKAGE_BISON=y
BR2_PACKAGE_BOA=y
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_ISC_DHCP is not set
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_GETTEXT is not set
BR2_PACKAGE_GZIP=y
# BR2_PACKAGE_HOSTAP is not set
# BR2_PACKAGE_HOTPLUG is not set
# BR2_PACKAGE_IOSTAT is not set
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_IPTABLES=y
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBMAD is not set
BR2_PACKAGE_LIBPCAP=y
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_LZO is not set
BR2_PACKAGE_M4=y
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
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_HEADERS=y
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETSNMP is not set
BR2_PACKAGE_NEWT=y
BR2_PACKAGE_NTP=y
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_TARGET_HEADERS=y
# BR2_PACKAGE_OPENVPN is not set
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_PORTAGE is not set
# BR2_PACKAGE_PORTMAP is not set
BR2_PACKAGE_PPPD=y
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_QTE is not set
BR2_QTE_TMAKE_VERSION="1.13"
# BR2_PACKAGE_RAIDTOOLS is not set
# BR2_READLINE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_RXVT is not set
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SLANG is not set
# BR2_PACKAGE_SOCAT is not set
BR2_PACKAGE_STRACE=y
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_TCL is not set
BR2_PACKAGE_TCPDUMP=y
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_TINYLOGIN is not set
# BR2_PACKAGE_TINYX is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_UDHCP is not set
# BR2_PACKAGE_UTIL-LINUX is not set
BR2_PACKAGE_VALGRIND=y
# BR2_PACKAGE_VTUN is not set
BR2_PACKAGE_WGET=y
BR2_PACKAGE_WHICH=y
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_XFSPROGS is not set
# BR2_PACKAGE_XORG is not set
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_ZLIB_TARGET_HEADERS=y
BR2_PACKAGE_NOIP=y

#
# Target Options
#

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
# BR2_TARGET_ROOTFS_EXT2_GZ is not set
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set

#
# bootloader for target device
#
# BR2_TARGET_GRUB is not set
# BR2_TARGET_SYSLINUX is not set

#
# Board Support Options
#
# BR2_TARGET_SOEKRIS_NET4521 is not set
# BR2_TARGET_VIA_EPIA_MII is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
