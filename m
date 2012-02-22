From: Tobias Arp <tobiasarp@web.de>
Date: Wed, 22 Feb 2012 13:16:24 +0100 (CET)
Subject: [Buildroot] (no subject)
Message-ID: <2065772209.2770324.1329912984836.JavaMail.fmail@mwmweb054>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i am trying to use buildroot-2012.02-rc2 with the attached config file for an arm
processor. My custom toolchain was build with crosstool-NG with this config:

arm-unknown-linux-gnueabi
kernel-headers: linux 3.0
binutils 2.19.1
gcc 4.3.2
glibc 2.9

But when udev should be linked i get following error messages:

src/src_udevd-udev-ctrl.o: In function `udev_ctrl_get_connection':
udev-ctrl.c:(.text+0x744): undefined reference to `accept4'
collect2: ld returned 1 exit status
src/src_udevadm-udev-ctrl.o: In function `udev_ctrl_get_connection':
udev-ctrl.c:(.text+0x744): undefined reference to `accept4'
collect2: ld returned 1 exit status

I do not understand why this happens because accept4 does exist (in the toolchain kernel header files) and in the target kernel header file (kernel 3.2).

I have seen the older messages about this issue but i cannot solve it.

Best regards and thanks in advance

Tobias


#
# Automatically generated make config: don't edit
# Buildroot 2012.02-rc2 Configuration
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
BR2_arm920t=y
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set

#
# cortex-A8/A9 needs gcc >= 4.4.x
#
# BR2_cortex_a8 is not set
# BR2_cortex_a9 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="aapcs-linux"

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_LOCALFILES="cp"
BR2_SCP="scp"
BR2_SSH="ssh"
BR2_HG="hg"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=2
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
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_CTNG is not set
# BR2_KERNEL_HEADERS_2_6_35 is not set
# BR2_KERNEL_HEADERS_2_6_36 is not set
# BR2_KERNEL_HEADERS_2_6_37 is not set
# BR2_KERNEL_HEADERS_2_6_38 is not set
# BR2_KERNEL_HEADERS_2_6_39 is not set
# BR2_KERNEL_HEADERS_3_0 is not set
# BR2_KERNEL_HEADERS_3_1 is not set
# BR2_KERNEL_HEADERS_3_2 is not set
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
# BR2_UCLIBC_VERSION_0_9_31 is not set
# BR2_UCLIBC_VERSION_0_9_32 is not set
# BR2_UCLIBC_VERSION_0_9_33 is not set
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
# BR2_BINUTILS_VERSION_2_20 is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
# BR2_BINUTILS_VERSION_2_21 is not set
# BR2_BINUTILS_VERSION_2_21_1 is not set
# BR2_BINUTILS_VERSION_2_22 is not set
# BR2_GCC_VERSION_4_3_X is not set
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_4_5_X is not set
# BR2_GCC_VERSION_4_6_X is not set
# BR2_GCC_VERSION_SNAP is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1 is not set
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/tobias/entwicklung/arm/compiler/4.3.2"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_CXX is not set
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""
# BR2_TOOLCHAIN_CTNG_uClibc is not set
# BR2_TOOLCHAIN_CTNG_eglibc is not set
# BR2_TOOLCHAIN_CTNG_glibc is not set
# BR2_TOOLCHAIN_CTNG_THREADS_NONE is not set
# BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS is not set
# BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD is not set
# BR2_TOOLCHAIN_CTNG_THREADS_NPTL is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_ENABLE_LOCALE=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
# BR2_PTHREADS_NATIVE is not set

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="camdisc"
BR2_TARGET_GENERIC_ISSUE="Welcome to CamDisc"
# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
BR2_TARGET_GENERIC_GETTY_PORT="ttyAM1"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_18_X is not set
BR2_BUSYBOX_VERSION_1_19_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.19.4"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.19.x.config"
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
# BR2_PACKAGE_LIBPLAYER is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set

#
# Live555 needs C++ compiler
#
# BR2_PACKAGE_MADPLAY is not set

#
# mpd requires a toolchain with C++ and WCHAR support
#
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_PULSEAUDIO is not set
# BR2_PACKAGE_SPEEX is not set

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

#
# bonnie++ requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DSTAT is not set
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
# BR2_PACKAGE_RT_TESTS is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_WHETSTONE is not set
# BR2_PACKAGE_PV is not set

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
# BR2_PACKAGE_FLEX is not set
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
# BR2_PACKAGE_EFL is not set

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
# BR2_PACKAGE_VALA is not set

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

#
# gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled
#
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
# BR2_PACKAGE_LINUX_FIRMWARE is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LSUIO is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set
BR2_PACKAGE_NTFS_3G=y
# BR2_PACKAGE_NTFS_3G_ENCRYPTED is not set
BR2_PACKAGE_NTFS_3G_NTFSPROGS=y
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set
# BR2_PACKAGE_PCIUTILS is not set
BR2_PACKAGE_PICOCOM=y
# BR2_PACKAGE_RNG_TOOLS is not set
# BR2_PACKAGE_SANE_BACKENDS is not set
# BR2_PACKAGE_SDPARM is not set
BR2_PACKAGE_SETSERIAL=y

#
# smartmontools requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SREDIRD is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_STATSERIAL is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_TI_UTILS is not set
# BR2_PACKAGE_UBOOT_TOOLS is not set
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_UDEV_RULES_GEN=y
# BR2_PACKAGE_UDEV_ALL_EXTRAS is not set
# BR2_PACKAGE_UNIONFS is not set
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
# BR2_PACKAGE_GNUTLS is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBNSS is not set
# BR2_PACKAGE_OPENSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLCIPHER is not set
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
BR2_PACKAGE_LIBFUSE=y
# BR2_PACKAGE_LIBLOCKFILE is not set
BR2_PACKAGE_LIBSYSFS=y

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_IMLIB2 is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set
# BR2_PACKAGE_GDK_PIXBUF is not set

