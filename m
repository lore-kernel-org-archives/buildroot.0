From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
Date: Tue, 18 May 2010 09:32:46 +0200
Subject: [Buildroot] [PATCH] Add support for Beagleboard
Message-ID: <1274167966-12366-1-git-send-email-mchazaux@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 configs/beagleboard_defconfig         |  838 +++++++++++++++++++++++++++++++++
 target/Config.in                      |    1 +
 target/Makefile.in                    |    4 +
 target/device/Beagleboard/Config.in   |   31 ++
 target/device/Beagleboard/Makefile.in |    3 +
 target/device/Config.in               |    1 +
 target/x-load/Config.in               |   36 ++
 target/x-load/Makefile.in             |  126 +++++
 8 files changed, 1040 insertions(+), 0 deletions(-)
 create mode 100644 configs/beagleboard_defconfig
 create mode 100644 target/device/Beagleboard/Config.in
 create mode 100644 target/device/Beagleboard/Makefile.in
 create mode 100644 target/x-load/Config.in
 create mode 100644 target/x-load/Makefile.in

diff --git a/configs/beagleboard_defconfig b/configs/beagleboard_defconfig
new file mode 100644
index 0000000..ab6745a
--- /dev/null
+++ b/configs/beagleboard_defconfig
@@ -0,0 +1,838 @@
+#
+# Automatically generated make config: don't edit
+# Mon May 17 17:43:52 2010
+#
+BR2_HAVE_DOT_CONFIG=y
+BR2_VERSION="2010.05-rc2-git"
+# BR2_alpha is not set
+BR2_arm=y
+# BR2_armeb is not set
+# BR2_avr32 is not set
+# BR2_cris is not set
+# BR2_ia64 is not set
+# BR2_i386 is not set
+# BR2_m68k is not set
+# BR2_mips is not set
+# BR2_mipsel is not set
+# BR2_powerpc is not set
+# BR2_sh is not set
+# BR2_sh64 is not set
+# BR2_sparc is not set
+# BR2_sparc64 is not set
+# BR2_x86_64 is not set
+# BR2_xtensa is not set
+# BR2_generic_arm is not set
+# BR2_arm7tdmi is not set
+# BR2_arm610 is not set
+# BR2_arm710 is not set
+# BR2_arm720t is not set
+# BR2_arm920t is not set
+# BR2_arm922t is not set
+# BR2_arm926t is not set
+# BR2_arm10t is not set
+# BR2_arm1136jf_s is not set
+# BR2_arm1176jz_s is not set
+# BR2_arm1176jzf_s is not set
+
+#
+# cortex-A8 needs gcc >= 4.4.x
+#
+BR2_cortex_a8=y
+# BR2_sa110 is not set
+# BR2_sa1100 is not set
+# BR2_xscale is not set
+# BR2_iwmmxt is not set
+BR2_ARM_TYPE="ARM_CORTEXA8"
+BR2_ARM_EABI=y
+# BR2_ARM_OABI is not set
+BR2_ARCH="arm"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_TUNE="cortex-a8"
+BR2_GCC_TARGET_ARCH="armv7-a"
+BR2_GCC_TARGET_ABI="aapcs-linux"
+
+#
+# Target options
+#
+
+#
+# Preset Devices
+#
+# BR2_TARGET_ARMLTD is not set
+BR2_BOARD_NAME="Beagleboard-rev-C4"
+BR2_BOARD_PATH="target/device/Beagleboard/$(BOARD_NAME)"
+# BR2_TARGET_ATMEL is not set
+# BR2_TARGET_KWIKBYTE is not set
+BR2_TARGET_BEAGLEBOARD=y
+BR2_TARGET_BEAGLEBOARD_REV_C4=y
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
+BR2_TARGET_GENERIC_GETTY=y
+# BR2_TARGET_GENERIC_GETTY_NONE is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
+BR2_TARGET_GENERIC_GETTY_TTYS2=y
+# BR2_TARGET_GENERIC_GETTY_TTYS3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYMXC0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYMXC1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYMXC2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM3 is not set
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
+
+#
+# Build options
+#
+
+#
+# Commands
+#
+BR2_WGET="wget --passive-ftp -nd"
+BR2_SVN_CO="svn co"
+BR2_SVN_UP="svn up"
+BR2_BZR_CO="bzr co"
+BR2_BZR_UP="bzr up"
+BR2_GIT="git clone"
+BR2_ZCAT="gzip -d -c"
+BR2_BZCAT="bzcat"
+BR2_TAR_OPTIONS=""
+BR2_DL_DIR="$(TOPDIR)/dl"
+BR2_COPYTO=""
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
+
+#
+# Mirrors and Download locations
+#
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
+BR2_JLEVEL=2
+# BR2_DEPRECATED is not set
+# BR2_ENABLE_DEBUG is not set
+BR2_STRIP_strip=y
+# BR2_STRIP_sstrip is not set
+# BR2_STRIP_none is not set
+# BR2_OPTIMIZE_0 is not set
+# BR2_OPTIMIZE_1 is not set
+# BR2_OPTIMIZE_2 is not set
+# BR2_OPTIMIZE_3 is not set
+BR2_OPTIMIZE_S=y
+# BR2_PREFER_STATIC_LIB is not set
+# BR2_HAVE_DOCUMENTATION is not set
+# BR2_HAVE_DEVFILES is not set
+
+#
+# Advanced
+#
+BR2_CONFIG_CACHE=y
+
+#
+# Toolchain
+#
+BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_EXTERNAL is not set
+
+#
+# Kernel Header Options
+#
+# BR2_KERNEL_HEADERS_2_6_27 is not set
+# BR2_KERNEL_HEADERS_2_6_28 is not set
+# BR2_KERNEL_HEADERS_2_6_29 is not set
+# BR2_KERNEL_HEADERS_2_6_30 is not set
+# BR2_KERNEL_HEADERS_2_6_31 is not set
+# BR2_KERNEL_HEADERS_2_6_32 is not set
+BR2_KERNEL_HEADERS_2_6_33=y
+# BR2_KERNEL_HEADERS_VERSION is not set
+# BR2_KERNEL_HEADERS_SNAP is not set
+BR2_DEFAULT_KERNEL_HEADERS="2.6.33.4"
+
+#
+# uClibc Options
+#
+# BR2_UCLIBC_VERSION_0_9_28_3 is not set
+# BR2_UCLIBC_VERSION_0_9_29 is not set
+# BR2_UCLIBC_VERSION_0_9_30 is not set
+BR2_UCLIBC_VERSION_0_9_31=y
+# BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.31"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
+# BR2_PTHREAD_DEBUG is not set
+# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
+
+#
+# Binutils Options
+#
+# BR2_BINUTILS_VERSION_2_17 is not set
+# BR2_BINUTILS_VERSION_2_18 is not set
+# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
+# BR2_BINUTILS_VERSION_2_19 is not set
+# BR2_BINUTILS_VERSION_2_19_1 is not set
+# BR2_BINUTILS_VERSION_2_20 is not set
+BR2_BINUTILS_VERSION_2_20_1=y
+BR2_BINUTILS_VERSION="2.20.1"
+BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
+
+#
+# GCC Options
+#
+# BR2_GCC_VERSION_4_1_2 is not set
+# BR2_GCC_VERSION_4_2_1 is not set
+# BR2_GCC_VERSION_4_2_2 is not set
+# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
+# BR2_GCC_VERSION_4_2_3 is not set
+# BR2_GCC_VERSION_4_2_4 is not set
+# BR2_GCC_VERSION_4_3_2 is not set
+# BR2_GCC_VERSION_4_3_3 is not set
+# BR2_GCC_VERSION_4_3_4 is not set
+BR2_GCC_VERSION_4_4_X=y
+# BR2_GCC_VERSION_SNAP is not set
+BR2_GCC_SUPPORTS_SYSROOT=y
+BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
+BR2_GCC_VERSION="4.4.4"
+BR2_TOOLCHAIN_SYSROOT=y
+# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
+BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+# BR2_GCC_CROSS_FORTRAN is not set
+# BR2_INSTALL_OBJC is not set
+# BR2_INSTALL_FORTRAN is not set
+BR2_GCC_SHARED_LIBGCC=y
+
+#
+# Ccache Options
+#
+# BR2_CCACHE is not set
+
+#
+# Gdb Options
+#
+# BR2_PACKAGE_GDB is not set
+
+#
+# Gdb debugger for the target needs WCHAR support in toolchain
+#
+# BR2_PACKAGE_GDB_SERVER is not set
+# BR2_PACKAGE_GDB_HOST is not set
+
+#
+# Common Toolchain Options
+#
+BR2_LARGEFILE=y
+# BR2_INET_IPV6 is not set
+# BR2_INET_RPC is not set
+# BR2_ENABLE_LOCALE is not set
+# BR2_ENABLE_LOCALE_PURGE is not set
+BR2_USE_WCHAR=y
+BR2_PREFER_SOFT_FLOAT=y
+BR2_SOFT_FLOAT=y
+# BR2_USE_SSP is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+# BR2_PROGRAM_INVOCATION is not set
+# BR2_INSTALL_LIBSTDCPP is not set
+BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_ELF2FLT is not set
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+# BR2_ENABLE_MULTILIB is not set
+BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
+
+#
+# Package Selection for the target
+#
+BR2_PACKAGE_BUSYBOX=y
+# BR2_BUSYBOX_VERSION_1_12_X is not set
+# BR2_BUSYBOX_VERSION_1_13_X is not set
+# BR2_BUSYBOX_VERSION_1_14_X is not set
+# BR2_BUSYBOX_VERSION_1_15_X is not set
+BR2_BUSYBOX_VERSION_1_16_X=y
+# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
+BR2_BUSYBOX_VERSION="1.16.1"
+BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_BUSYBOX_SKELETON is not set
+# BR2_PACKAGE_CUSTOMIZE is not set
+
+#
+# Audio and video libraries and applications
+#
+# BR2_PACKAGE_ALSA_LIB is not set
+# BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
+# BR2_PACKAGE_GSTREAMER is not set
+# BR2_PACKAGE_LIBCDAUDIO is not set
+# BR2_PACKAGE_LIBDVDREAD is not set
+# BR2_PACKAGE_LIBDVDNAV is not set
+# BR2_PACKAGE_LIBID3TAG is not set
+# BR2_PACKAGE_LIBMAD is not set
+# BR2_PACKAGE_LIBMMS is not set
+# BR2_PACKAGE_LIBMPD is not set
+# BR2_PACKAGE_LIBOGG is not set
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBTHEORA is not set
+# BR2_PACKAGE_LIBVORBIS is not set
+# BR2_PACKAGE_MADPLAY is not set
+# BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_MPLAYER is not set
+# BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_SWFDEC is not set
+
+#
+# festival requires a toolchain with C++ support enabled
+#
+
+#
+# taglib requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_TREMOR is not set
+
+#
+# Compressors and decompressors
+#
+# BR2_PACKAGE_LZOP is not set
+
+#
+# lzma requires a toolchain with C++ support
+#
+
+#
+# Debugging, profiling and benchmark
+#
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LMBENCH is not set
+# BR2_PACKAGE_LSOF is not set
+# BR2_PACKAGE_LTRACE is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_NETPERF is not set
+
+#
+# oprofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_STRACE is not set
+
+#
+# Development tools
+#
+# BR2_PACKAGE_AUTOCONF is not set
+# BR2_PACKAGE_AUTOMAKE is not set
+# BR2_PACKAGE_BISON is not set
+# BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CVS is not set
+# BR2_PACKAGE_DISTCC is not set
+# BR2_PACKAGE_FAKEROOT is not set
+# BR2_PACKAGE_FLEX is not set
+
+#
+# native toolchain needs development files in target filesystem
+#
+BR2_PACKAGE_GETTEXT=y
+# BR2_PACKAGE_GETTEXT_STATIC is not set
+BR2_PACKAGE_LIBINTL=y
+# BR2_PACKAGE_LIBGMP is not set
+
+#
+# gperf requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_INTLTOOL is not set
+# BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_LIBMPFR is not set
+# BR2_PACKAGE_LIBTOOL is not set
+# BR2_PACKAGE_M4 is not set
+# BR2_PACKAGE_PKG_CONFIG is not set
+
+#
+# Games
+#
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_PRBOOM is not set
+
+#
+# Graphic libraries and applications (graphic/text)
+#
+
+#
+# graphic libraries
+#
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_LINUX_FUSION is not set
+# BR2_PACKAGE_SDL is not set
+
+#
+# other GUIs
+#
+
+#
+# qt requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_XORG7 is not set
+
+#
+# X libraries and helper libraries
+#
+# BR2_PACKAGE_LIBERATION is not set
+
+#
+# X Window managers
+#
+
+#
+# X applications
+#
+# BR2_PACKAGE_GOB2 is not set
+# BR2_PACKAGE_SYLPHEED is not set
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_CDRKIT is not set
+# BR2_PACKAGE_CRAMFS is not set
+# BR2_PACKAGE_DBUS is not set
+# BR2_PACKAGE_DMRAID is not set
+# BR2_PACKAGE_DOSFSTOOLS is not set
+# BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
+# BR2_PACKAGE_GENEXT2FS is not set
+# BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_GVFS is not set
+# BR2_PACKAGE_HAL is not set
+# BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
+# BR2_PACKAGE_IOSTAT is not set
+# BR2_PACKAGE_LM_SENSORS is not set
+# BR2_PACKAGE_LVM2 is not set
+# BR2_PACKAGE_MAKEDEVS is not set
+# BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MEMTESTER is not set
+# BR2_PACKAGE_MTD is not set
+# BR2_PACKAGE_NTFS_3G is not set
+# BR2_PACKAGE_NTFSPROGS is not set
+# BR2_PACKAGE_PCIUTILS is not set
+# BR2_PACKAGE_PCMCIA is not set
+# BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SMARTMONTOOLS is not set
+# BR2_PACKAGE_SQUASHFS is not set
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_USB_MODESWITCH is not set
+# BR2_PACKAGE_USBMOUNT is not set
+# BR2_PACKAGE_USBUTILS is not set
+# BR2_PACKAGE_WIPE is not set
+# BR2_PACKAGE_XFSPROGS is not set
+
+#
+# Interpreter languages and scripting
+#
+# BR2_PACKAGE_HASERL is not set
+# BR2_PACKAGE_LUA is not set
+# BR2_PACKAGE_MICROPERL is not set
+# BR2_PACKAGE_PHP is not set
+# BR2_PACKAGE_PYTHON is not set
+# BR2_PACKAGE_RUBY is not set
+# BR2_PACKAGE_TCL is not set
+
+#
+# Libraries
+#
+
+#
+# Compression and decompression
+#
+# BR2_PACKAGE_LIBARCHIVE is not set
+# BR2_PACKAGE_LZO is not set
+BR2_PACKAGE_ZLIB=y
+
+#
+# Crypto
+#
+# BR2_PACKAGE_BEECRYPT is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
+BR2_PACKAGE_OPENSSL=y
+# BR2_PACKAGE_OPENSSL_BIN is not set
+# BR2_PACKAGE_OPENSSL_ENGINES is not set
+
+#
+# Database
+#
+# BR2_PACKAGE_BERKELEYDB is not set
+
+#
+# Mysql client requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_SQLITE is not set
+
+#
+# Filesystem
+#
+# BR2_PACKAGE_GAMIN is not set
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
+# BR2_PACKAGE_LIBFUSE is not set
+# BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBSYSFS is not set
+
+#
+# Graphics
+#
+# BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+# BR2_PACKAGE_PANGO is not set
+# BR2_PACKAGE_PIXMAN is not set
+# BR2_PACKAGE_TIFF is not set
+
+#
+# webkit requires a toolchain with C++ support and WCHAR enabled
+#
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_LIBAIO is not set
+# BR2_PACKAGE_LIBRAW1394 is not set
+# BR2_PACKAGE_TSLIB is not set
+# BR2_PACKAGE_LIBUSB is not set
+
+#
+# Java
+#
+# BR2_PACKAGE_CLASSPATH is not set
+
+#
+# Networking
+#
+# BR2_PACKAGE_LIBCGI is not set
+
+#
+# libcgicc requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBMICROHTTPD is not set
+# BR2_PACKAGE_NEON is not set
+BR2_PACKAGE_LIBNL=y
+# BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBRSYNC is not set
+# BR2_PACKAGE_LIBSOUP is not set
+# BR2_PACKAGE_LIBUPNP is not set
+
+#
+# Other
+#
+# BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBCAP is not set
+# BR2_PACKAGE_LIBDAEMON is not set
+# BR2_PACKAGE_LIBELF is not set
+# BR2_PACKAGE_LIBEVENT is not set
+# BR2_PACKAGE_LIBGLIB12 is not set
+BR2_PACKAGE_LIBGLIB2=y
+BR2_PACKAGE_LIBOIL=y
+# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
+
+#
+# Text and terminal handling
+#
+
+#
+# icu requires a toolchain with C++ support and WCHAR enabled
+#
+BR2_PACKAGE_LIBICONV=y
+BR2_PACKAGE_NCURSES=y
+BR2_PACKAGE_NCURSES_TARGET_PANEL=y
+BR2_PACKAGE_NCURSES_TARGET_FORM=y
+BR2_PACKAGE_NCURSES_TARGET_MENU=y
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_PCRE is not set
+# BR2_PACKAGE_POPT is not set
+# BR2_PACKAGE_READLINE is not set
+# BR2_PACKAGE_SLANG is not set
+
+#
+# XML
+#
+BR2_PACKAGE_EXPAT=y
+# BR2_PACKAGE_EZXML is not set
+# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
+# BR2_PACKAGE_LIBXML2 is not set
+# BR2_PACKAGE_LIBXSLT is not set
+
+#
+# xerces-c++ requires a toolchain with C++ support enabled
+#
+
+#
+# Miscellaneous
+#
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
+
+#
+# Networking applications
+#
+# BR2_PACKAGE_ARGUS is not set
+# BR2_PACKAGE_AVAHI is not set
+# BR2_PACKAGE_AXEL is not set
+# BR2_PACKAGE_BIND is not set
+# BR2_PACKAGE_BMON is not set
+# BR2_PACKAGE_BRIDGE is not set
+
+#
+# ctorrent requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_CUPS is not set
+# BR2_PACKAGE_DNSMASQ is not set
+# BR2_PACKAGE_DROPBEAR is not set
+# BR2_PACKAGE_ETHTOOL is not set
+# BR2_PACKAGE_HOSTAPD is not set
+# BR2_PACKAGE_IFPLUGD is not set
+
+#
+# iperf requires a toolchain with C++ support enabled
+#
+
+#
+# iproute2 requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_IPSEC_TOOLS is not set
+# BR2_PACKAGE_IPTABLES is not set
+# BR2_PACKAGE_IW is not set
+
+#
+# Kismet requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_L2TP is not set
+# BR2_PACKAGE_LINKS is not set
+# BR2_PACKAGE_LRZSZ is not set
+# BR2_PACKAGE_MIIDIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MUTT is not set
+# BR2_PACKAGE_NBD is not set
+# BR2_PACKAGE_NCFTP is not set
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+
+#
+# nfs-utils requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_NTP is not set
+# BR2_PACKAGE_OLSR is not set
+# BR2_PACKAGE_OPENNTPD is not set
+# BR2_PACKAGE_OPENSSH is not set
+# BR2_PACKAGE_OPENVPN is not set
+
+#
+# portmap requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RP_PPPOE is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
+# BR2_PACKAGE_PROFTPD is not set
+# BR2_PACKAGE_QUAGGA is not set
+# BR2_PACKAGE_RSYNC is not set
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+
+#
+# Squid requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_STUNNEL is not set
+# BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_TTCP is not set
+# BR2_PACKAGE_UDPCAST is not set
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
+# BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WEBIF is not set
+# BR2_PACKAGE_WIRELESS_TOOLS is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+# BR2_PACKAGE_PORTAGE is not set
+
+#
+# Shell and utilities
+#
+# BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_DIALOG is not set
+# BR2_PACKAGE_FILE is not set
+# BR2_PACKAGE_LOCKFILE_PROGS is not set
+# BR2_PACKAGE_LOGROTATE is not set
+# BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_WHICH is not set
+
+#
+# System tools
+#
+
+#
+# Text editors and viewers
+#
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_UEMACS is not set
+
+#
+# Target filesystem options
+#
+BR2_ROOTFS_POST_BUILD_SCRIPT=""
+BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
+# BR2_TARGET_ROOTFS_CRAMFS is not set
+# BR2_TARGET_ROOTFS_CLOOP is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
+BR2_TARGET_ROOTFS_EXT2_INODES=0
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
+BR2_TARGET_ROOTFS_EXT2_SQUASH=y
+BR2_TARGET_ROOTFS_EXT2_NONE=y
+# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
+# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
+# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
+# BR2_TARGET_ROOTFS_JFFS2 is not set
+# BR2_TARGET_ROOTFS_UBIFS is not set
+# BR2_TARGET_ROOTFS_SQUASHFS is not set
+BR2_TARGET_ROOTFS_TAR=y
+# BR2_TARGET_ROOTFS_TAR_NONE is not set
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
+# BR2_TARGET_ROOTFS_TAR_LZMA is not set
+BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+# BR2_TARGET_ROOTFS_CPIO is not set
+# BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
+
+#
+# Bootloaders
+#
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
+BR2_TARGET_UBOOT_2010_03=y
+# BR2_TARGET_UBOOT_2009_11 is not set
+# BR2_TARGET_UBOOT_2009_08 is not set
+# BR2_TARGET_UBOOT_2009_06 is not set
+# BR2_TARGET_UBOOT_2009_03 is not set
+# BR2_TARGET_UBOOT_2009_01 is not set
+# BR2_TARGET_UBOOT_2008_10 is not set
+# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
+BR2_UBOOT_VERSION="2010.03"
+BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
+# BR2_TARGET_U_BOOT_ARCH_PATCH is not set
+BR2_TARGET_UBOOT_CUSTOM_PATCH=""
+# BR2_TARGET_UBOOT_SILENT is not set
+# BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
+# BR2_TARGET_UBOOT_TOOL_ENV is not set
+# BR2_TARGET_UBOOT_DEFAULT_ENV is not set
+BR2_TARGET_XLOAD=y
+BR2_TARGET_XLOAD_BOARDNAME="omap3530beagle"
+BR2_TARGET_XLOAD_VERSION="1c9276af4d6"
+BR2_TARGET_XLOAD_GIT_REPO="http://git.gitorious.org/x-load-omap3/mainline.git"
+BR2_TARGET_XLOAD_CUSTOM_PATCH=""
+
+#
+# Kernel
+#
+# BR2_KERNEL_none is not set
+BR2_KERNEL_LINUX_ADVANCED=y
+# BR2_KERNEL_LINUX is not set
+BR2_PACKAGE_LINUX=y
+BR2_PACKAGE_LINUX_FORMAT="uImage"
+BR2_KERNEL_CURRENT_VERSION="2.6.33.4"
+BR2_KERNEL_LATEST_2_6_33="4"
+BR2_KERNEL_LATEST_2_6_32="13"
+BR2_KERNEL_LATEST_2_6_31="13"
+BR2_KERNEL_LATEST_2_6_30="10"
+BR2_KERNEL_LATEST_2_6_29="6"
+BR2_KERNEL_LATEST_2_6_28="10"
+BR2_KERNEL_LATEST_2_6_27="46"
+BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
+BR2_LINUX_2_6_STABLE=y
+# BR2_LINUX_2_6_33 is not set
+# BR2_LINUX_2_6_32 is not set
+# BR2_LINUX_2_6_31 is not set
+# BR2_LINUX_2_6_30 is not set
+# BR2_LINUX_2_6_29 is not set
+# BR2_LINUX_2_6_28 is not set
+# BR2_LINUX_2_6_27 is not set
+# BR2_LINUX26_CUSTOM is not set
+
+#
+# Patches
+#
+# BR2_KERNEL_ARCH_PATCH_ENABLED is not set
+BR2_LINUX_BSP_PATCH=""
+BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_CURRENT_VERSION)"
+BR2_LINUX26_VERSION="$(BR2_KERNEL_CURRENT_VERSION)"
+
+#
+# Linux Kernel Configuration
+#
+# BR2_PACKAGE_LINUX_USE_KCONFIG is not set
+BR2_PACKAGE_LINUX_USE_DEFCONFIG=y
+# BR2_PACKAGE_LINUX_USE_XCONFIG is not set
+# BR2_LINUX_BIN_BZIMAGE is not set
+BR2_LINUX_BIN_UIMAGE=y
+# BR2_LINUX_BIN_VMLINUX is not set
+# BR2_LINUX_BIN_ZIMAGE is not set
+# BR2_LINUX_BIN_CUSTOM is not set
+
+#
+# Destinations for linux kernel binaries
+#
+# BR2_LINUX_COPYTO_ROOTFS is not set
+# BR2_LINUX_COPYTO_TFTPBOOT is not set
+BR2_LINUX_COPYTO=""
+# BR2_LINUX_COPY_CONFIGURATION is not set
diff --git a/target/Config.in b/target/Config.in
index 5d53635..e09b90f 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -5,6 +5,7 @@ source "target/x86/grub/Config.in"
 source "target/x86/syslinux/Config.in"
 source "target/powerpc/yaboot/Config.in"
 source "target/u-boot/Config.in"
