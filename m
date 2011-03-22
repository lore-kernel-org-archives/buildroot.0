From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 21 Mar 2011 21:35:14 -0700
Subject: [Buildroot] build without linux, busybox,
	- just buildroot internal toolchain
In-Reply-To: <201103212243.38429.tmohr@s.netic.de>
References: <201103202325.39993.tmohr@s.netic.de>	<AANLkTi=t3L2WbrJXY0QRejbZTVKfNPbeSLjBazO3+E8T@mail.gmail.com>
	<201103212243.38429.tmohr@s.netic.de>
Message-ID: <4D882702.9000807@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am trying buildroot partitioned into systems. In my toolchain only 
tree, I disable both kernel, busybox, and all packages. This works, but 
for some reason the entire linux kernel is unpacked in the 
output/toolchain/linux-2.6.37.2. I am not clear on why the toolchain 
needs linux headers, but ok, why does it need the full source?

Here is my buildroot .config

#
# Automatically generated make config: don't edit
# Buildroot 2011.02 Configuration
# Mon Mar 21 17:45:16 2011
#
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_bfin is not set
# BR2_i386 is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_generic_arm is not set
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set

#
# cortex-A8/A9 needs gcc >= 4.4.x
#
BR2_cortex_a8=y
# BR2_cortex_a9 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM_CORTEXA8"
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="cortex-a8"
BR2_GCC_TARGET_ARCH="armv7-a"
BR2_GCC_TARGET_ABI="aapcs-linux"

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=4
# BR2_CCACHE is not set
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
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_CTNG is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_35 is not set
# BR2_KERNEL_HEADERS_2_6_36 is not set
BR2_KERNEL_HEADERS_2_6_37=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.37.2"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_31=y
# BR2_UCLIBC_VERSION_0_9_32 is not set
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.31"
BR2_UCLIBC_CONFIG="target/device/beagleboard/beagleboard-uClibc-0.9.31.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_20 is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
BR2_BINUTILS_VERSION_2_21=y
BR2_BINUTILS_VERSION="2.21"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_X is not set
# BR2_GCC_VERSION_4_4_X is not set
BR2_GCC_VERSION_4_5_X=y
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.5.2"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_OBJC is not set
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set
BR2_LARGEFILE=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_ENABLE_LOCALE=y
BR2_TOOLCHAIN_HAS_THREADS=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
BR2_NEEDS_GETTEXT_IF_LOCALE=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"

#
# Toolchain Options
#
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
# BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 is not set
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
# BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION is not set
# BR2_TOOLCHAIN_BUILDROOT_CXX is not set
# BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_ELF2FLT is not set
# BR2_MKLIBS is not set

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="Beagleboard_Buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot - Beagleboard style"
BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_16_X is not set
# BR2_BUSYBOX_VERSION_1_17_X is not set
BR2_BUSYBOX_VERSION_1_18_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.18.3"
BR2_PACKAGE_BUSYBOX_CONFIG="target/device/beagleboard/beagleboard-busybox-1.18.x.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_CUSTOMIZE is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_ALSA_UTILS is not set
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FAAD2 is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_FFMPEG is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LAME is not set
# BR2_PACKAGE_LIBAO is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBCUE is not set
# BR2_PACKAGE_LIBCUEFILE is not set
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBMPEG2 is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set

#
# mpd requires a toolchain with C++ and WCHAR support
#
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_SPEEX is not set

#
# swfdec requires a toolchain with WCHAR and C++ support
#
# BR2_PACKAGE_TIDSP_BINARIES is not set

#
# festival requires a toolchain with C++ support enabled
#

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_VORBIS_TOOLS is not set
# BR2_PACKAGE_WAVPACK is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LMBENCH is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP_TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_WHETSTONE is not set

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BINUTILS is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CCACHE is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FLEX is not set

#
# native toolchain needs development files in target filesystem
#
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_GMP is not set

#
# gperf requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_MPC is not set
# BR2_PACKAGE_MPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_SSTRIP is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# Graphic applications
#
# BR2_PACKAGE_RRDTOOL is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_SDL is not set

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
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LSUIO is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_RNG_TOOLS is not set
# BR2_PACKAGE_SDPARM is not set
# BR2_PACKAGE_SETSERIAL is not set

#
# smartmontools requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set

#
# usbutils requires a toolchain with PROGRAM_INVOCATION support
#
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
# BR2_PACKAGE_OPENSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLITE is not set

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
# BR2_PACKAGE_GDK_PIXBUF is not set

#
# libgtk2 requires a toolchain with WCHAR and C++ support
#
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set

#
# pango requires a toolchain with WCHAR and C++ support
#
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
# BR2_PACKAGE_LIBHID is not set
# BR2_PACKAGE_LIBUSB is not set

#
# Networking
#
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
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
# BR2_PACKAGE_ARGP_STANDALONE is not set
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFFI is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBOIL is not set

#
# libsigc++ requires a toolchain with C++ support enabled
#

#
# Text and terminal handling
#

#
# enchant requires a toolchain with C++ and WCHAR support enabled
#

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# XML
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ and WCHAR support enabled
#

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

#
# ctorrent requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set

#
# Kismet requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_XL2TP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MII_DIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set

#
# olsr requires a toolchain with IPv6 support
#
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RSH_REDONE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set

#
# Squid requires a toolchain with C++ and IPv6 support enabled
#
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
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
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_WHICH is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#
# BR2_PACKAGE_DSP_TOOLS is not set

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/target/device/beagleboard/patchrootfs.sh"
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set

#
# initramfs requires a Linux kernel to be built
#
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
# BR2_TARGET_UBOOT is not set
# BR2_TARGET_AT91BOOTSTRAP is not set
# BR2_TARGET_DATAFLASHBOOT is not set

#
# Kernel
#
# BR2_LINUX_KERNEL is not set