#
# libgtk2 requires a toolchain with WCHAR and C++ support
#
# BR2_PACKAGE_LIBPNG is not set

#
# libraw requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set

#
# opencv requires a toolchain with C++ and WCHAR support
#

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
# BR2_PACKAGE_LIBFTDI is not set
# BR2_PACKAGE_LIBHID is not set
# BR2_PACKAGE_LIBIQRF is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LIBV4L is not set

#
# Javascript
#
# BR2_PACKAGE_EXPLORERCANVAS is not set
# BR2_PACKAGE_FLOT is not set
# BR2_PACKAGE_JQUERY is not set
# BR2_PACKAGE_JQUERY_SPARKLINE is not set
# BR2_PACKAGE_JQUERY_VALIDATION is not set
# BR2_PACKAGE_JSMIN is not set

#
# Networking
#
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBESMTP is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBOAUTH is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBMNL is not set
# BR2_PACKAGE_LIBMODBUS is not set
# BR2_PACKAGE_LIBMBUS is not set
# BR2_PACKAGE_LIBNL is not set
BR2_PACKAGE_LIBPCAP=y
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LIBVNCSERVER is not set

#
# Other
#
# BR2_PACKAGE_FFTW is not set
# BR2_PACKAGE_LIBARGTABLE2 is not set
# BR2_PACKAGE_ARGP_STANDALONE is not set
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBEV is not set
# BR2_PACKAGE_LIBFFI is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBICAL is not set
# BR2_PACKAGE_LIBNSPR is not set

#
# libsigc++ requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBURCU is not set
# BR2_PACKAGE_LTTNG_LIBUST is not set
# BR2_PACKAGE_ORC is not set

#
# poco requires a toolchain with WCHAR and C++ support
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
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# JSON/XML
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_JSON_C is not set
# BR2_PACKAGE_LIBROXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set

#
# xerces-c++ requires a toolchain with C++ and WCHAR support enabled
#
# BR2_PACKAGE_YAJL is not set

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
# BR2_PACKAGE_BLUEZ_UTILS is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CAN_UTILS is not set
# BR2_PACKAGE_CONNMAN is not set

#
# ctorrent requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_CIFS_UTILS is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_EBTABLES is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HOSTAPD is not set

#
# iperf requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPSET is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set

#
# Kismet requires a toolchain with C++ support enabled
#
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
# BR2_PACKAGE_NETWORK_MANAGER is not set
# BR2_PACKAGE_NOIP is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
BR2_PACKAGE_PPPD=y
BR2_PACKAGE_PPPD_FILTER=y
# BR2_PACKAGE_PPPD_RADIUS is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_RSH_REDONE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set

#
# Squid requires a toolchain with C++ and IPv6 support enabled
#
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TRANSMISSION is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set
# BR2_PACKAGE_XL2TP is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set

#
# Real-Time
#
# BR2_PACKAGE_XENOMAI is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_INOTIFY_TOOLS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#
# BR2_PACKAGE_ACL is not set
# BR2_PACKAGE_ATTR is not set
# BR2_PACKAGE_HTOP is not set
BR2_PACKAGE_KMOD=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
# BR2_PACKAGE_UTIL_LINUX_FSCK is not set
# BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is not set
BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
BR2_PACKAGE_UTIL_LINUX_UUIDD=y
BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
# BR2_PACKAGE_UTIL_LINUX_AGETTY is not set
# BR2_PACKAGE_UTIL_LINUX_CRAMFS is not set
# BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT is not set
# BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT is not set
# BR2_PACKAGE_UTIL_LINUX_FALLOCATE is not set
# BR2_PACKAGE_UTIL_LINUX_UNSHARE is not set
# BR2_PACKAGE_UTIL_LINUX_RENAME is not set
# BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS is not set
# BR2_PACKAGE_UTIL_LINUX_WALL is not set
# BR2_PACKAGE_UTIL_LINUX_PARTX is not set
# BR2_PACKAGE_UTIL_LINUX_ARCH is not set
# BR2_PACKAGE_UTIL_LINUX_INIT is not set
# BR2_PACKAGE_UTIL_LINUX_KILL is not set
# BR2_PACKAGE_UTIL_LINUX_LAST is not set
# BR2_PACKAGE_UTIL_LINUX_MESG is not set
# BR2_PACKAGE_UTIL_LINUX_RAW is not set
# BR2_PACKAGE_UTIL_LINUX_RESET is not set
# BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS is not set
# BR2_PACKAGE_UTIL_LINUX_WRITE is not set

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set

#
# Host utilities
#
# BR2_PACKAGE_HOST_OPENOCD is not set
# BR2_PACKAGE_HOST_SAM_BA is not set
# BR2_PACKAGE_HOST_UBOOT_TOOLS is not set

#
# Filesystem images
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
# BR2_TARGET_ROOTFS_EXT2_NONE is not set
BR2_TARGET_ROOTFS_EXT2_GZIP=y
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
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

#
# Kernel
#
# BR2_LINUX_KERNEL is not set









___________________________________________________________
Ihr WEB.DE Postfach immer dabei: die kostenlose WEB.DE Mail App f?r iPhone und Android.
https://produkte.web.de/freemail_mobile_startseite/