+source "target/x-load/Config.in"
 endmenu
 
 menu "Kernel"
diff --git a/target/Makefile.in b/target/Makefile.in
index afe96a7..124d8e6 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -62,6 +62,10 @@ ifeq ($(BR2_TARGET_UBOOT),y)
 include target/u-boot/Makefile.in
 endif
 
+ifeq ($(BR2_TARGET_XLOAD),y)
+include target/x-load/Makefile.in
+endif
+
 # kernel rules
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
diff --git a/target/device/Beagleboard/Config.in b/target/device/Beagleboard/Config.in
new file mode 100644
index 0000000..3cff1d3
--- /dev/null
+++ b/target/device/Beagleboard/Config.in
@@ -0,0 +1,31 @@
+
+menuconfig BR2_TARGET_BEAGLEBOARD
+	depends on BR2_arm
+	select BR2_ARM_EABI
+	select BR2_cortex-a8
+	select BR2_GCC_VERSION_4_4_X
+	bool "Support for Beagleboard.org boards"
+	help
+	  Support for http://beagleboard.org boards.
+
+if BR2_TARGET_BEAGLEBOARD
+
+config BR2_TARGET_BEAGLEBOARD_REV_C4
+	bool "Support for Beagleboard rev. C4"
+	help
+	  Support for Beagleboard rev. C4.
+
+if  BR2_TARGET_BEAGLEBOARD_REV_C4
+
+config BR2_BOARD_NAME
+	string
+	default "Beagleboard-rev-C4"
+
+endif
+
+config BR2_BOARD_PATH
+	string
+	default "target/device/Beagleboard/$(BOARD_NAME)
+
+endif
+
diff --git a/target/device/Beagleboard/Makefile.in b/target/device/Beagleboard/Makefile.in
new file mode 100644
index 0000000..fe75ade
--- /dev/null
+++ b/target/device/Beagleboard/Makefile.in
@@ -0,0 +1,3 @@
+BOARD_NAME:="omap3_beagle"
+BOARD_PATH:=$(call qtrip,$(BR2_BOARD_PATH))
+
diff --git a/target/device/Config.in b/target/device/Config.in
index 6b7f11a..c7ec94e 100644
--- a/target/device/Config.in
+++ b/target/device/Config.in
@@ -8,6 +8,7 @@ source "target/device/KwikByte/Config.in"
 source "target/device/valka/Config.in"
 source "target/device/x86/Config.in"
 source "target/device/xtensa/Config.in"
