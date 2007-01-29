From: Xu Jianfeng-A20136 <A20136@motorola.com>
Date: Mon, 29 Jan 2007 16:18:11 +0800
Subject: [Buildroot] build problem (binutils-2.15 + gcc 3.4.2 + uClibc
	0.9.28)
Message-ID: <565F40B9893580489B94B8D324460AF4012227F1@zmy16exm63.ds.mot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,
 
I'm trying build a ARM toolchain of binutils-2.15 + gcc 3.4.2 + uClibc
0.9.28. 
I met a build error when make binutils/objdump:
 
gcc -W -Wall -Wstrict-prototypes -Wmissing-prototypes -g -O2 -o ld-new
ldgram.o
ldlex.o lexsup.o ldlang.o mri.o ldctor.o ldmain.o ldwrite.o ldexp.o
ldemul.o ldv
er.o ldmisc.o ldfile.o ldcref.o earmelf_linux.o earmelf.o
../bfd/.libs/libbfd.a
 ../libiberty/libiberty.a
ldmain.o(.text+0x4b2): In function `main':
/home/jfxu/buildtools/buildroot/toolchain_build_arm/binutils-2.15/ld/ldm
ain.c:40
2: undefined reference to `_bfd_set_link_info'
ldmain.o(.text+0x4be):/home/jfxu/buildtools/buildroot/toolchain_build_ar
m/binuti
ls-2.15/ld/ldmain.c:405: undefined reference to
`_bfd_set_force_make_executable'
collect2: ld returned 1 exit status
 
The build host is a Fedora Core 4 box. Command gcc -v shows:
 
Using built-in specs.
Target: i386-redhat-linux
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man
--infodir=/u
sr/share/info --enable-shared --enable-threads=posix
--enable-checking=release -
-with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions
--enable-
libgcj-multifile --enable-languages=c,c++,objc,java,f95,ada
--enable-java-awt=gt
k --with-java-home=/usr/lib/jvm/java-1.4.2-gcj-1.4.2.0/jre
--host=i386-redhat-li
nux
Thread model: posix
gcc version 4.0.0 20050519 (Red Hat 4.0.0-8)
 
 
I'm a newbie on Buildroot tool. Can someone advise where is the problem?
 
Below is my .config of buildroot:
 
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
# BR2_arm920t is not set
# BR2_arm922t is not set
BR2_arm926t=y
# BR2_arm1136jf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM926T"
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
# BR2_x86_i586 is not set
# BR2_x86_i686 is not set
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
BR2_DL_DIR="$(HOME)/downloads"
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
BR2_KERNEL_HEADERS_2_6_9=y
# BR2_KERNEL_HEADERS_2_6_11 is not set
# BR2_KERNEL_HEADERS_2_6_12 is not set
# BR2_KERNEL_HEADERS_2_6_19_2 is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.9"
 
#
# uClibc Options
#
BR2_UCLIBC_VERSION_0_9_28=y
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
BR2_BINUTILS_VERSION_2_15=y
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
# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
BR2_BINUTILS_VERSION="2.15"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
BR2_GCC_VERSION_3_4_2=y
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_3_4_5 is not set
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_2 is not set
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="3.4.2"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
# BR2_INSTALL_LIBGCJ is not set
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
BR2_BUSYBOX_VERSION_1_2_2_1=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.2.2.1.config"
# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
 
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
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_SED is not set
# BR2_PACKAGE_TAR is not set
 
#
# Other development stuff
#
# BR2_PACKAGE_UCLIBC_TARGET_HEADERS is not set
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
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
# BR2_PACKAGE_LESS is not set
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
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SQLITE is not set
# BR2_PACKAGE_STRACE is not set
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_TINYLOGIN is not set
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_UTIL-LINUX is not set
# BR2_PACKAGE_WHICH is not set
BR2_NETWORK_SUPPORT=y
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_ISC_DHCP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_HOSTAP is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NETCAT is not set
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
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDHCP is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
BR2_BLOCKDEV_SUPPORT=y
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_HAL is not set
BR2_PACKAGE_HDPARM=y
# BR2_PACKAGE_HOTPLUG is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MKDOSFS is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_RAIDTOOLS is not set
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set
BR2_AUDIO_SUPPORT=y
# BR2_PACKAGE_ASTERISK is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_MPG123 is not set
BR2_GRAPHIC_SUPPORT=y
 
#
# text rendering libraries
#
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_SLANG is not set
 
#
# text rendering applications
#
# BR2_PACKAGE_DIALOG is not set
 
#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_TIFF is not set
 
#
# other GUIs
#
# BR2_PACKAGE_QTE is not set
# BR2_PACKAGE_QTOPIA4 is not set
 
#
# X Window System server
#
# BR2_PACKAGE_XORG is not set
# BR2_PACKAGE_TINYX is not set
 
#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBGTK2 is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
 
#
# X Window managers
#
# BR2_PACKAGE_METACITY is not set
 
#
# X applications
#
# BR2_PACKAGE_RDESKTOP is not set
# BR2_PACKAGE_RXVT is not set
BR2_COMPRESSOR_SUPPORT=y
# BR2_PACKAGE_GZIP is not set
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZMA_TARGET is not set
# BR2_PACKAGE_LZMA_HOST is not set
# BR2_PACKAGE_ZLIB is not set
BR2_SCRIPTING_SUPPORT=y
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set
 
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

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070129/f0b25fdf/attachment-0001.html 
