From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Fri, 24 Sep 2010 07:20:20 -0400
Subject: [Buildroot] e2fsck crashes
In-Reply-To: <878w2s8aux.fsf@macbook.be.48ers.dk>
References: <4C9B3DBC.7040700@signaturealpha.com>
	<878w2s8aux.fsf@macbook.be.48ers.dk>
Message-ID: <4C9C8974.2090403@signaturealpha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi,

Buildroot v 2010.08

I just run e2fsck /dev/hda2. The check goes on but the crash seems to 
occur at the end (fsck does the same).

I am having problem getting the error messages to be output on my serial 
terminal in order to copy and paste the output here... I though that 
e2fschk /dev/hda2 2>/dev/ttyS0 would work but I have included after 
.config the /var/log/messages with the errors

Thanks

.config

#
# Automatically generated make config: don't edit
# Thu Sep 23 06:55:37 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.08"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
BR2_i386=y
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
# BR2_x86_i386 is not set
BR2_x86_i486=y
# BR2_x86_i586 is not set
# BR2_x86_i686 is not set
# BR2_x86_pentiumpro is not set
# BR2_x86_pentium_mmx is not set
# BR2_x86_pentium_m is not set
# BR2_x86_pentium2 is not set
# BR2_x86_pentium3 is not set
# BR2_x86_pentium4 is not set
# BR2_x86_prescott is not set
# BR2_x86_nocona is not set
# BR2_x86_core2 is not set
# BR2_x86_k6 is not set
# BR2_x86_k6_2 is not set
# BR2_x86_athlon is not set
# BR2_x86_athlon_4 is not set
# BR2_x86_opteron is not set
# BR2_x86_opteron_sse3 is not set
# BR2_x86_barcelona is not set
# BR2_x86_geode is not set
# BR2_x86_c3 is not set
# BR2_x86_winchip_c6 is not set
# BR2_x86_winchip2 is not set
BR2_ARCH="i486"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i486"
BR2_GCC_TARGET_ARCH="i486"

#
# Target options
#

#
# Preset Devices
#
BR2_BOARD_NAME="i686"
BR2_BOARD_PATH="target/device/x86/$(BR2_BOARD_NAME)"
BR2_TARGET_X86=y
BR2_TARGET_I686=y
BR2_TARGET_GENERIC_HOSTNAME="sa_linux"
BR2_TARGET_GENERIC_ISSUE="Welcome to sa_linux"
# BR2_TARGET_GENERIC_GETTY is not set

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
BR2_STAGING_DIR="$(BASE_DIR)/staging"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
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
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_31=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.31"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
# BR2_BINUTILS_VERSION_2_19_1 is not set
# BR2_BINUTILS_VERSION_2_20 is not set
BR2_BINUTILS_VERSION_2_20_1=y
BR2_BINUTILS_VERSION="2.20.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_X is not set
BR2_GCC_VERSION_4_4_X=y
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.4.4"
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
BR2_PACKAGE_GDB=y

#
# Gdb debugger for the target needs WCHAR support in toolchain
#
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
# BR2_GDB_VERSION_6_6 is not set
# BR2_GDB_VERSION_6_7_1 is not set
# BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 is not set
BR2_GDB_VERSION_6_8=y
# BR2_GDB_VERSION_7_0_1 is not set
# BR2_GDB_VERSION_7_1 is not set
BR2_GDB_VERSION="6.8"

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
BR2_INET_RPC=y
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
BR2_USE_WCHAR=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
BR2_PTHREADS=y
# BR2_PTHREADS_OLD is not set
# BR2_PTHREADS_NATIVE is not set
# BR2_PROGRAM_INVOCATION is not set
# BR2_INSTALL_LIBSTDCPP is not set
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

#
# swfdec requires a toolchain with WCHAR and C++ support
#

#
# festival requires a toolchain with C++ support enabled
#

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_TREMOR is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_LZOP is not set

#
# lzma requires a toolchain with C++ support
#

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LMBENCH is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set

#
# oprofile requires a toolchain with C++ support enabled
#
BR2_PACKAGE_STRACE=y
# BR2_PACKAGE_VALGRIND is not set

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

#
# gperf requires a toolchain with C++ support enabled
#
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
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_CRAMFS is not set

