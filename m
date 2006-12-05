From: Real.Magic at gmx.de <Real.Magic@gmx.de>
Date: Tue, 05 Dec 2006 08:29:49 +0100
Subject: [Buildroot] error building for PPC without daily snapshots
Message-ID: <20061205072949.166450@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building buildroot toolchain with:
headers 2.6.12, binutils 2.17, gcc 4.0.3 without daily snapshots for busybox and uClibc, 
fails (.config appended below).

How can I avoid these errors in "adjtimex.c" ?


/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-gcc  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing   -msoft-float  -fno-builtin -nostdinc -D_LIBC -I../../../../include -I.  -Os -funit-at-a-time   -isystem /home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/lib/gcc/powerpc-linux-uclibc/4.0.3/include -DNDEBUG -fpic -c _exit.c -o _exit.o
_exit.c:32: warning: '__syscall_exit' used but never defined
/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-strip -x -R .note -R .comment _exit.o
/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-gcc  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing   -msoft-float  -fno-builtin -nostdinc -D_LIBC -I../../../../include -I.  -Os -funit-at-a-time   -isystem /home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/lib/gcc/powerpc-linux-uclibc/4.0.3/include -DNDEBUG -fpic -c access.c -o access.o
/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-strip -x -R .note -R .comment access.o
/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-gcc  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing   -msoft-float  -fno-builtin -nostdinc -D_LIBC -I../../../../include -I.  -Os -funit-at-a-time   -isystem /home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/lib/gcc/powerpc-linux-uclibc/4.0.3/include -DNDEBUG -fpic -c acct.c -o acct.o
/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-strip -x -R .note -R .comment acct.o
/home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-gcc  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing   -msoft-float  -fno-builtin -nostdinc -D_LIBC -I../../../../include -I.  -Os -funit-at-a-time   -isystem /home/guelckma/Projects/buildroot-20061204/build_powerpc_nofpu/staging_dir/lib/gcc/powerpc-linux-uclibc/4.0.3/include -DNDEBUG -fpic -c adjtimex.c -o adjtimex.o
adjtimex.c:14: error: '__adjtimex' aliased to undefined symbol 'adjtimex'
adjtimex.c:15: error: 'ntp_adjtime' aliased to undefined symbol 'adjtimex'
make[5]: *** [adjtimex.o] Error 1
make[5]: Leaving directory `/home/guelckma/Projects/buildroot-20061204/toolchain_build_powerpc_nofpu/uClibc-0.9.28/libc/sysdeps/linux/common'
make[4]: *** [common] Error 2
make[4]: Leaving directory `/home/guelckma/Projects/buildroot-20061204/toolchain_build_powerpc_nofpu/uClibc-0.9.28/libc/sysdeps/linux'
make[3]: *** [_dir_linux] Error 2
make[3]: Leaving directory `/home/guelckma/Projects/buildroot-20061204/toolchain_build_powerpc_nofpu/uClibc-0.9.28/libc/sysdeps'
make[2]: *** [_dir_sysdeps] Error 2
make[2]: Leaving directory `/home/guelckma/Projects/buildroot-20061204/toolchain_build_powerpc_nofpu/uClibc-0.9.28/libc'
make[1]: *** [_dir_libc] Fehler 2
make[1]: Verlasse Verzeichnis '/home/guelckma/Projects/buildroot-20061204/toolchain_build_powerpc_nofpu/uClibc-0.9.28'
make: *** [/home/guelckma/Projects/buildroot-20061204/toolchain_build_powerpc_nofpu/uClibc-0.9.28/lib/libc.a] Fehler 2
guelckma at new_user-lx:~/Projects/buildroot-20061204$







My .config:

#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_cris is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
BR2_powerpc=y
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
BR2_ARCH="powerpc"
BR2_ENDIAN="BIG"

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
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
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
# BR2_KERNEL_HEADERS_2_6_19 is not set
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
BR2_BINUTILS_VERSION_2_17=y
# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
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
BR2_GCC_VERSION_4_0_3=y
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_2 is not set
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="4.0.3"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
# BR2_INSTALL_LIBGCJ is not set
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
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
# BR2_GDB_VERSION_6_2_1 is not set
# BR2_GDB_VERSION_6_3 is not set
# BR2_GDB_VERSION_6_4 is not set
BR2_GDB_VERSION_6_5=y
# BR2_GDB_VERSION_SNAPSHOT is not set
BR2_GDB_VERSION="6.5"

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
# The minimum needed to build a uClibc development system
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
# BR2_PACKAGE_VALGRIND is not set
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
# BR2_TARGET_YABOOT is not set

#
# Board Support Options
#

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set



-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal f?r Modem und ISDN: http://www.gmx.net/de/go/smartsurfer
