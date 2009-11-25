From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Wed, 25 Nov 2009 15:28:26 -0800
Subject: [Buildroot] Help Booting Kernel on an ml507
In-Reply-To: <87r5rm9oz7.fsf@macbook.be.48ers.dk>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E2@EXCHANGEVS01.appsig.com>
	<87r5rm9oz7.fsf@macbook.be.48ers.dk>
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E3@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, 

That is a good point.  I was intending on using the initramfs because I
hadn't thought of other options.  I'll look into the squashfs.  

My cpio.gz image is 543K.  
I am building for the powerpc 440 (no FPU).

Here is the .config file for BR:
#
# Automatically generated make config: don't edit
# Wed Nov 25 11:53:54 2009
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2009.08"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
BR2_powerpc=y
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_generic_powerpc is not set
# BR2_powerpc_401 is not set
# BR2_powerpc_403 is not set
# BR2_powerpc_405 is not set
# BR2_powerpc_405fp is not set
BR2_powerpc_440=y
# BR2_powerpc_440fp is not set
# BR2_powerpc_505 is not set
# BR2_powerpc_601 is not set
# BR2_powerpc_602 is not set
# BR2_powerpc_603 is not set
# BR2_powerpc_603e is not set
# BR2_powerpc_604 is not set
# BR2_powerpc_604e is not set
# BR2_powerpc_620 is not set
# BR2_powerpc_630 is not set
# BR2_powerpc_740 is not set
# BR2_powerpc_7400 is not set
# BR2_powerpc_7450 is not set
# BR2_powerpc_750 is not set
# BR2_powerpc_801 is not set
# BR2_powerpc_821 is not set
# BR2_powerpc_823 is not set
# BR2_powerpc_860 is not set
# BR2_powerpc_970 is not set
# BR2_powerpc_8540 is not set
BR2_ARCH="powerpc"
BR2_ENDIAN="BIG"
BR2_GCC_TARGET_TUNE="440"

#
# Target options
#

#
# Project Options
#
BR2_PROJECT="circuit_accelerator"
BR2_HOSTNAME="Circuit Processor"
BR2_BANNER="Starting Circuit Accelerator"

#
# Preset Devices
#
# BR2_TARGET_AMD is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set

#
# Generic development system requires a toolchain with WCHAR and
PROGRAM_INVOCATION support
#
# BR2_TARGET_GENERIC_GETTY is not set

#
# Build options
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_COPYTO=""

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"

#
# Atmel Mirrors
#
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
# BR2_FPU_SUFFIX is not set
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_RECENT=y
# BR2_CONFIG_CACHE is not set
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
BR2_TOOLCHAIN_SOURCE=y
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_GCC_VERSION_4_2_2=y
BR2_EXT_GCC_VERSION_4_2_3=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_BINUTILS_VERSION_2_18=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_30=y
BR2_EXT_UCLIBC_VERSION_0_9_30_1=y

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_26 is not set
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
# BR2_KERNEL_HEADERS_2_6_29 is not set
BR2_KERNEL_HEADERS_2_6_30=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.30.5"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_30_1=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.30.1"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
BR2_BINUTILS_VERSION_2_19_1=y
BR2_BINUTILS_VERSION="2.19.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_1 is not set
# BR2_GCC_VERSION_4_2_2 is not set
# BR2_GCC_VERSION_4_2_3 is not set
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_2 is not set
BR2_GCC_VERSION_4_3_3=y
# BR2_GCC_VERSION_4_3_4 is not set
# BR2_GCC_VERSION_4_4_X is not set
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.3"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_FORTRAN is not set
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
# Common Toolchain Options
#
# BR2_LARGEFILE is not set
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
# BR2_USE_WCHAR is not set
# BR2_SOFT_FLOAT is not set
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PROGRAM_INVOCATION is not set
# BR2_INSTALL_LIBSTDCPP is not set
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_MKLIBS is not set
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_12_X is not set
# BR2_BUSYBOX_VERSION_1_13_X is not set
BR2_BUSYBOX_VERSION_1_14_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.14.3"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_MAKE is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_VALGRIND is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBOIL is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set

#
# logrotate     - disabled (requires wchar support)
#
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set

#
# Database
#

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLITE is not set

#
# Networking
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set

#
# bind requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE is not set

#
# ctorrent requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set

#
# iptables requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MDNSRESPONDER is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set

#
# netkitbase requires a toolchain with RPC support
#
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set

#
# quagga suite
#
# BR2_PACKAGE_QUAGGA_ZEBRA is not set
# BR2_PACKAGE_QUAGGA_BGPD is not set
# BR2_PACKAGE_QUAGGA_RIPD is not set
# BR2_PACKAGE_QUAGGA_RIPNGD is not set
# BR2_PACKAGE_QUAGGA_OSPFD is not set
# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
# BR2_PACKAGE_QUAGGA_ISISD is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Hardware handling / blockdevices and filesystem maintenance
#

