From: Joachim Pihl <joachim.pihl@sensordevelopments.com>
Date: Wed, 08 Sep 2010 07:31:26 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <20100907165650.7cf10d65@surf>
References: <op.vinvdkgksev97k@joachim-lappis>
	<20100907150948.4de996e3@surf> <op.viny90lpsev97k@joachim-lappis>
	<20100907165650.7cf10d65@surf>
Message-ID: <1283923886.18866.7.camel@joachim-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2010-09-07 at 16:56 +0200, Thomas Petazzoni wrote:

> At what step exactly do you get the failure ?

Again, I really can't remember, I had my mind focused elsewhere... For a
test, I set up a virtual machine for linux (with virtualbox). I am not
doing that again, it is _dead slow_. Building Buildroot takes ~2 hours -
on an i7!

> The best is if you could provide a .config file for Buildroot 2010.08
> that shows the failure.

This config file fails on kernel image installation. You should get the
other failures by setting uClibc to 0.9.31, by adding gdbserver (the
avr32-patched version) to target, and setting U-boot to latest.

-------------- next part --------------
#
# Automatically generated make config: don't edit
# Wed Sep  8 07:10:06 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.08"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
BR2_avr32=y
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
BR2_ARCH="avr32"
BR2_ENDIAN="BIG"

#
# Target options
#

#
# Preset Devices
#
BR2_BOARD_NAME="atngw100"
BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
BR2_TARGET_ATMEL=y

#
# Atmel AVR32 Specific Device Support
#
BR2_TARGET_AVR32=y
BR2_TARGET_AT32AP7000=y
# BR2_TARGET_AT32AP7001 is not set
# BR2_TARGET_AT32AP7002 is not set
# BR2_TARGET_AT32AP7200 is not set

#
# Development board support
#
# BR2_TARGET_AVR32_ATSTK1002 is not set
# BR2_TARGET_AVR32_ATSTK1005 is not set
BR2_TARGET_AVR32_ATNGW100=y
# BR2_TARGET_AVR32_ATNGW100_BASE is not set

#
# Package support
#

#
# Secondary locations
#
# BR2_TARGET_VALKA is not set

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_BZR_CO="bzr co"
BR2_BZR_UP="bzr up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_STAGING_DIR="/opt/avr32-toolchain"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_JLEVEL=2
# BR2_DEPRECATED is not set
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
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set

#
# Advanced
#
# BR2_CONFIG_CACHE is not set

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
# BR2_KERNEL_HEADERS_2_6_29 is not set
# BR2_KERNEL_HEADERS_2_6_30 is not set
# BR2_KERNEL_HEADERS_2_6_31 is not set
# BR2_KERNEL_HEADERS_2_6_32 is not set
# BR2_KERNEL_HEADERS_2_6_33 is not set
BR2_KERNEL_HEADERS_2_6_34=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.34.3"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_29 is not set
BR2_UCLIBC_VERSION_0_9_30=y
# BR2_UCLIBC_VERSION_0_9_31 is not set
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.30.3"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1=y
# BR2_BINUTILS_VERSION_2_19 is not set
# BR2_BINUTILS_VERSION_2_19_1 is not set
# BR2_BINUTILS_VERSION_2_20 is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
BR2_BINUTILS_VERSION="2.18-avr32-1.0.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
BR2_GCC_VERSION_4_2_2_AVR32_2_1_5=y
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_X is not set
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_VERSION="4.2.2-avr32-2.1.5"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y

#
# Ccache Options
#
# BR2_CCACHE is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set

#
# Gdb debugger for the target needs WCHAR support in toolchain
#
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
BR2_USE_WCHAR=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
BR2_PROGRAM_INVOCATION=y
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TARGET_OPTIMIZATION="-pipe"
# BR2_MKLIBS is not set
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_13_X is not set
# BR2_BUSYBOX_VERSION_1_14_X is not set
# BR2_BUSYBOX_VERSION_1_15_X is not set
# BR2_BUSYBOX_VERSION_1_16_X is not set
BR2_BUSYBOX_VERSION_1_17_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.17.1"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.17.x.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_CUSTOMIZE is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_FFMPEG is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set
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
# BR2_PACKAGE_SWFDEC is not set
# BR2_PACKAGE_FESTIVAL is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set

#
# lmbench requires a toolchain with RPC support
#

#
# lsof requires a toolchain with RPC support
#
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_STRACE is not set

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FLEX is not set

#
# native toolchain needs development files in target filesystem
#
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PKG_CONFIG is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#
# BR2_PACKAGE_QT is not set
# BR2_PACKAGE_XORG7 is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_LIBERATION is not set

#
# X Window managers
#

#
# X applications
#
# BR2_PACKAGE_GOB2 is not set

#
# midori requires C++, WCHAR in toolchain and libgtk2
#

#
# Hardware handling
#
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_CRAMFS is not set

#
# dbus not available (need expat or libxml2)
#
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PHP is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set

#
# Libraries
#

#
# Compression and decompression
#
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
BR2_PACKAGE_ZLIB=y

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_MYSQL_CLIENT is not set
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_SQLITE_READLINE=y

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_TIFF is not set

#
# webkit requires C++, WCHAR in toolchain and libgtk2
#

#
# Hardware handling
#
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_LIBUSB is not set

#
# Networking
#
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set

#
# Other
#
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBOIL is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
BR2_PACKAGE_ICU=y
# BR2_PACKAGE_LIBICONV is not set
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
BR2_PACKAGE_POPT=y
BR2_PACKAGE_READLINE=y
# BR2_PACKAGE_SLANG is not set

#
# XML
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_XERCES is not set

#
# Miscellaneous
#
# BR2_PACKAGE_SHARED_MIME_INFO is not set

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BIND is not set

#
# bmon requires a toolchain with IPv6 support
#
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IPERF is not set

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_SNTP=y

#
# olsr requires a toolchain with IPv6 support
#
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SQUID is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
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
# Package managers
#
# BR2_PACKAGE_IPKG is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
BR2_PACKAGE_LOGROTATE=y
# BR2_PACKAGE_SCREEN is not set
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_WHICH is not set

#
# System tools
#

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="atngw100"
# BR2_TARGET_UBOOT_2010_06 is not set
# BR2_TARGET_UBOOT_2010_03 is not set
# BR2_TARGET_UBOOT_2009_11 is not set
BR2_TARGET_UBOOT_2009_08=y
# BR2_TARGET_UBOOT_CUSTOM_TARBALL is not set
BR2_TARGET_UBOOT_VERSION="2009.08"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR=""
BR2_TARGET_UBOOT_FORMAT_BIN=y
# BR2_TARGET_UBOOT_FORMAT_KWB is not set
# BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
# BR2_TARGET_UBOOT_TOOL_ENV is not set
BR2_TARGET_UBOOT_NETWORK=y
BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
BR2_TARGET_UBOOT_ETH1ADDR=""

#
# Kernel
#
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_2_6_34=y
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_VERSION="2.6.34.1"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
BR2_LINUX_KERNEL_DEFCONFIG="atngw100"
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_BZIMAGE is not set
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