#
# dbus not available (need expat or libxml2)
#
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_UTILS=y
# BR2_PACKAGE_E2FSPROGS_BADBLOCKS is not set
# BR2_PACKAGE_E2FSPROGS_BLKID is not set
# BR2_PACKAGE_E2FSPROGS_CHATTR is not set
# BR2_PACKAGE_E2FSPROGS_DUMPE2FS is not set
# BR2_PACKAGE_E2FSPROGS_E2FREEFRAG is not set
BR2_PACKAGE_E2FSPROGS_E2FSCK=y
BR2_PACKAGE_E2FSPROGS_E2LABEL=y
BR2_PACKAGE_E2FSPROGS_E2UNDO=y
# BR2_PACKAGE_E2FSPROGS_FILEFRAG is not set
# BR2_PACKAGE_E2FSPROGS_FINDFS is not set
BR2_PACKAGE_E2FSPROGS_FSCK=y
# BR2_PACKAGE_E2FSPROGS_LOGSAVE is not set
# BR2_PACKAGE_E2FSPROGS_LSATTR is not set
BR2_PACKAGE_E2FSPROGS_MKE2FS=y
BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND=y
BR2_PACKAGE_E2FSPROGS_TUNE2FS=y
BR2_PACKAGE_E2FSPROGS_UUIDGEN=y
BR2_PACKAGE_E2FSPROGS_UUIDD=y

#
# e2fsprogs libraries
#
BR2_PACKAGE_E2FSPROGS_LIBUUID=y
BR2_PACKAGE_E2FSPROGS_LIBBLKID=y
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

#
# enchant requires a toolchain with C++ and WCHAR support enabled
#

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_LIBICONV is not set
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
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ support enabled
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
BR2_PACKAGE_DROPBEAR=y
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set

#
# Kismet requires a toolchain with C++ support enabled
#
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
# BR2_PACKAGE_NFS_UTILS is not set
BR2_PACKAGE_NTP=y
# BR2_PACKAGE_NTP_SNTP is not set

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
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set

#
# Squid requires a toolchain with C++ support enabled
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
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
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
# BR2_TARGET_ROOTFS_ISO9660 is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
# BR2_TARGET_GRUB is not set
BR2_TARGET_SYSLINUX=y
# BR2_TARGET_PXELINUX is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_2_6_34=y
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_VERSION="2.6.34.6"
BR2_LINUX_KERNEL_PATCH=""
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/marc/buildroot-2010.08/vortex86/vortex.config"
# BR2_LINUX_KERNEL_UIMAGE is not set
BR2_LINUX_KERNEL_BZIMAGE=y
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set


/var/log/messages