+source "target/device/Beagleboard/Config.in"
 
 # This must be last
 source "target/generic/Config.in"
diff --git a/target/x-load/Config.in b/target/x-load/Config.in
new file mode 100644
index 0000000..f057823
--- /dev/null
+++ b/target/x-load/Config.in
@@ -0,0 +1,36 @@
+menuconfig BR2_TARGET_XLOAD
+	bool "TI X-LOAD for OMAP processors"
+	depends on BR2_cortex_a8
+	help
+	  Build X-Load
+
+if BR2_TARGET_XLOAD
+config BR2_TARGET_XLOAD_BOARDNAME
+	string "Board name"
+	default "$(BOARD_NAME)"
+	default omap3530beagle if BR2_TARGET_BEAGLEBOARD
+	help
+	  One of X-Load supported boards to be built.
+	  This will be suffixed with _config to meet X-Load standard naming.
+
+config BR2_TARGET_XLOAD_VERSION
+	string "X-Load version"
+	default $(BOARD_NAME)
+	help
+	  Select the specific X-Load git tree-ish you want to use.
+
+config BR2_TARGET_XLOAD_GIT_REPO
+	string "Clone an X-load repository"
+	default "http://gitorious.org/x-load-omap3/mainline.git"
+	help
+	  Clone a x-load git repository.
+
+config BR2_TARGET_XLOAD_CUSTOM_PATCH
+	string "Custom patch filename to apply on X-Loader"
+	default "" if BR2_TARGET_BEAGLEBOARD
+	help 
+	  Enter the filename of the patch you want to apply on 
+	  X-loader.
+
+endif
+
diff --git a/target/x-load/Makefile.in b/target/x-load/Makefile.in
new file mode 100644
index 0000000..f496ed4
--- /dev/null
+++ b/target/x-load/Makefile.in
@@ -0,0 +1,126 @@
+#############################################################
+#
+# x-load
+#
+#############################################################
+XLOAD_VERSION:=$(call qstrip,$(BR2_TARGET_XLOAD_VERSION))
+
+XLOAD_SOURCE:=x-load-$(XLOAD_VERSION).tar.gz
+
+XLOAD_SITE:=$(call qstrip,$(BR2_XLOAD_SITE))
+XLOAD_DIR:=$(BUILD_DIR)/x-load-$(XLOAD_VERSION)
+XLOAD_PATCH_DIR:=$(BUILD_DIR)/x-load-$(XLOAD_VERSION)-patches
+XLOAD_GIT_DIR:="$(DL_DIR)/x-load-$(XLOAD_VERSION)"
+XLOAD_CAT:=$(ZCAT)
+XLOAD_BIN:=MLO
+XLOAD_TARGET_BIN:=MLO-$(XLOAD_VERSION)-$(DATE).bin
+
+SIGNGP_SITE="http://beagleboard.googlecode.com/files/"
+SIGNGP_SOURCE="signGP.c"
+
+XLOAD_TARGETS:=$(BINARIES_DIR)/$(XLOAD_BIN)
+
+ifeq ($(XLOAD_BOARD_NAME),)
+XLOAD_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_XLOAD_BOARDNAME))
+endif
+
+$(DL_DIR)/$(XLOAD_SOURCE):
+	rm -Rf $(XLOAD_GIT_DIR)
+	$(GIT) http://git.gitorious.org/x-load-omap3/mainline.git $(XLOAD_GIT_DIR)
+	sh -c 'cd $(XLOAD_GIT_DIR) && git archive --output="$(DL_DIR)/x-load-$(XLOAD_VERSION).tar" --prefix="x-load-$(XLOAD_VERSION)/" $(XLOAD_VERSION)'
+	gzip $(DL_DIR)/x-load-$(XLOAD_VERSION).tar
+
+$(XLOAD_DIR)/.unpacked: $(DL_DIR)/$(XLOAD_SOURCE)
+	$(XLOAD_CAT) $(DL_DIR)/$(XLOAD_SOURCE) \
+		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(XLOAD_DIR)
+	touch $@
+
+$(XLOAD_DIR)/.patched: $(XLOAD_DIR)/.unpacked
+ifneq ($(strip $(BR2_TARGET_XLOAD_CUSTOM_PATCH)),"")
+	@mkdir -p $(XLOAD_PATCH_DIR)
+	cp -dpr $(BR2_TARGET_XLOAD_CUSTOM_PATCH) $(XLOAD_PATCH_DIR)
+	toolchain/patch-kernel.sh $(XLOAD_DIR) $(XLOAD_PATCH_DIR) \*.patch
+endif
+	touch $@
+
+$(XLOAD_DIR)/.configured: $(XLOAD_DIR)/.patched
+	$(TARGET_CONFIGURE_OPTS)		\
+		CFLAGS="$(TARGET_CFLAGS)"	\
+		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		$(XLOAD_CONFIGURE_OPTS) \
+		$(MAKE) -C $(XLOAD_DIR)	\
+		$(XLOAD_BOARD_NAME)_config
+	touch $@
+
+$(DL_DIR)/signGP.c:
+	$(call DOWNLOAD,$(SIGNGP_SITE),$(SIGNGP_SOURCE))
+
+$(XLOAD_DIR)/signGP.c: $(DL_DIR)/signGP.c
+	cp $(DL_DIR)/signGP.c $(XLOAD_DIR)/signGP.c
+
+$(XLOAD_DIR)/signGP: $(XLOAD_DIR)/signGP.c
+	$(HOSTCC) $(XLOAD_DIR)/signGP.c -o $(XLOAD_DIR)/signGP
+
+$(XLOAD_DIR)/$(XLOAD_BIN): $(XLOAD_DIR)/.configured $(XLOAD_DIR)/signGP
+	$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(XLOAD_CONFIGURE_OPTS) \
+		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(XLOAD_ARCH) \
+		 -C $(XLOAD_DIR)
+	$(XLOAD_DIR)/signGP $(XLOAD_DIR)/x-load.bin
+	cp $(XLOAD_DIR)/x-load.bin.ift $(XLOAD_DIR)/MLO
+
+$(BINARIES_DIR)/$(XLOAD_BIN): $(XLOAD_DIR)/$(XLOAD_BIN)
+	rm -f $(BINARIES_DIR)/$(XLOAD_BIN)
+	rm -f $(BINARIES_DIR)/$(XLOAD_TARGET_BIN)
+	cp -dpf $(XLOAD_DIR)/$(XLOAD_BIN) $(BINARIES_DIR)/$(XLOAD_TARGET_BIN)
+	(cd $(BINARIES_DIR); ln -s $(XLOAD_TARGET_BIN) $(XLOAD_BIN))
+
+x-load: $(XLOAD_TARGETS)
+
+x-load-autoscript: $(XLOAD_AUTOSCRIPT).img
+
+x-load-clean:
+	-$(MAKE) -C $(XLOAD_DIR) clean
+	rm -f $(XLOAD_TOOLS) $(XLOAD_TARGET_TOOLS)
+
+x-load-dirclean:
+	rm -rf $(XLOAD_DIR)
+
+x-load-source: $(DL_DIR)/$(XLOAD_SOURCE)
+
+x-load-unpacked: $(XLOAD_DIR)/.patched
+
+x-load-configured: $(XLOAD_DIR)/.header_modified
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_TARGET_XLOAD),y)
+TARGETS+=x-load
+
+# we NEED a board name
+ifeq ($(XLOAD_BOARD_NAME),)
+$(error NO x-load board name set. Check your BR2_TARGET_XLOAD_BOARDNAME setting)
+endif
+
+endif
+
+x-load-status:
+	@echo
+	@echo XLOAD_INC_CONF_FILE = $(XLOAD_INC_CONF_FILE)
+	@echo BR2_XLOAD_VERSION = $(BR2_XLOAD_VERSION)
+	@echo BR2_TARGET_XLOAD_SERVERIP = $(BR2_TARGET_XLOAD_SERVERIP)
+	@echo BR2_TARGET_XLOAD_IPADDR = $(BR2_TARGET_XLOAD_IPADDR)
+	@echo BR2_TARGET_XLOAD_GATEWAY = $(BR2_TARGET_XLOAD_GATEWAY)
+	@echo BR2_TARGET_XLOAD_NETMASK = $(BR2_TARGET_XLOAD_NETMASK)
+	@echo BR2_TARGET_XLOAD_ETH0ADDR = $(BR2_TARGET_XLOAD_ETHADDR)
+	@echo BR2_TARGET_XLOAD_ETH1ADDR = $(BR2_TARGET_XLOAD_ETH1ADDR)
+	@echo BR2_TARGET_XLOAD_SILENT = $(BR2_TARGET_XLOAD_SILENT)
+	@echo XLOAD_BOARD_NAME=$(XLOAD_BOARD_NAME)
+	@exit 0
+
-- 
1.6.3.3