#
# dbus not available (need expat or libxml2)
#

#
# dbus-glib needs dbus to be compiled with expat support
#
# BR2_PACKAGE_DEVMEM2 is not set

#
# dmraid requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_LIBUUID is not set

#
# e2fsprogs requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set

#
# libfuse requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LM_SENSORS is not set

#
# lvm2 requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set

#
# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
#

#
# ntfsprogs requires a toolchain with WCHAR support
#
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# alsa-utils requires a toolchain with LARGEFILE support
#

#
# asterisk      - disabled (required openssl and mpg123)
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_FESTIVAL is not set

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_VLC is not set

#
# Graphic libraries and applications (graphic/text)
#

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
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_TIFF is not set

#
# busybox graphic applications
#

#
# --> May be broken in busybox
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FBSET is not set

#
# other GUIs
#

#
# qt requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_XORG7 is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_LIBDRM is not set
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_OPENMOTIF is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_TSLIB is not set

#
# webkit requires a toolchain with C++ support and WCHAR enabled
#

#
# X Window managers
#
# BR2_PACKAGE_MATCHBOX is not set

#
# X applications
#
# BR2_PACKAGE_ALSAMIXERGUI is not set
# BR2_PACKAGE_GQVIEW is not set
# BR2_PACKAGE_GOB2 is not set
# BR2_PACKAGE_LEAFPAD is not set
# BR2_PACKAGE_PCMANFM is not set
# BR2_PACKAGE_SYLPHEED is not set
# BR2_PACKAGE_TORSMO is not set
# BR2_PACKAGE_X11VNC is not set
# BR2_PACKAGE_XPDF is not set
# BR2_PACKAGE_XSTROKE is not set

#
# Compressors / decompressors
#
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZOP is not set

#
# lzma requires a toolchain with C++ support
#
# BR2_PACKAGE_LZMA_HOST is not set
# BR2_PACKAGE_ZLIB is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set

#
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set

#
# ruby requires a toolchain with WCHAR support
#
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ support enabled
#

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_MAGICCUBE4D is not set
# BR2_PACKAGE_PRBOOM is not set
# BR2_PACKAGE_RUBIX is not set
# BR2_PACKAGE_VICE is not set
# BR2_PACKAGE_XBOARD is not set

#
# Target filesystem options
#
BR2_ROOTFS_PREFIX="br.initramfs"
BR2_ROOTFS_SUFFIX=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_ROOTFS_CPIO=y
# BR2_TARGET_ROOTFS_CPIO_NONE is not set
BR2_TARGET_ROOTFS_CPIO_GZIP=y
# BR2_TARGET_ROOTFS_CPIO_BZIP2 is not set
# BR2_TARGET_ROOTFS_CPIO_LZMA is not set
BR2_TARGET_ROOTFS_CPIO_COPYTO="/tmp/ml507-kernel/linux-2.6-xlnx.git/arch
/powerpc/initramfs-images/br.initramfs.powerpc.cpio"
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_YABOOT is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set


Here is the serial output of the linux kernel:
	zImage starting: loaded at 0x00400000 (sp: 0x00613fb0)
	Allocating 0x3bb9a9 bytes for kernel ...
	gunzipping (0x00000000 <- 0x0040e000:0x006128d2)...done 0x39e02c
bytes

	Linux/PowerPC load: console=ttyS0 ip=on root=/dev/ram
	Finalizing device tree... flat tree at 0x620300
	Using Xilinx Virtex440 machine description
	Linux version 2.6.31 (rneal@caddyshack11) (gcc version 4.3.3
(GCC) ) #6 PREEMPT Wed Nov
	25 15:23:03 PST 2009
	Zone PFN ranges:
	  DMA      0x00000000 -> 0x00010000
	  Normal   0x00010000 -> 0x00010000
	Movable zone start PFN for each node
	early_node_map[1] active PFN ranges
	    0: 0x00000000 -> 0x00010000
	MMU: Allocated 1088 bytes of context maps for 255 contexts
	Built 1 zonelists in Zone order, mobility grouping on.  Total
