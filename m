From: Darius Augulis <augulis.darius@gmail.com>
Date: Mon, 12 Jul 2010 23:48:27 +0300
Subject: [Buildroot] [PATCH 1/2] Add support for Alix2d3 board from PC
	Engines
In-Reply-To: <20100712204654.17842.63829.stgit@darius-desktop>
References: <20100712204654.17842.63829.stgit@darius-desktop>
Message-ID: <20100712204827.17842.8046.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This board is based on x86 architekture processor
AMD Geode LX800 working at 500 Mhz.
It has 256 MB of SDRAM, 3 ethernet interfaces,
USB host, one mini-PCI slot, CF slot,
RS232 console and other interfaces.

http://www.pcengines.ch/alix2d3.htm

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 configs/alix2d3_defconfig                          |  892 +++++++++++
 target/device/Config.in                            |    1 
 target/device/pcengines/Config.in                  |   20 
 target/device/pcengines/Makefile.in                |    4 
 target/device/pcengines/alix2d3/Makefile.in        |    4 
 target/device/pcengines/alix2d3/busybox.config     |  920 +++++++++++
 .../pcengines/alix2d3/linux-2.6-alix2d3.config     | 1601 ++++++++++++++++++++
 target/device/pcengines/alix2d3/uclibc.config      |  248 +++
 8 files changed, 3690 insertions(+), 0 deletions(-)
 create mode 100644 configs/alix2d3_defconfig
 create mode 100644 target/device/pcengines/Config.in
 create mode 100644 target/device/pcengines/Makefile.in
 create mode 100644 target/device/pcengines/alix2d3/Makefile.in
 create mode 100755 target/device/pcengines/alix2d3/busybox.config
 create mode 100644 target/device/pcengines/alix2d3/linux-2.6-alix2d3.config
 create mode 100755 target/device/pcengines/alix2d3/uclibc.config

diff --git a/configs/alix2d3_defconfig b/configs/alix2d3_defconfig
new file mode 100644
index 0000000..0e10dc2
--- /dev/null
+++ b/configs/alix2d3_defconfig
@@ -0,0 +1,892 @@
+#
+# Automatically generated make config: don't edit
+# Sun Jul 11 23:15:36 2010
+#
+BR2_HAVE_DOT_CONFIG=y
+BR2_VERSION="2010.08-git"
+# BR2_alpha is not set
+# BR2_arm is not set
+# BR2_armeb is not set
+# BR2_avr32 is not set
+# BR2_cris is not set
+# BR2_ia64 is not set
+BR2_i386=y
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
+# BR2_x86_i386 is not set
+# BR2_x86_i486 is not set
+BR2_x86_i586=y
+# BR2_x86_i686 is not set
+# BR2_x86_pentiumpro is not set
+# BR2_x86_pentium_mmx is not set
+# BR2_x86_pentium_m is not set
+# BR2_x86_pentium2 is not set
+# BR2_x86_pentium3 is not set
+# BR2_x86_pentium4 is not set
+# BR2_x86_prescott is not set
+# BR2_x86_nocona is not set
+# BR2_x86_core2 is not set
+# BR2_x86_k6 is not set
+# BR2_x86_k6_2 is not set
+# BR2_x86_athlon is not set
+# BR2_x86_athlon_4 is not set
+# BR2_x86_opteron is not set
+# BR2_x86_opteron_sse3 is not set
+# BR2_x86_barcelona is not set
+# BR2_x86_geode is not set
+# BR2_x86_c3 is not set
+# BR2_x86_winchip_c6 is not set
+# BR2_x86_winchip2 is not set
+BR2_ARCH="i586"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_TUNE="i586"
+BR2_GCC_TARGET_ARCH="i586"
+
+#
+# Target options
+#
+
+#
+# Preset Devices
+#
+BR2_BOARD_NAME="alix2d3"
+BR2_BOARD_PATH="target/device/pcengines/$(BR2_BOARD_NAME)"
+# BR2_TARGET_X86 is not set
+BR2_TARGET_PCENGINES=y
+BR2_TARGET_PCENGINES_ALIX2D3=y
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
+BR2_TARGET_GENERIC_GETTY=y
+# BR2_TARGET_GENERIC_GETTY_NONE is not set
+BR2_TARGET_GENERIC_GETTY_TTYS0=y
+# BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS2 is not set
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
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
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
+# BR2_CONFIG_CACHE is not set
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
+# BR2_KERNEL_HEADERS_2_6_33 is not set
+BR2_KERNEL_HEADERS_2_6_34=y
+# BR2_KERNEL_HEADERS_VERSION is not set
+# BR2_KERNEL_HEADERS_SNAP is not set
+BR2_DEFAULT_KERNEL_HEADERS="2.6.34.1"
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
+BR2_UCLIBC_CONFIG="$(BR2_BOARD_PATH)/uclibc.config"
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
+# BR2_GCC_VERSION_4_2_1 is not set
+# BR2_GCC_VERSION_4_2_2 is not set
+# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
+# BR2_GCC_VERSION_4_2_3 is not set
+# BR2_GCC_VERSION_4_2_4 is not set
+# BR2_GCC_VERSION_4_3_X is not set
+BR2_GCC_VERSION_4_4_X=y
+# BR2_GCC_VERSION_SNAP is not set
+BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
+BR2_GCC_VERSION="4.4.4"
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
+BR2_NEEDS_GETTEXT=y
+# BR2_USE_WCHAR is not set
+# BR2_USE_SSP is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+# BR2_PROGRAM_INVOCATION is not set
+# BR2_INSTALL_LIBSTDCPP is not set
+BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+# BR2_ENABLE_MULTILIB is not set
+# BR2_CROSS_TOOLCHAIN_TARGET_UTILS is not set
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
+BR2_BUSYBOX_VERSION="1.16.2"
+BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
+BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_BOARD_PATH)/busybox.config"
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
+# BR2_PACKAGE_FFMPEG is not set
+
+#
+# gstreamer requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBCDAUDIO is not set
+# BR2_PACKAGE_LIBDVDREAD is not set
+# BR2_PACKAGE_LIBDVDNAV is not set
+# BR2_PACKAGE_LIBID3TAG is not set
+# BR2_PACKAGE_LIBMAD is not set
+
+#
+# libmms requires a toolchain with WCHAR support
+#
+
+#
+# libmpd requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBOGG is not set
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBTHEORA is not set
+# BR2_PACKAGE_LIBVORBIS is not set
+# BR2_PACKAGE_MADPLAY is not set
+# BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_MPLAYER is not set
+# BR2_PACKAGE_SPEEX is not set
+
+#
+# swfdec requires a toolchain with WCHAR support
+#
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
+
+#
+# lmbench requires a toolchain with RPC support
+#
+
+#
+# lsof requires a toolchain with RPC support
+#
+# BR2_PACKAGE_LTRACE is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_NETPERF is not set
+
+#
+# oprofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_STRACE is not set
+# BR2_PACKAGE_VALGRIND is not set
+
+#
+# Development tools
+#
+# BR2_PACKAGE_AUTOCONF is not set
+# BR2_PACKAGE_AUTOMAKE is not set
+# BR2_PACKAGE_BISON is not set
+# BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_DISTCC is not set
+# BR2_PACKAGE_FAKEROOT is not set
+# BR2_PACKAGE_FLEX is not set
+
+#
+# native toolchain needs development files in target filesystem
+#
+
+#
+# gettext requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBINTL is not set
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
+
+#
+# pkg-config requires a toolchain with WCHAR support
+#
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
+
+#
+# X.org requires a toolchain with WCHAR support
+#
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
+
+#
+# gob2 requires a toolchain with WCHAR support
+#
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_ACPID is not set
+# BR2_PACKAGE_CDRKIT is not set
+# BR2_PACKAGE_CRAMFS is not set
+
+#
+# dbus not available (need expat or libxml2)
+#
+# BR2_PACKAGE_DMRAID is not set
+# BR2_PACKAGE_DOSFSTOOLS is not set
+# BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
+# BR2_PACKAGE_GENEXT2FS is not set
+# BR2_PACKAGE_GENROMFS is not set
+
+#
+# gvfs requires a toolchain with LARGEFILE and WCHAR support
+#
+
+#
+# hal requires a toolchain with WCHAR support
+#
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
+
+#
+# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
+#
+
+#
+# ntfsprogs requires a toolchain with WCHAR and LARGEFILE support
+#
+BR2_PACKAGE_PCIUTILS=y
+# BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SMARTMONTOOLS is not set
+# BR2_PACKAGE_SQUASHFS is not set
+
+#
+# sshfs requires a toolchain with LARGEFILE and WCHAR support
+#
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_USB_MODESWITCH is not set
+# BR2_PACKAGE_USBMOUNT is not set
+BR2_PACKAGE_USBUTILS=y
+# BR2_PACKAGE_USBUTILS_ZLIB is not set
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
+
+#
+# python requires a toolchain with WCHAR support
+#
+
+#
+# ruby requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_TCL is not set
+
+#
+# Libraries
+#
+
+#
+# Compression and decompression
+#
+
+#
+# libarchive requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LZO is not set
+BR2_PACKAGE_ZLIB=y
+
+#
+# Crypto
+#
+# BR2_PACKAGE_BEECRYPT is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
+# BR2_PACKAGE_OPENSSL is not set
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
+
+#
+# gamin requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
+# BR2_PACKAGE_LIBFUSE is not set
+# BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBSYSFS is not set
+
+#
+# Graphics
+#
+
+#
+# atk requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
+
+#
+# libgtk2 requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBSVGTINY is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+
+#
+# pango requires a toolchain with WCHAR support
+#
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
+BR2_PACKAGE_LIBUSB=y
+BR2_PACKAGE_LIBUSB_COMPAT=y
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
+BR2_PACKAGE_LIBPCAP=y
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBRSYNC is not set
+
+#
+# libsoup requires a toolchain with WCHAR support
+#
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
+
+#
+# libglib2 requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LIBOIL is not set
+
+#
+# Text and terminal handling
+#
+
+#
+# enchant requires a toolchain with C++ and WCHAR support enabled
+#
+
+#
+# icu requires a toolchain with C++ support and WCHAR enabled
+#
+# BR2_PACKAGE_LIBICONV is not set
+# BR2_PACKAGE_NCURSES is not set
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_PCRE is not set
+# BR2_PACKAGE_POPT is not set
+# BR2_PACKAGE_READLINE is not set
+# BR2_PACKAGE_SLANG is not set
+
+#
+# XML
+#
+# BR2_PACKAGE_EXPAT is not set
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
+
+#
+# shared-mime-info requires a toolchain with WCHAR support
+#
+
+#
+# Networking applications
+#
+# BR2_PACKAGE_ARGUS is not set
+# BR2_PACKAGE_AVAHI is not set
+# BR2_PACKAGE_AXEL is not set
+# BR2_PACKAGE_BIND is not set
+
+#
+# bmon requires a toolchain with IPv6 support
+#
+BR2_PACKAGE_BRIDGE=y
+
+#
+# ctorrent requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_CUPS is not set
+# BR2_PACKAGE_DNSMASQ is not set
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_HOSTAPD=y
+# BR2_PACKAGE_HOSTAPD_EXTRA_EAP is not set
+# BR2_PACKAGE_HOSTAPD_WPS is not set
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
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+
+#
+# Kismet requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_L2TP is not set
+# BR2_PACKAGE_LINKS is not set
+# BR2_PACKAGE_LRZSZ is not set
+# BR2_PACKAGE_MIIDIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+
+#
+# mutt requires a toolchain with WCHAR support
+#
+
+#
+# nbd requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_NCFTP is not set
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+
+#
+# nfs-utils requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_NTP is not set
+
+#
+# olsr requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_OPENNTPD is not set
+# BR2_PACKAGE_OPENSSH is not set
+# BR2_PACKAGE_OPENVPN is not set
+
+#
+# portmap requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
+# BR2_PACKAGE_PROFTPD is not set
+# BR2_PACKAGE_QUAGGA is not set
+BR2_PACKAGE_RSYNC=y
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+
+#
+# Squid requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_STUNNEL is not set
+BR2_PACKAGE_TCPDUMP=y
+BR2_PACKAGE_TCPDUMP_SMB=y
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_TTCP is not set
+# BR2_PACKAGE_UDPCAST is not set
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
+# BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WEBIF is not set
+BR2_PACKAGE_WIRELESS_TOOLS=y
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+
+#
+# Shell and utilities
+#
+# BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_DIALOG is not set
+# BR2_PACKAGE_FILE is not set
+# BR2_PACKAGE_LOCKFILE_PROGS is not set
+
+#
+# logrotate requires a toolchain with WCHAR support
+#
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
+BR2_TARGET_ROOTFS_TAR_NONE=y
+# BR2_TARGET_ROOTFS_TAR_GZIP is not set
+# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
+# BR2_TARGET_ROOTFS_TAR_LZMA is not set
+BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+# BR2_TARGET_ROOTFS_CPIO is not set
+# BR2_TARGET_ROOTFS_ISO9660 is not set
+# BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
+
+#
+# Bootloaders
+#
+# BR2_TARGET_BAREBOX is not set
+BR2_TARGET_GRUB=y
+# BR2_TARGET_GRUB_SPLASH is not set
+# BR2_TARGET_GRUB_DISKLESS is not set
+# BR2_TARGET_GRUB_3c595 is not set
+# BR2_TARGET_GRUB_3c90x is not set
+# BR2_TARGET_GRUB_davicom is not set
+# BR2_TARGET_GRUB_e1000 is not set
+# BR2_TARGET_GRUB_eepro100 is not set
+# BR2_TARGET_GRUB_epic100 is not set
+# BR2_TARGET_GRUB_forcedeth is not set
+# BR2_TARGET_GRUB_natsemi is not set
+# BR2_TARGET_GRUB_ns83820 is not set
+# BR2_TARGET_GRUB_ns8390 is not set
+# BR2_TARGET_GRUB_pcnet32 is not set
+# BR2_TARGET_GRUB_pnic is not set
+# BR2_TARGET_GRUB_rtl8139 is not set
+# BR2_TARGET_GRUB_r8169 is not set
+# BR2_TARGET_GRUB_sis900 is not set
+# BR2_TARGET_GRUB_tg3 is not set
+# BR2_TARGET_GRUB_tulip is not set
+# BR2_TARGET_GRUB_tlan is not set
+# BR2_TARGET_GRUB_undi is not set
+BR2_TARGET_GRUB_via_rhine=y
+# BR2_TARGET_GRUB_w89c840 is not set
+# BR2_TARGET_SYSLINUX is not set
+# BR2_TARGET_PXELINUX is not set
+# BR2_TARGET_UBOOT is not set
+
+#
+# Kernel
+#
+BR2_LINUX_KERNEL=y
+# BR2_LINUX_KERNEL_2_6_34 is not set
+BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
+# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
+BR2_LINUX_KERNEL_VERSION="2.6.34.1"
+BR2_LINUX_KERNEL_PATCH=""
+# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_BOARD_PATH)/linux-2.6-alix2d3.config"
+# BR2_LINUX_KERNEL_UIMAGE is not set
+BR2_LINUX_KERNEL_BZIMAGE=y
+# BR2_LINUX_KERNEL_ZIMAGE is not set
+# BR2_LINUX_KERNEL_VMLINUX is not set
diff --git a/target/device/Config.in b/target/device/Config.in
index 6b7f11a..2455a87 100644
--- a/target/device/Config.in
+++ b/target/device/Config.in
@@ -8,6 +8,7 @@ source "target/device/KwikByte/Config.in"
 source "target/device/valka/Config.in"
 source "target/device/x86/Config.in"
 source "target/device/xtensa/Config.in"
