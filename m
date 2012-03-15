From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 15 Mar 2012 01:51:47 +0100
Subject: [Buildroot] Curl : Segmentation Fault
In-Reply-To: <20120314202240.6e90ba86@skate>
References: <54A0F0B594484527AFD52D676121CFAF@JohanW7>
 <20120314202240.6e90ba86@skate>
Message-ID: <0DE4C824AF494821A7CBD6732C85F0A6@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi 

Thanks for reply, i am getting desperate..

I am using ARM9 (AT91SAM9260 )

First libsoup causing problems, and when trying to switch to curl something else bites me...

Should i do a rebuild with strip disabled ?
Should i build a gdb for my target ?

I tried remote cross debugging with gdbserver but even that causes trouble : debugging a trivial 'Hello world' world using
uclibc-0.9.33 fails. 
(breakpoints are just ignored. I don't have that with the 0.9.32)


Here are my buildroot config and my uclibc config:

#
# Automatically generated make config: don't edit
# Buildroot 2012.02 Configuration
#
BR2_HAVE_DOT_CONFIG=y
BR2_CONFIG_NAME="sms_001"
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
BR2_generic_arm=y
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
# BR2_cortex_a8 is not set
# BR2_cortex_a9 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="GENERIC_ARM"
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
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
BR2_DEPRECATED=y
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
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_CTNG is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_32 is not set
# BR2_KERNEL_HEADERS_2_6_33 is not set
# BR2_KERNEL_HEADERS_2_6_34 is not set
# BR2_KERNEL_HEADERS_2_6_35 is not set
# BR2_KERNEL_HEADERS_2_6_36 is not set
# BR2_KERNEL_HEADERS_2_6_37 is not set
# BR2_KERNEL_HEADERS_2_6_38 is not set
# BR2_KERNEL_HEADERS_2_6_39 is not set
# BR2_KERNEL_HEADERS_3_0 is not set
# BR2_KERNEL_HEADERS_3_1 is not set
# BR2_KERNEL_HEADERS_3_2 is not set
BR2_KERNEL_HEADERS_VERSION=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_VERSION="2.6.36"
BR2_DEFAULT_KERNEL_HEADERS="2.6.36"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_30 is not set
# BR2_UCLIBC_VERSION_0_9_31 is not set
# BR2_UCLIBC_VERSION_0_9_32 is not set
# BR2_UCLIBC_VERSION_0_9_32_1 is not set
BR2_UCLIBC_VERSION_0_9_33=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.33"
BR2_UCLIBC_CONFIG="board/Apex/msi_001/uclibc-0.9.33.config"
BR2_PTHREAD_DEBUG=y
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_20 is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
# BR2_BINUTILS_VERSION_2_21 is not set
# BR2_BINUTILS_VERSION_2_21_1 is not set
BR2_BINUTILS_VERSION_2_22=y
BR2_BINUTILS_VERSION="2.22"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_3_X is not set
# BR2_GCC_VERSION_4_4_X is not set
BR2_GCC_VERSION_4_5_X=y
# BR2_GCC_VERSION_4_6_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.5.3"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y
# BR2_GCC_ENABLE_OPENMP is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
# BR2_GDB_VERSION_6_8 is not set
# BR2_GDB_VERSION_7_0_1 is not set
# BR2_GDB_VERSION_7_1 is not set
# BR2_GDB_VERSION_7_2 is not set
# BR2_GDB_VERSION_7_3 is not set
BR2_GDB_VERSION_7_4=y
BR2_GDB_VERSION="7.4"
BR2_LARGEFILE=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""

#
# Toolchain Options
#
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
# BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 is not set
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
# BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
BR2_TOOLCHAIN_BUILDROOT_CXX=y
# BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_ELF2FLT is not set

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="sms_001"
BR2_TARGET_GENERIC_ISSUE="Apex SMS_001"
# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_ROOTFS_DEVICE_TABLE="board/Apex/msi_001/device_table.txt"
# BR2_ROOTFS_SKELETON_DEFAULT is not set
BR2_ROOTFS_SKELETON_CUSTOM=y
BR2_ROOTFS_SKELETON_CUSTOM_PATH="board/Apex/msi_001/target_skeletonSMS"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/post.sh"

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_15_X is not set
# BR2_BUSYBOX_VERSION_1_16_X is not set
# BR2_BUSYBOX_VERSION_1_17_X is not set
# BR2_BUSYBOX_VERSION_1_18_X is not set
BR2_BUSYBOX_VERSION_1_19_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.19.4"
BR2_PACKAGE_BUSYBOX_CONFIG="board/Apex/msi_001/busybox-1.19.3.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
# BR2_PACKAGE_CUSTOMIZE is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_ALSA_UTILS is not set
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FAAD2 is not set
# BR2_PACKAGE_FLAC is not set

#
# ffmpeg requires a toolchain with LARGEFILE and IPV6 support
#
# BR2_PACKAGE_GSTREAMER is not set

#
# gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support
#
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
# BR2_PACKAGE_LIVE555 is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPD is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_PULSEAUDIO is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_VORBIS_TOOLS is not set
# BR2_PACKAGE_WAVPACK is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_GZIP is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_BONNIE is not set
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DSTAT is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LMBENCH is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP_TESTSUITE is not set
# BR2_PACKAGE_LTTNG_MODULES is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
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
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set

#
# gcc needs development files in target filesystem
#
BR2_PACKAGE_GETTEXT=y
# BR2_PACKAGE_GETTEXT_STATIC is not set
BR2_PACKAGE_LIBINTL=y
# BR2_PACKAGE_GMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_MPC is not set
# BR2_PACKAGE_MPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_SED is not set
# BR2_PACKAGE_SSTRIP is not set
# BR2_PACKAGE_TAR is not set

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
BR2_PACKAGE_RRDTOOL=y

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set
# BR2_PACKAGE_FBSET is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#
# BR2_PACKAGE_EFL is not set
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
# BR2_PACKAGE_VALA is not set

#
# Hardware handling
#
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_CRAMFS is not set
BR2_PACKAGE_DBUS=y
# BR2_DBUS_EXPAT is not set
BR2_DBUS_LIBXML2=y
# BR2_PACKAGE_DBUS_GLIB is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GDISK is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HDPARM is not set
BR2_PACKAGE_HWDATA=y
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
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PICOCOM is not set
# BR2_PACKAGE_RNG_TOOLS is not set
# BR2_PACKAGE_SANE_BACKENDS is not set
# BR2_PACKAGE_SDPARM is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SQUASHFS3 is not set
# BR2_PACKAGE_SREDIRD is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_STATSERIAL is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_TI_UTILS is not set
BR2_PACKAGE_UBOOT_TOOLS=y
# BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE is not set
BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV=y
BR2_PACKAGE_UDEV=y
# BR2_PACKAGE_UDEV_RULES_GEN is not set
BR2_PACKAGE_UDEV_ALL_EXTRAS=y
# BR2_PACKAGE_UNIONFS is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
# BR2_PACKAGE_USBUTILS_ZLIB is not set
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
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENSSL_OCF is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
BR2_PACKAGE_MYSQL_CLIENT=y
# BR2_PACKAGE_SQLCIPHER is not set
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
BR2_PACKAGE_LIBLOCKFILE=y
# BR2_PACKAGE_LIBSYSFS is not set

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
BR2_PACKAGE_FREETYPE=y
# BR2_PACKAGE_IMLIB2 is not set
BR2_PACKAGE_JPEG=y
BR2_PACKAGE_LIBART=y
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set
# BR2_PACKAGE_GDK_PIXBUF is not set
BR2_PACKAGE_LIBPNG=y
# BR2_PACKAGE_LIBRAW is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_OPENCV is not set
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
BR2_PACKAGE_LIBFTDI=y
# BR2_PACKAGE_LIBTFDI_CPP is not set
BR2_PACKAGE_LIBHID=y
# BR2_PACKAGE_LIBIQRF is not set
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y
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
BR2_PACKAGE_LIBCGI=y
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
BR2_PACKAGE_LIBESMTP=y
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBOAUTH is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBMNL is not set
# BR2_PACKAGE_LIBMODBUS is not set
# BR2_PACKAGE_LIBMBUS is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBMAIL is not set
# BR2_PACKAGE_MAILUTILS is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
BR2_PACKAGE_LIBSOUP=y
# BR2_PACKAGE_LIBSOUP_SSL is not set
BR2_PACKAGE_LIBUPNP=y
# BR2_PACKAGE_LIBVNCSERVER is not set

#
# Other
#
# BR2_PACKAGE_FFTW is not set
# BR2_PACKAGE_LIBARGTABLE2 is not set
# BR2_PACKAGE_ARGP_STANDALONE is not set
# BR2_PACKAGE_BOOST is not set
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
BR2_PACKAGE_LIBDAEMON=y
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBEV is not set
BR2_PACKAGE_LIBFFI=y
BR2_PACKAGE_LIBGLIB2=y
# BR2_PACKAGE_LIBICAL is not set
# BR2_PACKAGE_LIBGSL is not set
# BR2_PACKAGE_LIBNSPR is not set
# BR2_PACKAGE_LIBSIGC is not set
# BR2_PACKAGE_LIBURCU is not set
# BR2_PACKAGE_LTTNG_LIBUST is not set
# BR2_PACKAGE_ORC is not set
# BR2_PACKAGE_POCO is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
BR2_PACKAGE_READLINE=y
# BR2_PACKAGE_SLANG is not set

#
# JSON/XML
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_JSON_C is not set
# BR2_PACKAGE_LIBROXML is not set
BR2_PACKAGE_LIBXML2=y
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set
# BR2_PACKAGE_XERCES is not set
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
# BR2_PACKAGE_BOA is not set

#
# bmon requires a toolchain with IPv6 support
#
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CAN_UTILS is not set

#
# connman needs a toolchain with resolver support
#
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CIFS_UTILS is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set

#
# ebtables requires a toolchain with IPv6 support
#
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_INADYN is not set
BR2_PACKAGE_EZIPUPDATE=y
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IGH_ETHERCAT is not set
# BR2_PACKAGE_IPERF is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPSET is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MII_DIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NETCAT is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# NetworkManager requires a toolchain with IPV6, LARGEFILE and WCHAR support
#
# BR2_PACKAGE_NOIP is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set

#
# olsr requires a toolchain with IPv6 support
#
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENVPN is not set
BR2_PACKAGE_PORTMAP=y
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set

#
# radvd requires a toolchain with IPV6 support
#
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
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set

#
# Transmission requires a toolchain with IPv6 support
#
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set
# BR2_PACKAGE_XL2TP is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set

#
# rpm requires libneon with SSL, XML and ZLIB support
#

#
# Real-Time
#
# BR2_PACKAGE_XENOMAI is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BASH is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_INOTIFY_TOOLS is not set
BR2_PACKAGE_LOCKFILE_PROGS=y
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_WHICH is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#
BR2_PACKAGE_ACL=y
BR2_PACKAGE_ATTR=y
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_HTOP is not set
BR2_PACKAGE_KMOD=y
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_RSYSLOG is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
BR2_PACKAGE_UTIL_LINUX=y
# BR2_PACKAGE_UTIL_LINUX_MOUNT is not set
# BR2_PACKAGE_UTIL_LINUX_FSCK is not set
# BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is not set
BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
# BR2_PACKAGE_UTIL_LINUX_UUIDD is not set
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
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_VIM is not set

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
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="apex_msi001"
BR2_TARGET_UBOOT_2011_12=y
# BR2_TARGET_UBOOT_2011_09 is not set
# BR2_TARGET_UBOOT_2011_06 is not set
# BR2_TARGET_UBOOT_2011_03 is not set
# BR2_TARGET_UBOOT_2010_12 is not set
# BR2_TARGET_UBOOT_2010_09 is not set
# BR2_TARGET_UBOOT_2010_06 is not set
# BR2_TARGET_UBOOT_2009_11_1 is not set
# BR2_TARGET_UBOOT_CUSTOM_TARBALL is not set
# BR2_TARGET_UBOOT_CUSTOM_GIT is not set
BR2_TARGET_UBOOT_VERSION="2011.12"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/Apex/UBOOT"
BR2_TARGET_UBOOT_FORMAT_BIN=y
# BR2_TARGET_UBOOT_FORMAT_NAND_BIN is not set
# BR2_TARGET_UBOOT_FORMAT_KWB is not set
# BR2_TARGET_UBOOT_NETWORK is not set

#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_2 is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.36.1"
BR2_LINUX_KERNEL_VERSION="2.6.36.1"
BR2_LINUX_KERNEL_PATCH="board/Apex/msi_001/kernel-patches"
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/Apex/msi_001/linux-2.6.36.1.config"
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
# BR2_LINUX_KERNEL_INSTALL_TARGET is not set

#
# Linux Kernel Extensions
#
# BR2_LINUX_KERNEL_EXT_XENOMAI is not set
# BR2_LINUX_KERNEL_EXT_RTAI is not set


*****************************************************************************
****************************************************************************
#
# Automatically generated make config: don't edit
# Version: 0.9.33
# Mon Mar  5 15:51:15 2012
#
# TARGET_alpha is not set
TARGET_arm=y
# TARGET_avr32 is not set
# TARGET_bfin is not set
# TARGET_cris is not set
# TARGET_e1 is not set
# TARGET_frv is not set
# TARGET_h8300 is not set
# TARGET_hppa is not set
# TARGET_i386 is not set
# TARGET_i960 is not set
# TARGET_ia64 is not set
# TARGET_m68k is not set
# TARGET_microblaze is not set
# TARGET_mips is not set
# TARGET_nios is not set
# TARGET_nios2 is not set
# TARGET_powerpc is not set
# TARGET_sh is not set
# TARGET_sh64 is not set
# TARGET_sparc is not set
# TARGET_v850 is not set
# TARGET_vax is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set
# TARGET_c6x is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_ARM_EABI=y
# COMPILE_IN_THUMB_MODE is not set
# USE_BX is not set
TARGET_SUBARCH=""

#
# Using ELF file format
#
ARCH_ANY_ENDIAN=y
ARCH_LITTLE_ENDIAN=y
# ARCH_WANTS_BIG_ENDIAN is not set
ARCH_WANTS_LITTLE_ENDIAN=y
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
# UCLIBC_HAS_FPU is not set
UCLIBC_HAS_SOFT_FLOAT=y
DO_C99_MATH=y
# DO_XSI_MATH is not set
# UCLIBC_HAS_FENV is not set
KERNEL_HEADERS="/home/johan/buildroot/output/toolchain/linux/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
DOPIC=y
HAVE_SHARED=y
FORCE_SHAREABLE_TEXT_SEGMENTS=y
LDSO_LDD_SUPPORT=y
# LDSO_CACHE_SUPPORT is not set
LDSO_PRELOAD_ENV_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
# LDSO_STANDALONE_SUPPORT is not set
# LDSO_PRELINK_SUPPORT is not set
# UCLIBC_STATIC_LDCONFIG is not set
LDSO_RUNPATH=y
LDSO_SEARCH_INTERP_PATH=y
LDSO_LD_LIBRARY_PATH=y
# LDSO_NO_CLEANUP is not set
UCLIBC_CTOR_DTOR=y
# LDSO_GNU_HASH_SUPPORT is not set
# HAS_NO_THREADS is not set
LINUXTHREADS_OLD=y
# LINUXTHREADS_NEW is not set
# UCLIBC_HAS_THREADS_NATIVE is not set
UCLIBC_HAS_THREADS=y
PTHREADS_DEBUG_SUPPORT=y
UCLIBC_HAS_SYSLOG=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
# COMPAT_ATEXIT is not set
UCLIBC_SUSV3_LEGACY=y
# UCLIBC_SUSV3_LEGACY_MACROS is not set
UCLIBC_SUSV4_LEGACY=y
# UCLIBC_STRICT_HEADERS is not set
# UCLIBC_HAS_STUBS is not set
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
UCLIBC_HAS___PROGNAME=y
UCLIBC_HAS_PTY=y
ASSUME_DEVPTS=y
UNIX98PTY_ONLY=y
# UCLIBC_HAS_GETPT is not set
UCLIBC_HAS_LIBUTIL=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y

#
# Advanced Library Settings
#
UCLIBC_PWD_BUFFER_SIZE=256
UCLIBC_GRP_BUFFER_SIZE=256

#
# Support various families of functions
#
UCLIBC_LINUX_MODULE_26=y
# UCLIBC_LINUX_MODULE_24 is not set
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
UCLIBC_BSD_SPECIFIC=y
UCLIBC_HAS_BSD_ERR=y
# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
# UCLIBC_NTP_LEGACY is not set
# UCLIBC_SV4_DEPRECATED is not set
UCLIBC_HAS_REALTIME=y
UCLIBC_HAS_ADVANCED_REALTIME=y
UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_XATTR=y
UCLIBC_HAS_PROFILING=y
UCLIBC_HAS_CRYPT_IMPL=y
UCLIBC_HAS_SHA256_CRYPT_IMPL=y
UCLIBC_HAS_SHA512_CRYPT_IMPL=y
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
# UCLIBC_HAS_IPV6 is not set
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_USE_NETLINK=y
# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
UCLIBC_HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y
UCLIBC_HAS_LIBNSL_STUB=y

#
# String and Stdio Support
#
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
# UCLIBC_HAS_CTYPE_CHECKED is not set
UCLIBC_HAS_CTYPE_ENFORCED=y
UCLIBC_HAS_WCHAR=y
# UCLIBC_HAS_LOCALE is not set
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_GNU_GETSUBOPT=y

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_REGEX_OLD is not set
UCLIBC_HAS_FNMATCH=y
# UCLIBC_HAS_FNMATCH_OLD is not set
# UCLIBC_HAS_WORDEXP is not set
UCLIBC_HAS_NFTW=y
UCLIBC_HAS_FTW=y
# UCLIBC_HAS_FTS is not set
UCLIBC_HAS_GLOB=y
UCLIBC_HAS_GNU_GLOB=y
# UCLIBC_HAS_UTMPX is not set

#
# Library Installation Options
#
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"
MULTILIB_DIR="lib"
HARDWIRED_ABSPATH=y

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
# UCLIBC_HAS_ARC4RANDOM is not set
# UCLIBC_HAS_SSP is not set
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y

#
# Development/debugging options
#
CROSS_COMPILER_PREFIX="/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-"
UCLIBC_EXTRA_CFLAGS=""
# DODEBUG is not set
# DODEBUG_PT is not set
DOSTRIP=y
# DOASSERTS is not set
# SUPPORT_LD_DEBUG is not set
# SUPPORT_LD_DEBUG_EARLY is not set
# UCLIBC_MALLOC_DEBUGGING is not set
# UCLIBC_HAS_BACKTRACE is not set
WARNINGS="-Wall"
# EXTRA_WARNINGS is not set
# DOMULTI is not set
# UCLIBC_MJN3_ONLY is not set



-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: woensdag 14 maart 2012 20:23
Aan: buildroot at busybox.net
Onderwerp: Re: [Buildroot] Curl : Segmentation Fault

Hello,

Le Wed, 14 Mar 2012 17:02:52 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I did several rebuilds and the result is the same: when using uclibc-0.9.33 i get a segmentation fault when running the curl
binary.
> Did not yet test the lib-curl in a small test program.
> 
> Where to start to solve the issue ?

What is your hardware? What is your Buildroot .config?

You can enable core file generation on the target:
	ulimit -c unlimited

And then feed the core file to your cross-gdb (needs to be selected in the Buildroot configuration) to see where the crash is
happening.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