pages: 65024
	Kernel command line: console=ttyS0 ip=on root=/dev/ram
	PID hash table entries: 1024 (order: 10, 4096 bytes)
	Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
	Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
	Memory: 255744k/262144k available (3548k kernel code, 6116k
reserved, 132k data, 114k bs
	s, 696k init)
	Kernel virtual memory layout:
	  * 0xffffe000..0xfffff000  : fixmap
	  * 0xfde00000..0xfe000000  : consistent mem
	  * 0xfde00000..0xfde00000  : early ioremap
	  * 0xd1000000..0xfde00000  : vmalloc & ioremap
	NR_IRQS:512
	clocksource: timebase mult[a00000] shift[22] registered
	Console: colour dummy device 80x25
	Mount-cache hash table entries: 512
	NET: Registered protocol family 16
	PCI: Probing PCI hardware
	bio: create slab <bio-0> at 0
	XGpio: /plb at 0/gpio at 81460000: registered
	XGpio: /plb at 0/gpio at 81400000: registered
	XGpio: /plb at 0/gpio at 81420000: registered
	XGpio: /plb at 0/gpio at 81440000: registered
	NET: Registered protocol family 2
	IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
	TCP established hash table entries: 8192 (order: 4, 65536 bytes)
	TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
	TCP: Hash tables configured (established 8192 bind 8192)
	TCP reno registered
	NET: Registered protocol family 1
	ROMFS MTD (C) 2007 Red Hat, Inc.
	msgmni has been set to 500
	io scheduler noop registered
	io scheduler anticipatory registered
	io scheduler deadline registered
	io scheduler cfq registered (default)
	Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
	83e00000.serial: ttyS0 at MMIO 0x83e01003 (irq = 16) is a 16550
	console [ttyS0] enabled
	brd: module loaded
	loop: module loaded
	Device Tree Probing 'ethernet'
	xilinx_lltemac 81c00000.ethernet: MAC address is now  2: 0: 0:
0: 0: 0
	xilinx_lltemac 81c00000.ethernet: XLlTemac: using DMA mode.
	XLlTemac: DCR address: 0x80
	XLlTemac: buffer descriptor size: 32768 (0x8000)
	XLlTemac: Allocating DMA descriptors with kmalloc
	XLlTemac: (buffer_descriptor_init) phy: 0xf8b8000, virt:
0xcf8b8000, size: 0x8000
	XTemac: PHY detected at address 7.
	xilinx_lltemac 81c00000.ethernet: eth0: Xilinx TEMAC at
0x81C00000 mapped to 0xD1036000,
	 irq=17
	mice: PS/2 mouse device common for all mice
	TCP cubic registered
	NET: Registered protocol family 17
	eth0: XLlTemac: Options: 0x3fa
	eth0: XLlTemac: allocating interrupt 19 for dma mode tx.
	eth0: XLlTemac: allocating interrupt 18 for dma mode rx.
	eth0: XLlTemac: speed set to 1000Mb/s
	eth0: XLlTemac: Send Threshold = 24, Receive Threshold = 4
	eth0: XLlTemac: Send Wait bound = 254, Receive Wait bound = 254
	Sending DHCP requests ., OK
	IP-Config: Got DHCP answer from 0.0.0.0, my address is
10.49.211.5
	IP-Config: Complete:
	     device=eth0, addr=10.49.211.5, mask=255.255.240.0,
gw=10.49.223.254,
	     host=10.49.211.5, domain=appsig.com, nis-domain=appsig.com,
	     bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
	Freeing unused kernel memory: 696k init
	Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

Thanks again!

::Ryan

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Wednesday, November 25, 2009 3:14 PM
To: NEAL, RYAN
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Help Booting Kernel on an ml507

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> Hello,

 Ryan> I am trying to use buildroot to create a rootfs (specifically a
 Ryan> initramfs) that I can incorporate with the Xilinx linux kernel
 Ryan> (2.6?).

Why would you btw want to use an initramfs instead of a real flash file
system? Initramfs uses more RAM and typically boots slower than
E.G. squashfs.

 Ryan> When I run this I get the following problems:


 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on

 Ryan>                 Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on
root=/dev/ram

 Ryan>                 Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010


How big is your cpio.gz / zImage?


 Ryan> I then tried to just get to a shell by doing the following:

 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on
rdinit=/bin/sh

 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on
root=/dev/ram
 Ryan> rdinit=/bin/sh

  Ryan> Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

 Ryan> init has generated signal 5 but has no handler for it

So it gets all the way to init? Please paste the complete serial output.

Are you using hardware or software floating point in buildroot? please
paste your buildroot .config.

 Ryan> Kernel panic - not syncing: Attempted to kill init!

 Ryan> Call Trace:

 Ryan> [cf831d80] [c0005f88] show_stack+0x48/0x15c (unreliable)

 Ryan> [cf831db0] [c0220c80] panic+0x94/0x174

 Ryan> [cf831e00] [c0038490] do_group_exit+0x0/0xb8

 Ryan> [cf831e50] [c000bf68] _exception+0x19c/0x1a4

 Ryan> [cf831f40] [c000e8c0] ret_from_except_full+0x0/0x4c

Enable CONFIG_KALLSYMS so you get a proper symbolic backtrace.

-- 
Bye, Peter Korsgaard