+source "target/device/pcengines/Config.in"
 
 # This must be last
 source "target/generic/Config.in"
diff --git a/target/device/pcengines/Config.in b/target/device/pcengines/Config.in
new file mode 100644
index 0000000..9136c95
--- /dev/null
+++ b/target/device/pcengines/Config.in
@@ -0,0 +1,20 @@
+menuconfig BR2_TARGET_PCENGINES
+	bool "PC Engines boards"
+	depends on BR2_i386
+
+if BR2_TARGET_PCENGINES
+
+config BR2_TARGET_PCENGINES_ALIX2D3
+	bool "Alix 2D3 board"
+	help
+          Build for Alix 2D3 board
+
+config BR2_BOARD_NAME
+	string
+	default "alix2d3"	if BR2_TARGET_PCENGINES_ALIX2D3
+
+config BR2_BOARD_PATH
+	string "Board Path"
+	default "target/device/pcengines/$(BR2_BOARD_NAME)"
+
+endif
diff --git a/target/device/pcengines/Makefile.in b/target/device/pcengines/Makefile.in
new file mode 100644
index 0000000..bb0a4ed
--- /dev/null
+++ b/target/device/pcengines/Makefile.in
@@ -0,0 +1,4 @@
+ifeq ($(BR2_TARGET_PCENGINES_ALIX2D3),y)
+include target/device/pcengines/alix2d3/Makefile.in
+endif
+
diff --git a/target/device/pcengines/alix2d3/Makefile.in b/target/device/pcengines/alix2d3/Makefile.in
new file mode 100644
index 0000000..90bc557
--- /dev/null
+++ b/target/device/pcengines/alix2d3/Makefile.in
@@ -0,0 +1,4 @@
+ifeq ($(BR2_TARGET_PCENGINES_ALIX2D3),y)
+BOARD_NAME:=$(call qstrip,$(BR2_BOARD_NAME))
+BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
+endif
diff --git a/target/device/pcengines/alix2d3/busybox.config b/target/device/pcengines/alix2d3/busybox.config
new file mode 100755
index 0000000..5d5c73a
--- /dev/null
+++ b/target/device/pcengines/alix2d3/busybox.config
@@ -0,0 +1,920 @@
+#
+# Automatically generated make config: don't edit
+# Busybox version: 1.16.2
+# Fri Jul  9 23:23:21 2010
+#
+CONFIG_HAVE_DOT_CONFIG=y
+
+#
+# Busybox Settings
+#
+
+#
+# General Configuration
+#
+# CONFIG_DESKTOP is not set
+# CONFIG_EXTRA_COMPAT is not set
+CONFIG_INCLUDE_SUSv2=y
+# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
+CONFIG_SHOW_USAGE=y
+CONFIG_FEATURE_VERBOSE_USAGE=y
+# CONFIG_FEATURE_COMPRESS_USAGE is not set
+CONFIG_FEATURE_INSTALLER=y
+# CONFIG_LOCALE_SUPPORT is not set
+# CONFIG_FEATURE_ASSUME_UNICODE is not set
+# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_LONG_OPTS=y
+CONFIG_FEATURE_DEVPTS=y
+CONFIG_FEATURE_CLEAN_UP=y
+# CONFIG_FEATURE_PIDFILE is not set
+CONFIG_FEATURE_SUID=y
+# CONFIG_FEATURE_SUID_CONFIG is not set
+# CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_PREFER_APPLETS is not set
+CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+CONFIG_FEATURE_SYSLOG=y
+# CONFIG_FEATURE_HAVE_RPC is not set
+
+#
+# Build Options
+#
+# CONFIG_STATIC is not set
+# CONFIG_PIE is not set
+# CONFIG_NOMMU is not set
+# CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_INDIVIDUAL is not set
+# CONFIG_FEATURE_SHARED_BUSYBOX is not set
+CONFIG_LFS=y
+CONFIG_CROSS_COMPILER_PREFIX=""
+CONFIG_EXTRA_CFLAGS=""
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_WERROR is not set
+CONFIG_NO_DEBUG_LIB=y
+# CONFIG_DMALLOC is not set
+# CONFIG_EFENCE is not set
+
+#
+# Installation Options
+#
+# CONFIG_INSTALL_NO_USR is not set
+CONFIG_INSTALL_APPLET_SYMLINKS=y
+# CONFIG_INSTALL_APPLET_HARDLINKS is not set
+# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
+# CONFIG_INSTALL_APPLET_DONT is not set
+# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
+# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
+# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
+CONFIG_PREFIX="/home/darius/Projects/buildroot/output/target"
+
+#
+# Busybox Library Tuning
+#
+CONFIG_PASSWORD_MINLEN=6
+CONFIG_MD5_SIZE_VS_SPEED=2
+# CONFIG_FEATURE_FAST_TOP is not set
+# CONFIG_FEATURE_ETC_NETWORKS is not set
+CONFIG_FEATURE_EDITING=y
+CONFIG_FEATURE_EDITING_MAX_LEN=1024
+CONFIG_FEATURE_EDITING_VI=y
+CONFIG_FEATURE_EDITING_HISTORY=999
+CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+CONFIG_FEATURE_TAB_COMPLETION=y
+# CONFIG_FEATURE_USERNAME_COMPLETION is not set
+CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
+# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
+CONFIG_FEATURE_NON_POSIX_CP=y
+# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
+CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_MONOTONIC_SYSCALL=y
+CONFIG_IOCTL_HEX2STR_ERROR=y
+CONFIG_FEATURE_HWIB=y
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+# CONFIG_FEATURE_SEAMLESS_LZMA is not set
+# CONFIG_FEATURE_SEAMLESS_BZ2 is not set
+# CONFIG_FEATURE_SEAMLESS_GZ is not set
+# CONFIG_FEATURE_SEAMLESS_Z is not set
+# CONFIG_AR is not set
+# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
+# CONFIG_BUNZIP2 is not set
+# CONFIG_BZIP2 is not set
+# CONFIG_CPIO is not set
+# CONFIG_FEATURE_CPIO_O is not set
+# CONFIG_FEATURE_CPIO_P is not set
+# CONFIG_DPKG is not set
+# CONFIG_DPKG_DEB is not set
+# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
+# CONFIG_GUNZIP is not set
+# CONFIG_GZIP is not set
+# CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
+# CONFIG_LZOP is not set
+# CONFIG_LZOP_COMPR_HIGH is not set
+# CONFIG_RPM2CPIO is not set
+# CONFIG_RPM is not set
+# CONFIG_TAR is not set
+# CONFIG_FEATURE_TAR_CREATE is not set
+# CONFIG_FEATURE_TAR_AUTODETECT is not set
+# CONFIG_FEATURE_TAR_FROM is not set
+# CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
+# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
+# CONFIG_FEATURE_TAR_GNU_EXTENSIONS is not set
+# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
+# CONFIG_FEATURE_TAR_UNAME_GNAME is not set
+# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
+# CONFIG_UNCOMPRESS is not set
+# CONFIG_UNLZMA is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
+# CONFIG_UNZIP is not set
+
+#
+# Coreutils
+#
+CONFIG_BASENAME=y
+# CONFIG_CAL is not set
+CONFIG_CAT=y
+CONFIG_CATV=y
+CONFIG_CHGRP=y
+CONFIG_CHMOD=y
+CONFIG_CHOWN=y
+# CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
+CONFIG_CHROOT=y
+CONFIG_CKSUM=y
+# CONFIG_COMM is not set
+CONFIG_CP=y
+# CONFIG_FEATURE_CP_LONG_OPTIONS is not set
+CONFIG_CUT=y
+CONFIG_DATE=y
+CONFIG_FEATURE_DATE_ISOFMT=y
+CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
+CONFIG_FEATURE_DD_IBS_OBS=y
+CONFIG_DF=y
+# CONFIG_FEATURE_DF_FANCY is not set
+CONFIG_DIRNAME=y
+CONFIG_DOS2UNIX=y
+CONFIG_UNIX2DOS=y
+CONFIG_DU=y
+CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
+CONFIG_ECHO=y
+CONFIG_FEATURE_FANCY_ECHO=y
+CONFIG_ENV=y
+# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
+# CONFIG_EXPAND is not set
+# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
+CONFIG_EXPR=y
+CONFIG_EXPR_MATH_SUPPORT_64=y
+CONFIG_FALSE=y
+CONFIG_FOLD=y
+# CONFIG_FSYNC is not set
+CONFIG_HEAD=y
+CONFIG_FEATURE_FANCY_HEAD=y
+CONFIG_HOSTID=y
+CONFIG_ID=y
+CONFIG_INSTALL=y
+CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
+CONFIG_LENGTH=y
+CONFIG_LN=y
+CONFIG_LOGNAME=y
+CONFIG_LS=y
+CONFIG_FEATURE_LS_FILETYPES=y
+CONFIG_FEATURE_LS_FOLLOWLINKS=y
+CONFIG_FEATURE_LS_RECURSIVE=y
+CONFIG_FEATURE_LS_SORTFILES=y
+CONFIG_FEATURE_LS_TIMESTAMPS=y
+CONFIG_FEATURE_LS_USERNAME=y
+CONFIG_FEATURE_LS_COLOR=y
+CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=y
+CONFIG_MD5SUM=y
+CONFIG_MKDIR=y
+CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
+CONFIG_MKFIFO=y
+CONFIG_MKNOD=y
+CONFIG_MV=y
+CONFIG_FEATURE_MV_LONG_OPTIONS=y
+CONFIG_NICE=y
+CONFIG_NOHUP=y
+CONFIG_OD=y
+CONFIG_PRINTENV=y
+CONFIG_PRINTF=y
+CONFIG_PWD=y
+CONFIG_READLINK=y
+CONFIG_FEATURE_READLINK_FOLLOW=y
+CONFIG_REALPATH=y
+CONFIG_RM=y
+CONFIG_RMDIR=y
+# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
+CONFIG_SEQ=y
+CONFIG_SHA1SUM=y
+# CONFIG_SHA256SUM is not set
+# CONFIG_SHA512SUM is not set
+CONFIG_SLEEP=y
+# CONFIG_FEATURE_FANCY_SLEEP is not set
+# CONFIG_FEATURE_FLOAT_SLEEP is not set
+CONFIG_SORT=y
+CONFIG_FEATURE_SORT_BIG=y
+# CONFIG_SPLIT is not set
+# CONFIG_FEATURE_SPLIT_FANCY is not set
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STTY=y
+# CONFIG_SUM is not set
+CONFIG_SYNC=y
+# CONFIG_TAC is not set
+CONFIG_TAIL=y
+CONFIG_FEATURE_FANCY_TAIL=y
+CONFIG_TEE=y
+CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
+CONFIG_TEST=y
+CONFIG_FEATURE_TEST_64=y
+CONFIG_TOUCH=y
+CONFIG_TR=y
+CONFIG_FEATURE_TR_CLASSES=y
+CONFIG_FEATURE_TR_EQUIV=y
+CONFIG_TRUE=y
+CONFIG_TTY=y
+CONFIG_UNAME=y
+# CONFIG_UNEXPAND is not set
+# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
+CONFIG_UNIQ=y
+CONFIG_USLEEP=y
+CONFIG_UUDECODE=y
+CONFIG_UUENCODE=y
+CONFIG_WC=y
+# CONFIG_FEATURE_WC_LARGE is not set
+CONFIG_WHO=y
+CONFIG_WHOAMI=y
+CONFIG_YES=y
+
+#
+# Common options for cp and mv
+#
+CONFIG_FEATURE_PRESERVE_HARDLINKS=y
+
+#
+# Common options for ls, more and telnet
+#
+CONFIG_FEATURE_AUTOWIDTH=y
+
+#
+# Common options for df, du, ls
+#
+CONFIG_FEATURE_HUMAN_READABLE=y
+
+#
+# Common options for md5sum, sha1sum, sha256sum, sha512sum
+#
+CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
+
+#
+# Console Utilities
+#
+# CONFIG_CHVT is not set
+CONFIG_CLEAR=y
+# CONFIG_DEALLOCVT is not set
+# CONFIG_DUMPKMAP is not set
+# CONFIG_KBD_MODE is not set
+# CONFIG_LOADFONT is not set
+# CONFIG_LOADKMAP is not set
+# CONFIG_OPENVT is not set
+# CONFIG_RESET is not set
+# CONFIG_RESIZE is not set
+# CONFIG_FEATURE_RESIZE_PRINT is not set
+# CONFIG_SETCONSOLE is not set
+# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
+# CONFIG_SETFONT is not set
+# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
+CONFIG_DEFAULT_SETFONT_DIR=""
+# CONFIG_SETKEYCODES is not set
+# CONFIG_SETLOGCONS is not set
+# CONFIG_SHOWKEY is not set
+
+#
+# Debian Utilities
+#
+CONFIG_MKTEMP=y
+# CONFIG_PIPE_PROGRESS is not set
+# CONFIG_RUN_PARTS is not set
+# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
+# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
+# CONFIG_START_STOP_DAEMON is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_FANCY is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
+CONFIG_WHICH=y
+
+#
+# Editors
+#
+# CONFIG_AWK is not set
+# CONFIG_FEATURE_AWK_LIBM is not set
+# CONFIG_CMP is not set
+# CONFIG_DIFF is not set
+# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
+# CONFIG_FEATURE_DIFF_DIR is not set
+# CONFIG_ED is not set
+# CONFIG_PATCH is not set
+# CONFIG_SED is not set
+CONFIG_VI=y
+CONFIG_FEATURE_VI_MAX_LEN=4096
+CONFIG_FEATURE_VI_8BIT=y
+CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_YANKMARK=y
+CONFIG_FEATURE_VI_SEARCH=y
+CONFIG_FEATURE_VI_USE_SIGNALS=y
+CONFIG_FEATURE_VI_DOT_CMD=y
+CONFIG_FEATURE_VI_READONLY=y
+CONFIG_FEATURE_VI_SETOPTS=y
+CONFIG_FEATURE_VI_SET=y
+CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_FEATURE_ALLOW_EXEC=y
+
+#
+# Finding Utilities
+#
+# CONFIG_FIND is not set
+# CONFIG_FEATURE_FIND_PRINT0 is not set
+# CONFIG_FEATURE_FIND_MTIME is not set
+# CONFIG_FEATURE_FIND_MMIN is not set
+# CONFIG_FEATURE_FIND_PERM is not set
+# CONFIG_FEATURE_FIND_TYPE is not set
+# CONFIG_FEATURE_FIND_XDEV is not set
+# CONFIG_FEATURE_FIND_MAXDEPTH is not set
+# CONFIG_FEATURE_FIND_NEWER is not set
+# CONFIG_FEATURE_FIND_INUM is not set
+# CONFIG_FEATURE_FIND_EXEC is not set
+# CONFIG_FEATURE_FIND_USER is not set
+# CONFIG_FEATURE_FIND_GROUP is not set
+# CONFIG_FEATURE_FIND_NOT is not set
+# CONFIG_FEATURE_FIND_DEPTH is not set
+# CONFIG_FEATURE_FIND_PAREN is not set
+# CONFIG_FEATURE_FIND_SIZE is not set
+# CONFIG_FEATURE_FIND_PRUNE is not set
+# CONFIG_FEATURE_FIND_DELETE is not set
+# CONFIG_FEATURE_FIND_PATH is not set
+# CONFIG_FEATURE_FIND_REGEX is not set
+# CONFIG_FEATURE_FIND_CONTEXT is not set
+# CONFIG_FEATURE_FIND_LINKS is not set
+CONFIG_GREP=y
+CONFIG_FEATURE_GREP_EGREP_ALIAS=y
+CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_FEATURE_GREP_CONTEXT=y
+CONFIG_XARGS=y
+# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
+CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
+CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+
+#
+# Init Utilities
+#
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_FEATURE_KILL_REMOVED=y
+CONFIG_FEATURE_KILL_DELAY=0
+CONFIG_FEATURE_INIT_SCTTY=y
+CONFIG_FEATURE_INIT_SYSLOG=y
+CONFIG_FEATURE_EXTRA_QUIET=y
+# CONFIG_FEATURE_INIT_COREDUMPS is not set
+CONFIG_FEATURE_INITRD=y
+CONFIG_HALT=y
+# CONFIG_FEATURE_CALL_TELINIT is not set
+CONFIG_TELINIT_PATH=""
+CONFIG_MESG=y
+
+#
+# Login/Password Management Utilities
+#
+CONFIG_FEATURE_SHADOWPASSWDS=y
+# CONFIG_USE_BB_PWD_GRP is not set
+# CONFIG_USE_BB_SHADOW is not set
+CONFIG_USE_BB_CRYPT=y
+# CONFIG_USE_BB_CRYPT_SHA is not set
+CONFIG_ADDGROUP=y
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+CONFIG_DELGROUP=y
+# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
+# CONFIG_FEATURE_CHECK_NAMES is not set
+CONFIG_ADDUSER=y
+# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+CONFIG_FIRST_SYSTEM_ID=100
+CONFIG_LAST_SYSTEM_ID=999
+CONFIG_DELUSER=y
+CONFIG_GETTY=y
+CONFIG_FEATURE_UTMP=y
+CONFIG_FEATURE_WTMP=y
+CONFIG_LOGIN=y
+# CONFIG_PAM is not set
+# CONFIG_LOGIN_SCRIPTS is not set
+CONFIG_FEATURE_NOLOGIN=y
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
+# CONFIG_CRYPTPW is not set
+# CONFIG_CHPASSWD is not set
+CONFIG_SU=y
+CONFIG_FEATURE_SU_SYSLOG=y
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
+
+#
+# Linux Ext2 FS Progs
+#
+# CONFIG_CHATTR is not set
+# CONFIG_FSCK is not set
+# CONFIG_LSATTR is not set
+
+#
+# Linux Module Utilities
+#
+# CONFIG_MODPROBE_SMALL is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
+CONFIG_INSMOD=y
+CONFIG_RMMOD=y
+CONFIG_LSMOD=y
+CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
+CONFIG_MODPROBE=y
+# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
+# CONFIG_DEPMOD is not set
+
+#
+# Options common to multiple modutils
+#
+# CONFIG_FEATURE_2_4_MODULES is not set
+# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
+# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
+# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
+# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
+CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
+CONFIG_FEATURE_MODUTILS_ALIAS=y
+CONFIG_FEATURE_MODUTILS_SYMBOLS=y
+CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
+CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
+
+#
+# Linux System Utilities
+#
+# CONFIG_ACPID is not set
+# CONFIG_FEATURE_ACPID_COMPAT is not set
+# CONFIG_BLKID is not set
+CONFIG_DMESG=y
+CONFIG_FEATURE_DMESG_PRETTY=y
+# CONFIG_FBSET is not set
+# CONFIG_FEATURE_FBSET_FANCY is not set
+# CONFIG_FEATURE_FBSET_READMODE is not set
+# CONFIG_FDFLUSH is not set
+# CONFIG_FDFORMAT is not set
+# CONFIG_FDISK is not set
+CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+# CONFIG_FEATURE_FDISK_WRITABLE is not set
+# CONFIG_FEATURE_AIX_LABEL is not set
+# CONFIG_FEATURE_SGI_LABEL is not set
+# CONFIG_FEATURE_SUN_LABEL is not set
+# CONFIG_FEATURE_OSF_LABEL is not set
+# CONFIG_FEATURE_FDISK_ADVANCED is not set
+# CONFIG_FINDFS is not set
+# CONFIG_FREERAMDISK is not set
+# CONFIG_FSCK_MINIX is not set
+# CONFIG_MKFS_EXT2 is not set
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
+# CONFIG_MKFS_REISER is not set
+# CONFIG_MKFS_VFAT is not set
+CONFIG_GETOPT=y
+CONFIG_FEATURE_GETOPT_LONG=y
+CONFIG_HEXDUMP=y
+# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
+# CONFIG_HD is not set
+CONFIG_HWCLOCK=y
+CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
+CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
+CONFIG_IPCRM=y
+CONFIG_IPCS=y
+CONFIG_LOSETUP=y
+# CONFIG_LSPCI is not set
+# CONFIG_LSUSB is not set
+# CONFIG_MDEV is not set
+# CONFIG_FEATURE_MDEV_CONF is not set
+# CONFIG_FEATURE_MDEV_RENAME is not set
+# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
+# CONFIG_FEATURE_MDEV_EXEC is not set
+# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+# CONFIG_MKSWAP is not set
+# CONFIG_FEATURE_MKSWAP_UUID is not set
+CONFIG_MORE=y
+CONFIG_FEATURE_USE_TERMIOS=y
+# CONFIG_VOLUMEID is not set
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
+# CONFIG_FEATURE_VOLUMEID_HFS is not set
+# CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
+# CONFIG_FEATURE_VOLUMEID_NTFS is not set
+# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
+# CONFIG_FEATURE_VOLUMEID_UDF is not set
+# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+# CONFIG_FEATURE_MOUNT_VERBOSE is not set
+# CONFIG_FEATURE_MOUNT_HELPERS is not set
+# CONFIG_FEATURE_MOUNT_LABEL is not set
+# CONFIG_FEATURE_MOUNT_NFS is not set
+CONFIG_FEATURE_MOUNT_CIFS=y
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+# CONFIG_PIVOT_ROOT is not set
+# CONFIG_RDATE is not set
+# CONFIG_RDEV is not set
+# CONFIG_READPROFILE is not set
+# CONFIG_RTCWAKE is not set
+# CONFIG_SCRIPT is not set
+# CONFIG_SCRIPTREPLAY is not set
+# CONFIG_SETARCH is not set
+# CONFIG_SWAPONOFF is not set
+# CONFIG_FEATURE_SWAPON_PRI is not set
+# CONFIG_SWITCH_ROOT is not set
+CONFIG_UMOUNT=y
+CONFIG_FEATURE_UMOUNT_ALL=y
+
+#
+# Common options for mount/umount
+#
+CONFIG_FEATURE_MOUNT_LOOP=y
+# CONFIG_FEATURE_MTAB_SUPPORT is not set
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_ADJTIMEX is not set
+# CONFIG_BBCONFIG is not set
+# CONFIG_BEEP is not set
+CONFIG_FEATURE_BEEP_FREQ=0
+CONFIG_FEATURE_BEEP_LENGTH_MS=0
+# CONFIG_CHAT is not set
+# CONFIG_FEATURE_CHAT_NOFAIL is not set
+# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
+# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
+# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
+# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
+# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
+# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
+# CONFIG_CHRT is not set
+# CONFIG_CROND is not set
+# CONFIG_FEATURE_CROND_D is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+CONFIG_FEATURE_CROND_DIR=""
+# CONFIG_CRONTAB is not set
+# CONFIG_DC is not set
+# CONFIG_FEATURE_DC_LIBM is not set
+# CONFIG_DEVFSD is not set
+# CONFIG_DEVFSD_MODLOAD is not set
+# CONFIG_DEVFSD_FG_NP is not set
+# CONFIG_DEVFSD_VERBOSE is not set
+# CONFIG_FEATURE_DEVFS is not set
+# CONFIG_DEVMEM is not set
+# CONFIG_EJECT is not set
+# CONFIG_FEATURE_EJECT_SCSI is not set
+# CONFIG_FBSPLASH is not set
+# CONFIG_FLASHCP is not set
+# CONFIG_FLASH_LOCK is not set
+# CONFIG_FLASH_UNLOCK is not set
+# CONFIG_FLASH_ERASEALL is not set
+# CONFIG_IONICE is not set
+# CONFIG_INOTIFYD is not set
+# CONFIG_LAST is not set
+# CONFIG_FEATURE_LAST_SMALL is not set
+# CONFIG_FEATURE_LAST_FANCY is not set
+# CONFIG_LESS is not set
+CONFIG_FEATURE_LESS_MAXLINES=0
+# CONFIG_FEATURE_LESS_BRACKETS is not set
+# CONFIG_FEATURE_LESS_FLAGS is not set
+# CONFIG_FEATURE_LESS_MARKS is not set
+# CONFIG_FEATURE_LESS_REGEXP is not set
+# CONFIG_FEATURE_LESS_WINCH is not set
+# CONFIG_FEATURE_LESS_DASHCMD is not set
+# CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_HDPARM is not set
+# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
+# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
+# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+# CONFIG_MAKEDEVS is not set
+# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
+# CONFIG_FEATURE_MAKEDEVS_TABLE is not set
+# CONFIG_MAN is not set
+# CONFIG_MICROCOM is not set
+# CONFIG_MOUNTPOINT is not set
+# CONFIG_MT is not set
+# CONFIG_RAIDAUTORUN is not set
+# CONFIG_READAHEAD is not set
+# CONFIG_RUNLEVEL is not set
+# CONFIG_RX is not set
+# CONFIG_SETSID is not set
+# CONFIG_STRINGS is not set
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+CONFIG_TIME=y
+# CONFIG_TIMEOUT is not set
+# CONFIG_TTYSIZE is not set
+# CONFIG_VOLNAME is not set
+# CONFIG_WALL is not set
+CONFIG_WATCHDOG=y
+
+#
+# Networking Utilities
+#
+# CONFIG_FEATURE_IPV6 is not set
+# CONFIG_FEATURE_UNIX_LOCAL is not set
+# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
+# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
+CONFIG_ARP=y
+CONFIG_ARPING=y
+# CONFIG_BRCTL is not set
+# CONFIG_FEATURE_BRCTL_FANCY is not set
+# CONFIG_FEATURE_BRCTL_SHOW is not set
+# CONFIG_DNSD is not set
+CONFIG_ETHER_WAKE=y
+# CONFIG_FAKEIDENTD is not set
+# CONFIG_FTPD is not set
+# CONFIG_FEATURE_FTP_WRITE is not set
+# CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
+# CONFIG_FTPGET is not set
+# CONFIG_FTPPUT is not set
+# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
+CONFIG_HOSTNAME=y
+# CONFIG_HTTPD is not set
+# CONFIG_FEATURE_HTTPD_RANGES is not set
+# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
+# CONFIG_FEATURE_HTTPD_SETUID is not set
+# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
+# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
+# CONFIG_FEATURE_HTTPD_CGI is not set
+# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
+# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
+# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
+# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
+# CONFIG_FEATURE_HTTPD_PROXY is not set
+CONFIG_IFCONFIG=y
+CONFIG_FEATURE_IFCONFIG_STATUS=y
+CONFIG_FEATURE_IFCONFIG_SLIP=y
+CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ=y
+CONFIG_FEATURE_IFCONFIG_HW=y
+# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
+# CONFIG_IFENSLAVE is not set
+# CONFIG_IFPLUGD is not set
+# CONFIG_IFUPDOWN is not set
+CONFIG_IFUPDOWN_IFSTATE_PATH=""
+# CONFIG_FEATURE_IFUPDOWN_IP is not set
+# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
+# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
+# CONFIG_FEATURE_IFUPDOWN_IPV4 is not set
+# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
+# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
+# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
+# CONFIG_INETD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+# CONFIG_FEATURE_INETD_RPC is not set
+CONFIG_IP=y
+CONFIG_FEATURE_IP_ADDRESS=y
+CONFIG_FEATURE_IP_LINK=y
+CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_TUNNEL=y
+CONFIG_FEATURE_IP_RULE=y
+CONFIG_FEATURE_IP_SHORT_FORMS=y
+# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
+CONFIG_IPADDR=y
+CONFIG_IPLINK=y
+CONFIG_IPROUTE=y
+CONFIG_IPTUNNEL=y
+CONFIG_IPRULE=y
+# CONFIG_IPCALC is not set
+# CONFIG_FEATURE_IPCALC_FANCY is not set
+# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+# CONFIG_NAMEIF is not set
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+# CONFIG_NC is not set
+# CONFIG_NC_SERVER is not set
+# CONFIG_NC_EXTRA is not set
+# CONFIG_NETSTAT is not set
+# CONFIG_FEATURE_NETSTAT_WIDE is not set
+# CONFIG_FEATURE_NETSTAT_PRG is not set
+# CONFIG_NSLOOKUP is not set
+# CONFIG_NTPD is not set
+# CONFIG_FEATURE_NTPD_SERVER is not set
+CONFIG_PING=y
+# CONFIG_PING6 is not set
+CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_PSCAN is not set
+CONFIG_ROUTE=y
+# CONFIG_SLATTACH is not set
+CONFIG_TELNET=y
+CONFIG_FEATURE_TELNET_TTYPE=y
+CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+# CONFIG_TELNETD is not set
+# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
+CONFIG_TFTP=y
+# CONFIG_TFTPD is not set
+CONFIG_FEATURE_TFTP_GET=y
+CONFIG_FEATURE_TFTP_PUT=y
+CONFIG_FEATURE_TFTP_BLOCKSIZE=y
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
+# CONFIG_TFTP_DEBUG is not set
+CONFIG_TRACEROUTE=y
+# CONFIG_TRACEROUTE6 is not set
+# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
+# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
+# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
+CONFIG_UDHCPD=y
+# CONFIG_DHCPRELAY is not set
+# CONFIG_DUMPLEASES is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
+CONFIG_UDHCPC=y
+CONFIG_FEATURE_UDHCPC_ARPING=y
+# CONFIG_FEATURE_UDHCP_PORT is not set
+CONFIG_UDHCP_DEBUG=0
+# CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
+CONFIG_VCONFIG=y
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+# CONFIG_ZCIP is not set
+# CONFIG_TCPSVD is not set
+# CONFIG_TUNCTL is not set
+# CONFIG_FEATURE_TUNCTL_UG is not set
+# CONFIG_UDPSVD is not set
+
+#
+# Print Utilities
+#
+# CONFIG_LPD is not set
+# CONFIG_LPR is not set
+# CONFIG_LPQ is not set
+
+#
+# Mail Utilities
+#
+# CONFIG_MAKEMIME is not set
+CONFIG_FEATURE_MIME_CHARSET=""
+# CONFIG_POPMAILDIR is not set
+# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
+# CONFIG_REFORMIME is not set
+# CONFIG_FEATURE_REFORMIME_COMPAT is not set
+# CONFIG_SENDMAIL is not set
+
+#
+# Process Utilities
+#
+CONFIG_FREE=y
+CONFIG_FUSER=y
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+CONFIG_KILLALL5=y
+# CONFIG_NMETER is not set
+# CONFIG_PGREP is not set
+CONFIG_PIDOF=y
+CONFIG_FEATURE_PIDOF_SINGLE=y
+CONFIG_FEATURE_PIDOF_OMIT=y
+# CONFIG_PKILL is not set
+CONFIG_PS=y
+CONFIG_FEATURE_PS_WIDE=y
+# CONFIG_FEATURE_PS_TIME is not set
+# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
+# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
+CONFIG_RENICE=y
+CONFIG_BB_SYSCTL=y
+CONFIG_TOP=y
+CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
+CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
+# CONFIG_FEATURE_TOP_SMP_CPU is not set
+# CONFIG_FEATURE_TOP_DECIMALS is not set
+# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
+# CONFIG_FEATURE_TOPMEM is not set
+# CONFIG_FEATURE_SHOW_THREADS is not set
+CONFIG_UPTIME=y
+CONFIG_WATCH=y
+
+#
+# Runit Utilities
+#
+# CONFIG_RUNSV is not set
+# CONFIG_RUNSVDIR is not set
+# CONFIG_FEATURE_RUNSVDIR_LOG is not set
+# CONFIG_SV is not set
+CONFIG_SV_DEFAULT_SERVICE_DIR=""
+# CONFIG_SVLOGD is not set
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
+# CONFIG_CHCON is not set
+# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
+# CONFIG_GETENFORCE is not set
+# CONFIG_GETSEBOOL is not set
+# CONFIG_LOAD_POLICY is not set
+# CONFIG_MATCHPATHCON is not set
+# CONFIG_RESTORECON is not set
+# CONFIG_RUNCON is not set
+# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
+# CONFIG_SELINUXENABLED is not set
+# CONFIG_SETENFORCE is not set
+# CONFIG_SETFILES is not set
+# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
+# CONFIG_SETSEBOOL is not set
+# CONFIG_SESTATUS is not set
+
+#
+# Shells
+#
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+CONFIG_ASH=y
+CONFIG_ASH_BASH_COMPAT=y
+CONFIG_ASH_JOB_CONTROL=y
+CONFIG_ASH_ALIAS=y
+# CONFIG_ASH_GETOPTS is not set
+CONFIG_ASH_BUILTIN_ECHO=y
+CONFIG_ASH_BUILTIN_PRINTF=y
+CONFIG_ASH_BUILTIN_TEST=y
+CONFIG_ASH_CMDCMD=y
+# CONFIG_ASH_MAIL is not set
+CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
+CONFIG_ASH_RANDOM_SUPPORT=y
+CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_HUSH is not set
+# CONFIG_HUSH_BASH_COMPAT is not set
+# CONFIG_HUSH_HELP is not set
+# CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_JOB is not set
+# CONFIG_HUSH_TICK is not set
+# CONFIG_HUSH_IF is not set
+# CONFIG_HUSH_LOOPS is not set
+# CONFIG_HUSH_CASE is not set
+# CONFIG_HUSH_FUNCTIONS is not set
+# CONFIG_HUSH_LOCAL is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_RANDOM_SUPPORT is not set
+# CONFIG_LASH is not set
+# CONFIG_MSH is not set
+CONFIG_SH_MATH_SUPPORT=y
+# CONFIG_SH_MATH_SUPPORT_64 is not set
+CONFIG_FEATURE_SH_EXTRA_QUIET=y
+# CONFIG_FEATURE_SH_STANDALONE is not set
+# CONFIG_FEATURE_SH_NOFORK is not set
+# CONFIG_CTTYHACK is not set
+
+#
+# System Logging Utilities
+#
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+CONFIG_FEATURE_REMOTE_LOG=y
+# CONFIG_FEATURE_SYSLOGD_DUP is not set
+# CONFIG_FEATURE_IPC_SYSLOG is not set
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
+CONFIG_KLOGD=y
+CONFIG_LOGGER=y
diff --git a/target/device/pcengines/alix2d3/linux-2.6-alix2d3.config b/target/device/pcengines/alix2d3/linux-2.6-alix2d3.config
new file mode 100644
index 0000000..3040404
--- /dev/null
+++ b/target/device/pcengines/alix2d3/linux-2.6-alix2d3.config
@@ -0,0 +1,1601 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.34.1
+# Mon Jul 12 22:26:35 2010
+#
+# CONFIG_64BIT is not set
+CONFIG_X86_32=y
+# CONFIG_X86_64 is not set
+CONFIG_X86=y
+CONFIG_OUTPUT_FORMAT="elf32-i386"
+CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CMOS_UPDATE=y
+CONFIG_CLOCKSOURCE_WATCHDOG=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_MMU=y
+CONFIG_ZONE_DMA=y
+# CONFIG_NEED_DMA_MAP_STATE is not set
+CONFIG_GENERIC_ISA_DMA=y
+CONFIG_GENERIC_IOMAP=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_ARCH_MAY_HAVE_PC_FDC=y
+# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
+CONFIG_RWSEM_XCHGADD_ALGORITHM=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+# CONFIG_GENERIC_TIME_VSYSCALL is not set
+CONFIG_ARCH_HAS_CPU_RELAX=y
+CONFIG_ARCH_HAS_DEFAULT_IDLE=y
+CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
+CONFIG_HAVE_SETUP_PER_CPU_AREA=y
+CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
+CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
+# CONFIG_HAVE_CPUMASK_OF_CPU_MAP is not set
+CONFIG_ARCH_HIBERNATION_POSSIBLE=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+# CONFIG_ZONE_DMA32 is not set
+CONFIG_ARCH_POPULATES_NODE_MAP=y
+# CONFIG_AUDIT_ARCH is not set
+CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
+CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
+CONFIG_HAVE_EARLY_RES=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_X86_32_LAZY_GS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_LOCK_KERNEL=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION="-alix"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_BZIP2=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+# CONFIG_KERNEL_BZIP2 is not set
+CONFIG_KERNEL_LZMA=y
+# CONFIG_KERNEL_LZO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TREE_RCU=y
+# CONFIG_TREE_PREEMPT_RCU is not set
+# CONFIG_TINY_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+# CONFIG_KALLSYMS is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+# CONFIG_BUG is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_PCSPKR_PLATFORM is not set
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_HAVE_PERF_EVENTS=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+CONFIG_PCI_QUIRKS=y
+CONFIG_COMPAT_BRK=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
+CONFIG_SLOB=y
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
+CONFIG_HAVE_IOREMAP_PROT=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_OPTPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_HW_BREAKPOINT=y
+CONFIG_HAVE_USER_RETURN_NOTIFIER=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_DEADLINE=y
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="deadline"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_READ_UNLOCK is not set
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_WRITE_UNLOCK is not set
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+# CONFIG_FREEZER is not set
+
+#
+# Processor type and features
+#
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+# CONFIG_SMP is not set
+# CONFIG_SPARSE_IRQ is not set
+CONFIG_X86_MPPARSE=y
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+CONFIG_SCHED_OMIT_FRAME_POINTER=y
+# CONFIG_PARAVIRT_GUEST is not set
+CONFIG_NO_BOOTMEM=y
+# CONFIG_MEMTEST is not set
+# CONFIG_M386 is not set
+# CONFIG_M486 is not set
+# CONFIG_M586 is not set
+# CONFIG_M586TSC is not set
+# CONFIG_M586MMX is not set
+# CONFIG_M686 is not set
+# CONFIG_MPENTIUMII is not set
+# CONFIG_MPENTIUMIII is not set
+# CONFIG_MPENTIUMM is not set
+# CONFIG_MPENTIUM4 is not set
+# CONFIG_MK6 is not set
+# CONFIG_MK7 is not set
+# CONFIG_MK8 is not set
+# CONFIG_MCRUSOE is not set
+# CONFIG_MEFFICEON is not set
+# CONFIG_MWINCHIPC6 is not set
+# CONFIG_MWINCHIP3D is not set
+# CONFIG_MGEODEGX1 is not set
+CONFIG_MGEODE_LX=y
+# CONFIG_MCYRIXIII is not set
+# CONFIG_MVIAC3_2 is not set
+# CONFIG_MVIAC7 is not set
+# CONFIG_MPSC is not set
+# CONFIG_MCORE2 is not set
+# CONFIG_MATOM is not set
+# CONFIG_GENERIC_CPU is not set
+# CONFIG_X86_GENERIC is not set
+CONFIG_X86_CPU=y
+CONFIG_X86_INTERNODE_CACHE_SHIFT=5
+CONFIG_X86_CMPXCHG=y
+CONFIG_X86_L1_CACHE_SHIFT=5
+CONFIG_X86_XADD=y
+CONFIG_X86_WP_WORKS_OK=y
+CONFIG_X86_INVLPG=y
+CONFIG_X86_BSWAP=y
+CONFIG_X86_POPAD_OK=y
+CONFIG_X86_USE_PPRO_CHECKSUM=y
+CONFIG_X86_USE_3DNOW=y
+CONFIG_X86_TSC=y
+CONFIG_X86_CMOV=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=4
+CONFIG_X86_DEBUGCTLMSR=y
+# CONFIG_PROCESSOR_SELECT is not set
+CONFIG_CPU_SUP_INTEL=y
+CONFIG_CPU_SUP_CYRIX_32=y
+CONFIG_CPU_SUP_AMD=y
+CONFIG_CPU_SUP_CENTAUR=y
+CONFIG_CPU_SUP_TRANSMETA_32=y
+CONFIG_CPU_SUP_UMC_32=y
+# CONFIG_X86_DS is not set
+# CONFIG_HPET_TIMER is not set
+CONFIG_DMI=y
+# CONFIG_IOMMU_HELPER is not set
+# CONFIG_IOMMU_API is not set
+CONFIG_NR_CPUS=1
+# CONFIG_PREEMPT_NONE is not set
+# CONFIG_PREEMPT_VOLUNTARY is not set
+CONFIG_PREEMPT=y
+CONFIG_X86_UP_APIC=y
+CONFIG_X86_UP_IOAPIC=y
+CONFIG_X86_LOCAL_APIC=y
+CONFIG_X86_IO_APIC=y
+# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
+# CONFIG_X86_MCE is not set
+# CONFIG_VM86 is not set
+# CONFIG_TOSHIBA is not set
+# CONFIG_I8K is not set
+# CONFIG_X86_REBOOTFIXUPS is not set
+# CONFIG_MICROCODE is not set
+CONFIG_X86_MSR=m
+CONFIG_X86_CPUID=m
+CONFIG_NOHIGHMEM=y
+# CONFIG_HIGHMEM4G is not set
+# CONFIG_HIGHMEM64G is not set
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_3G_OPT is not set
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_2G_OPT is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_X86_PAE is not set
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ARCH_FLATMEM_ENABLE=y
+CONFIG_ARCH_SPARSEMEM_ENABLE=y
+CONFIG_ARCH_SELECT_MEMORY_MODEL=y
+CONFIG_ILLEGAL_POINTER_VALUE=0
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_SPARSEMEM_STATIC=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=1
+CONFIG_BOUNCE=y
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
+# CONFIG_X86_RESERVE_LOW_64K is not set
+# CONFIG_MATH_EMULATION is not set
+# CONFIG_MTRR is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+CONFIG_HZ_100=y
+# CONFIG_HZ_250 is not set
+# CONFIG_HZ_300 is not set
+# CONFIG_HZ_1000 is not set
+CONFIG_HZ=100
+# CONFIG_SCHED_HRTICK is not set
+# CONFIG_KEXEC is not set
+CONFIG_PHYSICAL_START=0x100000
+# CONFIG_RELOCATABLE is not set
+CONFIG_PHYSICAL_ALIGN=0x100000
+# CONFIG_COMPAT_VDSO is not set
+# CONFIG_CMDLINE_BOOL is not set
+
+#
+# Power management and ACPI options
+#
+# CONFIG_PM is not set
+# CONFIG_SFI is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+
+#
+# Bus options (PCI etc.)
+#
+CONFIG_PCI=y
+# CONFIG_PCI_GOBIOS is not set
+# CONFIG_PCI_GOMMCONFIG is not set
+# CONFIG_PCI_GODIRECT is not set
+# CONFIG_PCI_GOOLPC is not set
+CONFIG_PCI_GOANY=y
+CONFIG_PCI_BIOS=y
+CONFIG_PCI_DIRECT=y
+CONFIG_PCI_DOMAINS=y
+# CONFIG_PCIEPORTBUS is not set
+CONFIG_ARCH_SUPPORTS_MSI=y
+# CONFIG_PCI_MSI is not set
+# CONFIG_PCI_STUB is not set
+CONFIG_HT_IRQ=y
+# CONFIG_PCI_IOV is not set
+CONFIG_ISA_DMA_API=y
+# CONFIG_ISA is not set
+# CONFIG_MCA is not set
+CONFIG_SCx200=m
+CONFIG_SCx200HR_TIMER=m
+# CONFIG_OLPC is not set
+CONFIG_K8_NB=y
+# CONFIG_PCCARD is not set
+# CONFIG_HOTPLUG_PCI is not set
+
+#
+# Executable file formats / Emulations
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+CONFIG_HAVE_ATOMIC_IOMAP=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=m
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
+CONFIG_NET_KEY=m
+# CONFIG_NET_KEY_MIGRATE is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_ASK_IP_FIB_HASH=y
+# CONFIG_IP_FIB_TRIE is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+# CONFIG_IP_ROUTE_VERBOSE is not set
+# CONFIG_IP_PNP is not set
+CONFIG_NET_IPIP=m
+CONFIG_NET_IPGRE=m
+# CONFIG_NET_IPGRE_BROADCAST is not set
+CONFIG_IP_MROUTE=y
+CONFIG_IP_PIMSM_V1=y
+CONFIG_IP_PIMSM_V2=y
+CONFIG_ARPD=y
+CONFIG_SYN_COOKIES=y
+CONFIG_INET_AH=m
+CONFIG_INET_ESP=m
+CONFIG_INET_IPCOMP=m
+CONFIG_INET_XFRM_TUNNEL=m
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+CONFIG_INET_LRO=y
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+CONFIG_BRIDGE_NETFILTER=y
+
+#
+# Core Netfilter Configuration
+#
+CONFIG_NETFILTER_NETLINK=m
+CONFIG_NETFILTER_NETLINK_QUEUE=m
+CONFIG_NETFILTER_NETLINK_LOG=m
+CONFIG_NF_CONNTRACK=m
+# CONFIG_NF_CT_ACCT is not set
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+# CONFIG_NF_CONNTRACK_FTP is not set
+# CONFIG_NF_CONNTRACK_H323 is not set
+# CONFIG_NF_CONNTRACK_IRC is not set
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+# CONFIG_NF_CONNTRACK_SIP is not set
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_CT is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_HL=m
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+CONFIG_NETFILTER_XT_TARGET_MARK=m
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
+# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+CONFIG_NETFILTER_XT_MATCH_COMMENT=m
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+CONFIG_NETFILTER_XT_MATCH_DCCP=m
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+CONFIG_NETFILTER_XT_MATCH_ESP=m
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+CONFIG_NETFILTER_XT_MATCH_HL=m
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+CONFIG_NETFILTER_XT_MATCH_LENGTH=m
+CONFIG_NETFILTER_XT_MATCH_LIMIT=m
+CONFIG_NETFILTER_XT_MATCH_MAC=m
+CONFIG_NETFILTER_XT_MATCH_MARK=m
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+CONFIG_NETFILTER_XT_MATCH_POLICY=m
+# CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+CONFIG_NETFILTER_XT_MATCH_REALM=m
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+CONFIG_NETFILTER_XT_MATCH_SCTP=m
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+CONFIG_NETFILTER_XT_MATCH_STRING=m
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_NETFILTER_XT_MATCH_OSF is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+CONFIG_IP_NF_QUEUE=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_ADDRTYPE=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_LOG=m
+CONFIG_IP_NF_TARGET_ULOG=m
+CONFIG_NF_NAT=m
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_NF_NAT_SNMP_BASIC=m
+# CONFIG_NF_NAT_FTP is not set
+# CONFIG_NF_NAT_IRC is not set
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+# CONFIG_NF_NAT_H323 is not set
+# CONFIG_NF_NAT_SIP is not set
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+# CONFIG_BRIDGE_NF_EBTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+CONFIG_STP=m
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_IGMP_SNOOPING=y
+# CONFIG_NET_DSA is not set
+CONFIG_VLAN_8021Q=m
+# CONFIG_VLAN_8021Q_GVRP is not set
+# CONFIG_DECNET is not set
+CONFIG_LLC=m
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+CONFIG_NET_CLS_ROUTE=y
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_FIB_RULES=y
+CONFIG_WIRELESS=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+CONFIG_CFG80211_DEFAULT_PS=y
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+CONFIG_MAC80211_HAS_RC=y
+# CONFIG_MAC80211_RC_PID is not set
+CONFIG_MAC80211_RC_MINSTREL=y
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
+CONFIG_MAC80211_RC_DEFAULT="minstrel"
+# CONFIG_MAC80211_MESH is not set
+CONFIG_MAC80211_LEDS=y
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_FD is not set
+# CONFIG_BLK_CPQ_DA is not set
+# CONFIG_BLK_CPQ_CISS_DA is not set
+# CONFIG_BLK_DEV_DAC960 is not set
+# CONFIG_BLK_DEV_UMEM is not set
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=m
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_SX8 is not set
+# CONFIG_BLK_DEV_UB is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_BLK_DEV_HD is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+CONFIG_IDE=y
+
+#
+# Please see Documentation/ide/ide.txt for help/info on IDE drives
+#
+CONFIG_IDE_XFER_MODE=y
+# CONFIG_BLK_DEV_IDE_SATA is not set
+CONFIG_IDE_GD=y
+CONFIG_IDE_GD_ATA=y
+# CONFIG_IDE_GD_ATAPI is not set
+# CONFIG_BLK_DEV_IDECD is not set
+# CONFIG_BLK_DEV_IDETAPE is not set
+# CONFIG_IDE_TASK_IOCTL is not set
+# CONFIG_IDE_PROC_FS is not set
+
+#
+# IDE chipset support/bugfixes
+#
+# CONFIG_IDE_GENERIC is not set
+# CONFIG_BLK_DEV_PLATFORM is not set
+# CONFIG_BLK_DEV_CMD640 is not set
+CONFIG_BLK_DEV_IDEDMA_SFF=y
+
+#
+# PCI IDE chipsets support
+#
+CONFIG_BLK_DEV_IDEPCI=y
+# CONFIG_IDEPCI_PCIBUS_ORDER is not set
+# CONFIG_BLK_DEV_GENERIC is not set
+# CONFIG_BLK_DEV_OPTI621 is not set
+# CONFIG_BLK_DEV_RZ1000 is not set
+CONFIG_BLK_DEV_IDEDMA_PCI=y
+# CONFIG_BLK_DEV_AEC62XX is not set
+# CONFIG_BLK_DEV_ALI15X3 is not set
+# CONFIG_BLK_DEV_AMD74XX is not set
+# CONFIG_BLK_DEV_ATIIXP is not set
+# CONFIG_BLK_DEV_CMD64X is not set
+# CONFIG_BLK_DEV_TRIFLEX is not set
+# CONFIG_BLK_DEV_CS5520 is not set
+# CONFIG_BLK_DEV_CS5530 is not set
+# CONFIG_BLK_DEV_CS5535 is not set
+CONFIG_BLK_DEV_CS5536=y
+# CONFIG_BLK_DEV_HPT366 is not set
+# CONFIG_BLK_DEV_JMICRON is not set
+# CONFIG_BLK_DEV_SC1200 is not set
+# CONFIG_BLK_DEV_PIIX is not set
+# CONFIG_BLK_DEV_IT8172 is not set
+# CONFIG_BLK_DEV_IT8213 is not set
+# CONFIG_BLK_DEV_IT821X is not set
+# CONFIG_BLK_DEV_NS87415 is not set
+# CONFIG_BLK_DEV_PDC202XX_OLD is not set
+# CONFIG_BLK_DEV_PDC202XX_NEW is not set
+# CONFIG_BLK_DEV_SVWKS is not set
+# CONFIG_BLK_DEV_SIIMAGE is not set
+# CONFIG_BLK_DEV_SIS5513 is not set
+# CONFIG_BLK_DEV_SLC90E66 is not set
+# CONFIG_BLK_DEV_TRM290 is not set
+# CONFIG_BLK_DEV_VIA82CXXX is not set
+# CONFIG_BLK_DEV_TC86C001 is not set
+CONFIG_BLK_DEV_IDEDMA=y
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+# CONFIG_FUSION is not set
+
+#
+# IEEE 1394 (FireWire) support
+#
+
+#
+# You can enable one or both FireWire driver stacks.
+#
+
+#
+# The newer stack is recommended.
+#
+# CONFIG_FIREWIRE is not set
+# CONFIG_IEEE1394 is not set
+# CONFIG_I2O is not set
+# CONFIG_MACINTOSH_DRIVERS is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_HAPPYMEAL is not set
+# CONFIG_SUNGEM is not set
+# CONFIG_CASSINI is not set
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_ETHOC is not set
+# CONFIG_DNET is not set
+# CONFIG_NET_TULIP is not set
+# CONFIG_HP100 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+CONFIG_NET_PCI=y
+# CONFIG_PCNET32 is not set
+# CONFIG_AMD8111_ETH is not set
+# CONFIG_ADAPTEC_STARFIRE is not set
+# CONFIG_KSZ884X_PCI is not set
+# CONFIG_B44 is not set
+# CONFIG_FORCEDETH is not set
+# CONFIG_E100 is not set
+# CONFIG_FEALNX is not set
+# CONFIG_NATSEMI is not set
+# CONFIG_NE2K_PCI is not set
+# CONFIG_8139CP is not set
+# CONFIG_8139TOO is not set
+# CONFIG_R6040 is not set
+# CONFIG_SIS900 is not set
+# CONFIG_EPIC100 is not set
+# CONFIG_SMSC9420 is not set
+# CONFIG_SUNDANCE is not set
+# CONFIG_TLAN is not set
+# CONFIG_KS8842 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_VIA_RHINE=m
+CONFIG_VIA_RHINE_MMIO=y
+# CONFIG_SC92031 is not set
+# CONFIG_ATL2 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+# CONFIG_TR is not set
+CONFIG_WLAN=y
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_AIRO is not set
+# CONFIG_ATMEL is not set
+# CONFIG_AT76C50X_USB is not set
+# CONFIG_PRISM54 is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_USB_NET_RNDIS_WLAN is not set
+# CONFIG_RTL8180 is not set
+# CONFIG_RTL8187 is not set
+# CONFIG_ADM8211 is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_MWL8K is not set
+CONFIG_ATH_COMMON=m
+# CONFIG_ATH_DEBUG is not set
+CONFIG_ATH5K=m
+# CONFIG_ATH5K_DEBUG is not set
+# CONFIG_ATH9K is not set
+# CONFIG_AR9170_USB is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_IPW2100 is not set
+# CONFIG_IPW2200 is not set
+# CONFIG_IWLWIFI is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_HERMES is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_WL12XX is not set
+# CONFIG_ZD1211RW is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_USB_IPHETH is not set
+# CONFIG_WAN is not set
+# CONFIG_FDDI is not set
+# CONFIG_HIPPI is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_VMXNET3 is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+# CONFIG_INPUT is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_I8042=y
+CONFIG_SERIO_SERPORT=y
+# CONFIG_SERIO_CT82C710 is not set
+# CONFIG_SERIO_PCIPS2 is not set
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+# CONFIG_VT is not set
+# CONFIG_DEVKMEM is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_NOZOMI is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FIX_EARLYCON_MEM=y
+CONFIG_SERIAL_8250_PCI=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_JSM is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_HW_RANDOM_INTEL is not set
+# CONFIG_HW_RANDOM_AMD is not set
+CONFIG_HW_RANDOM_GEODE=m
+# CONFIG_HW_RANDOM_VIA is not set
+CONFIG_NVRAM=m
+# CONFIG_RTC is not set
+# CONFIG_GEN_RTC is not set
+# CONFIG_R3964 is not set
+# CONFIG_APPLICOM is not set
+# CONFIG_MWAVE is not set
+# CONFIG_SCx200_GPIO is not set
+# CONFIG_PC8736x_GPIO is not set
+# CONFIG_NSC_GPIO is not set
+CONFIG_CS5535_GPIO=m
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_HANGCHECK_TIMER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_TELCLOCK is not set
+CONFIG_DEVPORT=y
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# PC SMBus host controller drivers
+#
+# CONFIG_I2C_ALI1535 is not set
+# CONFIG_I2C_ALI1563 is not set
+# CONFIG_I2C_ALI15X3 is not set
+# CONFIG_I2C_AMD756 is not set
+# CONFIG_I2C_AMD8111 is not set
+# CONFIG_I2C_I801 is not set
+# CONFIG_I2C_ISCH is not set
+# CONFIG_I2C_PIIX4 is not set
+# CONFIG_I2C_NFORCE2 is not set
+# CONFIG_I2C_SIS5595 is not set
+# CONFIG_I2C_SIS630 is not set
+# CONFIG_I2C_SIS96X is not set
+# CONFIG_I2C_VIA is not set
+# CONFIG_I2C_VIAPRO is not set
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+CONFIG_SCx200_ACB=m
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_SPI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+# CONFIG_GPIO_IT8761E is not set
+# CONFIG_GPIO_SCH is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_ADP5588 is not set
+
+#
+# PCI GPIO expanders:
+#
+# CONFIG_GPIO_CS5535 is not set
+# CONFIG_GPIO_BT8XX is not set
+# CONFIG_GPIO_LANGWELL is not set
+
+#
+# SPI GPIO expanders:
+#
+
+#
+# AC97 GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_ACQUIRE_WDT is not set
+# CONFIG_ADVANTECH_WDT is not set
+# CONFIG_ALIM1535_WDT is not set
+# CONFIG_ALIM7101_WDT is not set
+# CONFIG_SC520_WDT is not set
+# CONFIG_SBC_FITPC2_WATCHDOG is not set
+# CONFIG_EUROTECH_WDT is not set
+# CONFIG_IB700_WDT is not set
+# CONFIG_IBMASR is not set
+# CONFIG_WAFER_WDT is not set
+# CONFIG_I6300ESB_WDT is not set
+# CONFIG_ITCO_WDT is not set
+# CONFIG_IT8712F_WDT is not set
+# CONFIG_IT87_WDT is not set
+# CONFIG_HP_WATCHDOG is not set
+# CONFIG_SC1200_WDT is not set
+# CONFIG_SCx200_WDT is not set
+# CONFIG_PC87413_WDT is not set
+# CONFIG_60XX_WDT is not set
+# CONFIG_SBC8360_WDT is not set
+# CONFIG_SBC7240_WDT is not set
+# CONFIG_CPU5_WDT is not set
+# CONFIG_SMSC_SCH311X_WDT is not set
+# CONFIG_SMSC37B787_WDT is not set
+# CONFIG_W83627HF_WDT is not set
+# CONFIG_W83697HF_WDT is not set
+# CONFIG_W83697UG_WDT is not set
+# CONFIG_W83877F_WDT is not set
+# CONFIG_W83977F_WDT is not set
+# CONFIG_MACHZ_WDT is not set
+# CONFIG_SBC_EPX_C3_WATCHDOG is not set
+
+#
+# PCI-based Watchdog Cards
+#
+# CONFIG_PCIPCWATCHDOG is not set
+# CONFIG_WDTPCI is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_AB3100_CORE is not set
+# CONFIG_MFD_TIMBERDALE is not set
+# CONFIG_LPC_SCH is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_AGP is not set
+CONFIG_VGA_ARB=y
+CONFIG_VGA_ARB_MAX_GPUS=16
+# CONFIG_DRM is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+# CONFIG_FB is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+# CONFIG_SOUND is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=m
+# CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=m
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+# CONFIG_USB_XHCI_HCD is not set
+CONFIG_USB_EHCI_HCD=m
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+CONFIG_USB_OHCI_HCD=m
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_UHCI_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_WHCI_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+
+#
+# Enable Host or Gadget support to see Inventra options
+#
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_GADGET is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_NOP_USB_XCEIV is not set
+# CONFIG_UWB is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=m
+
+#
+# LED drivers
+#
+CONFIG_LEDS_ALIX2=m
+# CONFIG_LEDS_GPIO is not set
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_CLEVO_MAIL is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_INTEL_SS4200 is not set
+# CONFIG_LEDS_LT3593 is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGER_TIMER is not set
+# CONFIG_LEDS_TRIGGER_IDE_DISK is not set
+# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_INFINIBAND is not set
+# CONFIG_EDAC is not set
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# TI VLYNQ
+#
+# CONFIG_STAGING is not set
+# CONFIG_X86_PLATFORM_DEVICES is not set
+
+#
+# Firmware Drivers
+#
+# CONFIG_EDD is not set
+# CONFIG_FIRMWARE_MEMMAP is not set
+# CONFIG_DELL_RBU is not set
+# CONFIG_DCDBAS is not set
+# CONFIG_DMIID is not set
+# CONFIG_ISCSI_IBFT_FIND is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+# CONFIG_EXT3_FS is not set
+# CONFIG_EXT4_FS is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=850
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLBFS is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-15"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+CONFIG_NLS_ISO8859_15=y
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=y
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_STRIP_ASM_SYMS=y
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_ARCH_WANT_FRAME_POINTERS=y
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_USER_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=y
+CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_HAVE_ARCH_KMEMCHECK=y
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_X86_VERBOSE_BOOTUP is not set
+# CONFIG_EARLY_PRINTK is not set
+# CONFIG_4KSTACKS is not set
+# CONFIG_DOUBLEFAULT is not set
+# CONFIG_IOMMU_STRESS is not set
+CONFIG_HAVE_MMIOTRACE_SUPPORT=y
+CONFIG_IO_DELAY_TYPE_0X80=0
+CONFIG_IO_DELAY_TYPE_0XED=1
+CONFIG_IO_DELAY_TYPE_UDELAY=2
+CONFIG_IO_DELAY_TYPE_NONE=3
+CONFIG_IO_DELAY_0X80=y
+# CONFIG_IO_DELAY_0XED is not set
+# CONFIG_IO_DELAY_UDELAY is not set
+# CONFIG_IO_DELAY_NONE is not set
+CONFIG_DEFAULT_IO_DELAY_TYPE=0
+# CONFIG_OPTIMIZE_INLINING is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_DEFAULT_SECURITY_SELINUX is not set
+# CONFIG_DEFAULT_SECURITY_SMACK is not set
+# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=y
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_CRC32C_INTEL is not set
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_TGR192=m
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+CONFIG_CRYPTO_AES_586=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+# CONFIG_CRYPTO_CAMELLIA is not set
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+CONFIG_CRYPTO_KHAZAD=m
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SALSA20_586 is not set
+# CONFIG_CRYPTO_SEED is not set
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
+# CONFIG_CRYPTO_TWOFISH_586 is not set
+
+#
+# Compression
+#
+CONFIG_CRYPTO_DEFLATE=m
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_CRYPTO_DEV_PADLOCK is not set
+CONFIG_CRYPTO_DEV_GEODE=m
+# CONFIG_CRYPTO_DEV_HIFN_795X is not set
+CONFIG_HAVE_KVM=y
+# CONFIG_VIRTUALIZATION is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_FIRST_BIT=y
+CONFIG_GENERIC_FIND_NEXT_BIT=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+CONFIG_CRC_CCITT=m
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+CONFIG_LIBCRC32C=m
+CONFIG_ZLIB_INFLATE=m
+CONFIG_ZLIB_DEFLATE=m
+CONFIG_TEXTSEARCH=y
+CONFIG_TEXTSEARCH_KMP=m
+CONFIG_TEXTSEARCH_BM=m
+CONFIG_TEXTSEARCH_FSM=m
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/target/device/pcengines/alix2d3/uclibc.config b/target/device/pcengines/alix2d3/uclibc.config
new file mode 100755
index 0000000..dcee09e
--- /dev/null
+++ b/target/device/pcengines/alix2d3/uclibc.config
@@ -0,0 +1,248 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.31
+# Thu Jul  8 00:12:46 2010
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+TARGET_i386=y
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="i386"
+FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_GENERIC_386 is not set
+# CONFIG_386 is not set
+# CONFIG_486 is not set
+CONFIG_586=y
+# CONFIG_586MMX is not set
+# CONFIG_686 is not set
+# CONFIG_PENTIUMII is not set
+# CONFIG_PENTIUMIII is not set
+# CONFIG_PENTIUM4 is not set
+# CONFIG_K6 is not set
+# CONFIG_K7 is not set
+# CONFIG_ELAN is not set
+# CONFIG_CRUSOE is not set
+# CONFIG_WINCHIPC6 is not set
+# CONFIG_WINCHIP2 is not set
+# CONFIG_CYRIXIII is not set
+# CONFIG_NEHEMIAH is not set
+TARGET_SUBARCH=""
+
+#
+# Using ELF file format
+#
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+# DO_XSI_MATH is not set
+# UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+KERNEL_HEADERS="/usr/src/linux/include"
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+DOPIC=y
+# ARCH_HAS_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+HAVE_SHARED=y
+FORCE_SHAREABLE_TEXT_SEGMENTS=y
+LDSO_LDD_SUPPORT=y
+# LDSO_CACHE_SUPPORT is not set
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+# UCLIBC_STATIC_LDCONFIG is not set
+LDSO_RUNPATH=y
+LDSO_SEARCH_INTERP_PATH=y
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+LINUXTHREADS_OLD=y
+# LINUXTHREADS_NEW is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+UCLIBC_SUSV3_LEGACY=y
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+# UCLIBC_SUSV4_LEGACY is not set
+# UCLIBC_HAS_STUBS is not set
+UCLIBC_HAS_SHADOW=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PTY=y
+ASSUME_DEVPTS=y
+UNIX98PTY_ONLY=y
+# UCLIBC_HAS_GETPT is not set
+# UCLIBC_HAS_LIBUTIL is not set
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Support various families of functions
+#
+UCLIBC_LINUX_MODULE_24=y
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_BSD_ERR=y
+# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
+# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
+# UCLIBC_NTP_LEGACY is not set
+# UCLIBC_SV4_DEPRECATED is not set
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_EPOLL=y
+UCLIBC_HAS_XATTR=y
+UCLIBC_HAS_PROFILING=y
+UCLIBC_HAS_CRYPT_IMPL=y
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+UCLIBC_USE_NETLINK=y
+# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_HAS_COMPAT_RES_STATE=y
+# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+# UCLIBC_HAS_LIBRESOLV_STUB is not set
+# UCLIBC_HAS_LIBNSL_STUB is not set
+
+#
+# String and Stdio Support
+#
+# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+# UCLIBC_HAS_STRING_ARCH_OPT is not set
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+# UCLIBC_HAS_CTYPE_CHECKED is not set
+UCLIBC_HAS_CTYPE_ENFORCED=y
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+# USE_OLD_VFPRINTF is not set
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+# UCLIBC_HAS_STDIO_GETC_MACRO is not set
+# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+# UCLIBC_HAS_GNU_GETSUBOPT is not set
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+# UCLIBC_HAS_REGEX_OLD is not set
+UCLIBC_HAS_FNMATCH=y
+# UCLIBC_HAS_FNMATCH_OLD is not set
+# UCLIBC_HAS_WORDEXP is not set
+# UCLIBC_HAS_NFTW is not set
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
+
+#
+# Library Installation Options
+#
+RUNTIME_PREFIX="/"
+DEVEL_PREFIX="/usr/"
+MULTILIB_DIR="lib"
+HARDWIRED_ABSPATH=y
+
+#
+# Security options
+#
+# UCLIBC_BUILD_PIE is not set
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+UCLIBC_BUILD_RELRO=y
+UCLIBC_BUILD_NOW=y
+UCLIBC_BUILD_NOEXECSTACK=y
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=y
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