Sep 24 01:05:43 sa_linux syslog.info syslogd started: BusyBox v1.17.1
Sep 24 01:05:43 sa_linux user.info linuxrc: starting pid 970, tty 
'/dev/null': '/sbin/klogd -n'
Sep 24 01:05:43 sa_linux user.notice kernel: klogd started: BusyBox 
v1.17.1 (2010-09-23 07:13:47 EDT)
Sep 24 01:05:43 sa_linux user.notice kernel: Linux version 2.6.34.6 
(marc at Ubuntu) (gcc version 4.4.4 (Buildroot 2010.08) ) #2 PREEMPT Wed 
Sep 22 15:31:38 EDT 2010
Sep 24 01:05:43 sa_linux user.err kernel: CPU: vendor_id 'Vortex86 SoC' 
unknown, using generic init.
Sep 24 01:05:43 sa_linux user.err kernel: CPU: Your system may be unstable.
Sep 24 01:05:43 sa_linux user.info kernel: BIOS-provided physical RAM map:
Sep 24 01:05:43 sa_linux user.info kernel:  BIOS-e820: 0000000000000000 
- 000000000009fc00 (usable)
Sep 24 01:05:43 sa_linux user.info kernel:  BIOS-e820: 000000000009fc00 
- 00000000000a0000 (reserved)
Sep 24 01:05:43 sa_linux user.info kernel:  BIOS-e820: 00000000000e4000 
- 0000000000100000 (reserved)
Sep 24 01:05:43 sa_linux user.info kernel:  BIOS-e820: 0000000000100000 
- 0000000020000000 (usable)
Sep 24 01:05:43 sa_linux user.info kernel:  BIOS-e820: 00000000ff000000 
- 0000000100000000 (reserved)
Sep 24 01:05:43 sa_linux user.debug kernel: initial memory mapped : 0 - 
00800000
Sep 24 01:05:43 sa_linux user.info kernel: init_memory_mapping: 
0000000000000000-0000000020000000
Sep 24 01:05:43 sa_linux user.debug kernel:  0000000000 - 0020000000 page 4k
Sep 24 01:05:43 sa_linux user.debug kernel: kernel direct mapping tables 
up to 20000000 @ 7000-8a000
Sep 24 01:05:43 sa_linux user.notice kernel: 512MB LOWMEM available.
Sep 24 01:05:43 sa_linux user.info kernel:   mapped low ram: 0 - 20000000
Sep 24 01:05:43 sa_linux user.info kernel:   low ram: 0 - 20000000
Sep 24 01:05:43 sa_linux user.warn kernel: Zone PFN ranges:
Sep 24 01:05:43 sa_linux user.warn kernel:   DMA      0x00000001 -> 
0x00001000
Sep 24 01:05:43 sa_linux user.warn kernel:   Normal   0x00001000 -> 
0x00020000
Sep 24 01:05:43 sa_linux user.warn kernel: Movable zone start PFN for 
each node
Sep 24 01:05:43 sa_linux user.warn kernel: early_node_map[2] active PFN 
ranges
Sep 24 01:05:43 sa_linux user.warn kernel:     0: 0x00000001 -> 0x0000009f
Sep 24 01:05:43 sa_linux user.warn kernel:     0: 0x00000100 -> 0x00020000
Sep 24 01:05:43 sa_linux user.debug kernel: On node 0 totalpages: 130974
Sep 24 01:05:43 sa_linux user.debug kernel: free_area_init_node: node 0, 
pgdat c03b6ac4, node_mem_map c1000020
Sep 24 01:05:43 sa_linux user.debug kernel:   DMA zone: 32 pages used 
for memmap
Sep 24 01:05:43 sa_linux user.debug kernel:   DMA zone: 0 pages reserved
Sep 24 01:05:43 sa_linux user.debug kernel:   DMA zone: 3966 pages, LIFO 
batch:0
Sep 24 01:05:43 sa_linux user.debug kernel:   Normal zone: 992 pages 
used for memmap
Sep 24 01:05:43 sa_linux user.debug kernel:   Normal zone: 125984 pages, 
LIFO batch:31
Sep 24 01:05:43 sa_linux user.info kernel: Allocating PCI resources 
starting at 20000000 (gap: 20000000:df000000)
Sep 24 01:05:43 sa_linux user.warn kernel: Built 1 zonelists in Zone 
order, mobility grouping on.  Total pages: 129950
Sep 24 01:05:43 sa_linux user.notice kernel: Kernel command line: rw 
root=/dev/hda1 init=/linuxrc BOOT_IMAGE=bzImage
Sep 24 01:05:43 sa_linux user.info linuxrc: starting pid 971, tty 
'/dev/tty3': '/usr/bin/tail -f /var/log/messages'
Sep 24 01:05:43 sa_linux user.info kernel: PID hash table entries: 2048 
(order: 1, 8192 bytes)
Sep 24 01:05:43 sa_linux user.info kernel: Dentry cache hash table 
entries: 65536 (order: 6, 262144 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: Inode-cache hash table 
entries: 32768 (order: 5, 131072 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: Initializing CPU#0
Sep 24 01:05:44 sa_linux user.info kernel: Subtract (20 early reservations)
Sep 24 01:05:44 sa_linux user.info kernel:   #0 [0000100000 - 
00004114ac]   TEXT DATA BSS
Sep 24 01:05:44 sa_linux user.info kernel:   #1 [000009fc00 - 
0000100000]   BIOS reserved
Sep 24 01:05:44 sa_linux user.info kernel:   #2 [0000412000 - 
0000414000]             BRK
Sep 24 01:05:44 sa_linux user.info kernel:   #3 [0000007000 - 
0000085000]         PGTABLE
Sep 24 01:05:44 sa_linux user.info kernel:   #4 [0001000000 - 
0001400000]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #5 [0001400000 - 
0001400004]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #6 [0001400040 - 
00014000c0]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #7 [00014000c0 - 
00014000f0]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #8 [0001400100 - 
0001401100]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #9 [0001401100 - 
00014011a8]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #10 [00014011c0 - 
0001401200]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #11 [0001401200 - 
0001401240]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #12 [0001401240 - 
0001401280]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #13 [0001401280 - 
00014012c0]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #14 [00014012c0 - 
0001401300]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #15 [0001401300 - 
0001401334]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #16 [0001401340 - 
0001401374]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #17 [0001401380 - 
0001403380]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #18 [0001403380 - 
0001443380]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel:   #19 [0001443380 - 
0001463380]         BOOTMEM
Sep 24 01:05:44 sa_linux user.info kernel: Memory: 515744k/524288k 
available (2068k kernel code, 8152k reserved, 722k data, 224k init, 0k 
highmem)
Sep 24 01:05:44 sa_linux user.info kernel: virtual kernel memory layout:
Sep 24 01:05:44 sa_linux user.info kernel:     fixmap  : 0xfffe5000 - 
0xfffff000   ( 104 kB)
Sep 24 01:05:44 sa_linux user.info kernel:     vmalloc : 0xe0800000 - 
0xfffe3000   ( 503 MB)
Sep 24 01:05:44 sa_linux user.info kernel:     lowmem  : 0xc0000000 - 
0xe0000000   ( 512 MB)
Sep 24 01:05:44 sa_linux user.info kernel:       .init : 0xc03ba000 - 
0xc03f2000   ( 224 kB)
Sep 24 01:05:44 sa_linux user.info kernel:       .data : 0xc03053ea - 
0xc03b9fb4   ( 722 kB)
Sep 24 01:05:44 sa_linux user.info kernel:       .text : 0xc0100000 - 
0xc03053ea   (2068 kB)
Sep 24 01:05:44 sa_linux user.info kernel: Checking if this processor 
honours the WP bit even in supervisor mode...Ok.
Sep 24 01:05:44 sa_linux user.info kernel: Hierarchical RCU implementation.
Sep 24 01:05:44 sa_linux user.info kernel: NR_IRQS:16
Sep 24 01:05:44 sa_linux user.warn kernel: Console: colour VGA+ 80x25
Sep 24 01:05:44 sa_linux user.info kernel: console [tty0] enabled
Sep 24 01:05:44 sa_linux user.warn kernel: Fast TSC calibration using PIT
Sep 24 01:05:44 sa_linux user.warn kernel: Detected 799.984 MHz processor.
Sep 24 01:05:44 sa_linux user.info kernel: Calibrating delay loop 
(skipped), value calculated using timer frequency.. 1599.96 BogoMIPS 
(lpj=3199936)
Sep 24 01:05:44 sa_linux user.warn kernel: Mount-cache hash table 
entries: 512
Sep 24 01:05:44 sa_linux user.info kernel: Performance Events:
Sep 24 01:05:44 sa_linux user.info kernel: CPU: Vortex86 SoC 05/02 
stepping 02
Sep 24 01:05:44 sa_linux user.info kernel: Checking 'hlt' instruction... OK.
Sep 24 01:05:44 sa_linux user.info kernel: NET: Registered protocol 
family 16
Sep 24 01:05:44 sa_linux user.info kernel: PCI: PCI BIOS revision 3.00 
entry at 0xf0031, last bus=0
Sep 24 01:05:44 sa_linux user.info kernel: PCI: Using configuration type 
1 for base access
Sep 24 01:05:44 sa_linux user.warn kernel: bio: create slab <bio-0> at 0
Sep 24 01:05:44 sa_linux user.info kernel: vgaarb: loaded
Sep 24 01:05:44 sa_linux user.notice kernel: SCSI subsystem initialized
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver usbfs
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver hub
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
device driver usb
Sep 24 01:05:44 sa_linux user.info kernel: LinuxPPS API ver. 1 registered
Sep 24 01:05:44 sa_linux user.info kernel: Software ver. 5.3.6 - 
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Sep 24 01:05:44 sa_linux user.warn kernel: PCI: Probing PCI hardware
Sep 24 01:05:44 sa_linux user.debug kernel: PCI: Probing PCI hardware 
(bus 00)
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:03.0: reg 10: 
[mem 0xf8000000-0xfbffffff pref]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:03.0: reg 14: 
[mem 0xfefc0000-0xfeffffff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:03.0: reg 18: 
[io  0xef80-0xefff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:03.0: reg 30: 
[mem 0xfefb0000-0xfefb7fff pref]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:03.0: supports D1 D2
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:08.0: reg 10: 
[io  0xec00-0xecff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:08.0: reg 14: 
[mem 0xfefaf400-0xfefaf4ff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:08.0: reg 30: 
[mem 0xfef90000-0xfef9ffff pref]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0a.0: reg 10: 
[mem 0xfefad000-0xfefadfff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0a.1: reg 10: 
[mem 0xfefaf800-0xfefaf8ff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0b.0: reg 10: 
[mem 0xfefae000-0xfefaefff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0b.1: reg 10: 
[mem 0xfefafc00-0xfefafcff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0c.0: reg 10: 
[io  0xef00-0xef07]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0c.0: reg 14: 
[io  0xee80-0xee83]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0c.0: reg 18: 
[io  0xee00-0xee07]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0c.0: reg 1c: 
[io  0xed80-0xed83]
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:0c.0: reg 20: 
[io  0xed00-0xed0f]
Sep 24 01:05:44 sa_linux user.info kernel: vgaarb: device added: 
PCI:0000:00:03.0,decodes=io+mem,owns=io+mem,locks=none
Sep 24 01:05:44 sa_linux user.info kernel: pci 0000:00:07.0: default IRQ 
router [17f3:6031]
Sep 24 01:05:44 sa_linux user.debug kernel: PCI: pci_cache_line_size set 
to 32 bytes
Sep 24 01:05:44 sa_linux user.debug kernel: reserve RAM buffer: 
000000000009fc00 - 000000000009ffff
Sep 24 01:05:44 sa_linux user.info kernel: Switching to clocksource tsc
Sep 24 01:05:44 sa_linux user.debug kernel: pci_bus 0000:00: resource 0 
[io  0x0000-0xffff]
Sep 24 01:05:44 sa_linux user.debug kernel: pci_bus 0000:00: resource 1 
[mem 0x00000000-0xffffffff]
Sep 24 01:05:44 sa_linux user.info kernel: NET: Registered protocol family 2
Sep 24 01:05:44 sa_linux user.info kernel: IP route cache hash table 
entries: 4096 (order: 2, 16384 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: TCP established hash table 
entries: 16384 (order: 5, 131072 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: TCP bind hash table entries: 
16384 (order: 4, 65536 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: TCP: Hash tables configured 
(established 16384 bind 16384)
Sep 24 01:05:44 sa_linux user.info kernel: TCP reno registered
Sep 24 01:05:44 sa_linux user.info kernel: UDP hash table entries: 256 
(order: 0, 4096 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: UDP-Lite hash table entries: 
256 (order: 0, 4096 bytes)
Sep 24 01:05:44 sa_linux user.info kernel: NET: Registered protocol family 1
Sep 24 01:05:44 sa_linux user.info kernel: RPC: Registered udp transport 
module.
Sep 24 01:05:44 sa_linux user.info kernel: RPC: Registered tcp transport 
module.
Sep 24 01:05:44 sa_linux user.info kernel: RPC: Registered tcp NFSv4.1 
backchannel transport module.
Sep 24 01:05:44 sa_linux user.debug kernel: pci 0000:00:03.0: Boot video 
device
Sep 24 01:05:44 sa_linux user.debug kernel: PCI: CLS 16 bytes, default 32
Sep 24 01:05:44 sa_linux user.info kernel: platform rtc_cmos: registered 
platform RTC device (no PNP device found)
Sep 24 01:05:44 sa_linux user.info kernel: Installing knfsd (copyright 
(C) 1996 okir at monad.swb.de).
Sep 24 01:05:44 sa_linux user.info kernel: msgmni has been set to 1007
Sep 24 01:05:44 sa_linux user.info kernel: Block layer SCSI generic 
(bsg) driver version 0.4 loaded (major 252)
Sep 24 01:05:44 sa_linux user.info kernel: io scheduler noop registered
Sep 24 01:05:44 sa_linux user.info kernel: io scheduler deadline 
registered (default)
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: Video ROM found
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: Video RAM at 
0xf8000000, mapped to 0xe0880000, size 32768k
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: MMIO at 0xfefc0000, 
mapped to 0xe2900000, size 256k
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: Memory heap starting 
at 32544K, size 32K
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: CRT1 DDC probing failed
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: Default mode is 
800x600x8 (60Hz)
Sep 24 01:05:44 sa_linux user.debug kernel: sisfb: Initial vbflags 0x0
Sep 24 01:05:44 sa_linux user.debug kernel: sisfb: Failed to add MTRRs
Sep 24 01:05:44 sa_linux user.warn kernel: Console: switching to colour 
frame buffer device 100x37
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: 2D acceleration is 
enabled, y-panning enabled (auto-max)
Sep 24 01:05:44 sa_linux user.info kernel: fb0: XGI Z7 frame buffer 
device version 1.8.9
Sep 24 01:05:44 sa_linux user.info kernel: sisfb: Copyright (C) 
2001-2005 Thomas Winischhofer
Sep 24 01:05:44 sa_linux user.info kernel: isapnp: Scanning for PnP cards...
Sep 24 01:05:44 sa_linux user.info kernel: isapnp: No Plug & Play device 
found
Sep 24 01:05:44 sa_linux user.info kernel: Serial: 8250/16550 driver, 12 
ports, IRQ sharing enabled
Sep 24 01:05:44 sa_linux user.info kernel: serial8250: ttyS0 at I/O 
0x3f8 (irq = 4) is a 16550A
Sep 24 01:05:44 sa_linux user.info kernel: serial8250: ttyS1 at I/O 
0x2f8 (irq = 3) is a 16550A
Sep 24 01:05:44 sa_linux user.info kernel: parport0: PC-style at 0x378 
[PCSPP(,...)]
Sep 24 01:05:44 sa_linux user.info kernel: parport0: irq 0 detected
Sep 24 01:05:44 sa_linux user.info kernel: brd: module loaded
Sep 24 01:05:44 sa_linux user.info kernel: loop: module loaded
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver ub
Sep 24 01:05:44 sa_linux user.info kernel: Uniform Multi-Platform E-IDE 
driver
Sep 24 01:05:44 sa_linux user.info kernel: piix 0000:00:0c.0: IDE 
controller (0x8086:0x24db rev 0x01)
Sep 24 01:05:44 sa_linux user.info kernel: piix 0000:00:0c.0: 100% 
native mode on irq 14
Sep 24 01:05:44 sa_linux user.info kernel:     ide0: BM-DMA at 0xed00-0xed07
Sep 24 01:05:44 sa_linux user.info kernel:     ide1: BM-DMA at 0xed08-0xed0f
Sep 24 01:05:44 sa_linux user.debug kernel: Probing IDE interface ide0...
Sep 24 01:05:44 sa_linux user.info kernel: hda: InnoDisk Corp. - EDC4000 
512MB, CFA DISK drive
Sep 24 01:05:44 sa_linux user.debug kernel: hda: host max PIO4 wanted 
PIO255(auto-tune) selected PIO4
Sep 24 01:05:44 sa_linux user.warn kernel: hda: host side 80-wire cable 
detection failed, limiting max speed to UDMA33
Sep 24 01:05:44 sa_linux user.info kernel: hda: UDMA/33 mode selected
Sep 24 01:05:44 sa_linux user.debug kernel: Probing IDE interface ide1...
Sep 24 01:05:44 sa_linux user.info kernel: ide0 at 0xef00-0xef07,0xee82 
on irq 14
Sep 24 01:05:44 sa_linux user.info kernel: ide1 at 0xee00-0xee07,0xed82 
on irq 14
Sep 24 01:05:44 sa_linux user.info kernel: ide-gd driver 1.18
Sep 24 01:05:44 sa_linux user.info kernel: hda: max request size: 128KiB
Sep 24 01:05:44 sa_linux user.info kernel: hda: 1023120 sectors (523 MB) 
w/0KiB Cache, CHS=1015/16/63
Sep 24 01:05:44 sa_linux user.info kernel: hda: cache flushes supported
Sep 24 01:05:44 sa_linux user.info kernel:  hda: hda1 hda2
Sep 24 01:05:44 sa_linux user.info kernel: r6040: RDC R6040 NAPI net 
driver,version 0.25 (20Aug2009)
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd: USB 2.0 'Enhanced' 
Host Controller (EHCI) Driver
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0a.1: EHCI 
Host Controller
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0a.1: new 
USB bus registered, assigned bus number 1
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0a.1: irq 9, 
io mem 0xfefaf800
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0a.1: USB 
2.0 started, EHCI 1.00
Sep 24 01:05:44 sa_linux user.info kernel: hub 1-0:1.0: USB hub found
Sep 24 01:05:44 sa_linux user.info kernel: hub 1-0:1.0: 2 ports detected
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0b.1: EHCI 
Host Controller
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0b.1: new 
USB bus registered, assigned bus number 2
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0b.1: irq 
11, io mem 0xfefafc00
Sep 24 01:05:44 sa_linux user.info kernel: ehci_hcd 0000:00:0b.1: USB 
2.0 started, EHCI 1.00
Sep 24 01:05:44 sa_linux user.info kernel: hub 2-0:1.0: USB hub found
Sep 24 01:05:44 sa_linux user.info kernel: hub 2-0:1.0: 2 ports detected
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd: USB 1.1 'Open' Host 
Controller (OHCI) Driver
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd 0000:00:0a.0: OHCI 
Host Controller
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd 0000:00:0a.0: new 
USB bus registered, assigned bus number 3
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd 0000:00:0a.0: irq 
15, io mem 0xfefad000
Sep 24 01:05:44 sa_linux user.info kernel: hub 3-0:1.0: USB hub found
Sep 24 01:05:44 sa_linux user.info kernel: hub 3-0:1.0: 2 ports detected
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd 0000:00:0b.0: OHCI 
Host Controller
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd 0000:00:0b.0: new 
USB bus registered, assigned bus number 4
Sep 24 01:05:44 sa_linux user.info kernel: ohci_hcd 0000:00:0b.0: irq 
10, io mem 0xfefae000
Sep 24 01:05:44 sa_linux user.info kernel: hub 4-0:1.0: USB hub found
Sep 24 01:05:44 sa_linux user.info kernel: hub 4-0:1.0: 2 ports detected
Sep 24 01:05:44 sa_linux user.info kernel: Initializing USB Mass Storage 
driver...
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver usb-storage
Sep 24 01:05:44 sa_linux user.info kernel: USB Mass Storage support 
registered.
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver libusual
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver ums-usbat
Sep 24 01:05:44 sa_linux user.info kernel: PNP: No PS/2 controller 
found. Probing ports directly.
Sep 24 01:05:44 sa_linux user.info kernel: serio: i8042 KBD port at 
0x60,0x64 irq 1
Sep 24 01:05:44 sa_linux user.info kernel: serio: i8042 AUX port at 
0x60,0x64 irq 12
Sep 24 01:05:44 sa_linux user.info kernel: mice: PS/2 mouse device 
common for all mice
Sep 24 01:05:44 sa_linux user.info kernel: input: PC Speaker as 
/devices/platform/pcspkr/input/input0
Sep 24 01:05:44 sa_linux user.info kernel: rtc_cmos rtc_cmos: rtc core: 
registered rtc_cmos as rtc0
Sep 24 01:05:44 sa_linux user.info kernel: rtc0: alarms up to one day, 
114 bytes nvram
Sep 24 01:05:44 sa_linux user.info kernel: PPS line discipline registered
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver hiddev
Sep 24 01:05:44 sa_linux user.info kernel: usbcore: registered new 
interface driver usbhid
Sep 24 01:05:44 sa_linux user.info kernel: usbhid: USB HID core driver
Sep 24 01:05:44 sa_linux user.info kernel: TCP cubic registered
Sep 24 01:05:44 sa_linux user.info kernel: NET: Registered protocol 
family 17
Sep 24 01:05:44 sa_linux user.info kernel: rtc_cmos rtc_cmos: setting 
system clock to 2010-09-24 07:05:43 UTC (1285311943)
Sep 24 01:05:44 sa_linux user.warn kernel: EXT2-fs (hda1): warning: 
mounting unchecked fs, running e2fsck is recommended
Sep 24 01:05:44 sa_linux user.warn kernel: VFS: Mounted root (ext2 
filesystem) on device 3:1.
Sep 24 01:05:44 sa_linux user.info kernel: Freeing unused kernel memory: 
224k freed
Sep 24 01:05:44 sa_linux user.info kernel: usb 3-2: new full speed USB 
device using ohci_hcd and address 2
Sep 24 01:05:44 sa_linux user.info kernel: eth0: link up, 100Mbps, 
full-duplex, lpa 0x45E1
Sep 24 01:05:44 sa_linux user.info kernel: input: C-Media USB Audio 
Device    as /devices/pci0000:00/0000:00:0a.0/usb3/3-2/3-2:1.3/input/input1
Sep 24 01:05:44 sa_linux user.info kernel: generic-usb 
0003:0D8C:0008.0001: input: USB HID v1.00 Device [C-Media USB Audio 
Device   ] on usb-0000:00:0a.0-2/input3
Sep 24 01:05:44 sa_linux user.debug kernel: spurious 8259A interrupt: IRQ7.
Sep 24 01:05:44 sa_linux user.info kernel: usb 4-2: new low speed USB 
device using ohci_hcd and address 2
Sep 24 01:05:44 sa_linux user.info kernel: input: Microsoft Comfort 
Curve Keyboard 2000 as 
/devices/pci0000:00/0000:00:0b.0/usb4/4-2/4-2:1.0/input/input2
Sep 24 01:05:44 sa_linux user.info kernel: generic-usb 
0003:045E:00DD.0002: input: USB HID v1.11 Keyboard [Microsoft Comfort 
Curve Keyboard 2000] on usb-0000:00:0b.0-2/input0
Sep 24 01:05:44 sa_linux user.info kernel: input: Microsoft Comfort 
Curve Keyboard 2000 as 
/devices/pci0000:00/0000:00:0b.0/usb4/4-2/4-2:1.1/input/input3
Sep 24 01:05:44 sa_linux user.info kernel: generic-usb 
0003:045E:00DD.0003: input: USB HID v1.11 Device [Microsoft Comfort 
Curve Keyboard 2000] on usb-0000:00:0b.0-2/input1
Sep 24 01:05:51 sa_linux user.info login[964]: root login on 'tty1'
Sep 24 01:07:31 sa_linux user.info kernel: fsck.ext2[989]: segfault at 
20 ip b77d86b8 sp bfb99804 error 4 in libuClibc-0.9.31.so[b77ce000+43000]
Sep 24 01:07:40 sa_linux user.info kernel: fsck.ext2[991]: segfault at 
20 ip b769f6b8 sp bf8775c4 error 4 in libuClibc-0.9.31.so[b7695000+43000]
Sep 24 01:08:03 sa_linux user.info kernel: fsck.ext2[994]: segfault at 
20 ip b76a76b8 sp bfbf59b4 error 4 in libuClibc-0.9.31.so[b769d000+43000]
Sep 24 01:09:21 sa_linux user.info kernel: fsck.ext2[996]: segfault at 
20 ip b76d76b8 sp bfe2d9c4 error 4 in libuClibc-0.9.31.so[b76cd000+43000]
Sep 24 01:10:16 sa_linux user.info kernel: fsck.ext2[1001]: segfault at 
20 ip b77076b8 sp bff66c64 error 4
Sep 24 01:10:16 sa_linux user.info kernel:  in 
libuClibc-0.9.31.so[b76fd000+43000]
Sep 24 01:10:58 sa_linux user.info kernel: fsck.ext2[1003]: segfault at 
20 ip b76846b8 sp bfde1684 error 4 in libuClibc-0.9.31.so[b767a000+43000]
Sep 24 01:11:48 sa_linux user.info login[968]: root login on 'ttyS0'
Sep 24 01:12:10 sa_linux user.info kernel: e2fsck[1008]: segfault at 20 
ip b76956b8 sp bf9c3b24 error 4 in libuClibc-0.9.31.so[b768b000+43000]
Sep 24 01:14:24 sa_linux user.info kernel: e2fsck[1009]: segfault at 20 
ip b76f36b8 sp bfe74914 error 4 in libuClibc-0.9.31.so[b76e9000+43000]
Sep 24 01:14:58 sa_linux user.info kernel: e2fsck[1010]: segfault at 20 
ip b78486b8 sp bf9a7bc4 error 4 in libuClibc-0.9.31.so[b783e000+43000]
Sep 24 01:15:12 sa_linux user.info kernel: e2fsck[1012]: segfault at 20 
ip b783d6b8 sp bfe31fc4 error 4 in libuClibc-0.9.31.so[b7833000+43000]
Sep 24 01:15:31 sa_linux user.info kernel: e2fsck[1013]: segfault at 20 
ip b765c6b8 sp bfddf654 error 4 in libuClibc-0.9.31.so[b7652000+43000]


On 2010-09-23 16:26, Peter Korsgaard wrote:
>>>>>> "Marc" == Marc Leclerc<marc-leclerc@signaturealpha.com>  writes:
>   Marc>   Hi,
>   Marc>  Every attemps to include e2fsprogs on my target results in the
>   Marc>  utilities crashing with a segfault.
>
>   Marc>  Sep 23 01:39:39 sa_linux user.info kernel: e2fsck[987]: segfault at 20
>   Marc>  ip b77316b8 sp bf968534 error 4
>   Marc>  Sep 23 01:39:39 sa_linux user.info kernel:  in
>   Marc>  libuClibc-0.9.31.so[b7727000+43000]
>
>   Marc>  Any idea why
>
> Please provide a bit more details. What buildroot .config are you using
> and what is the exact command line that causes a crash?
>
