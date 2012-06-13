From: Nicole <nicole@cats-muvva.net>
Date: Wed, 13 Jun 2012 22:01:37 +0100
Subject: [Buildroot] Passing compile flags to every component
Message-ID: <4FD8FFB1.2010702@cats-muvva.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry if this is a newbie question. Can anyone give me some directions 
about how to to pass a set of {C{,XX,PP},LD}FLAGS to the build of each 
and every application that will be put on the disk image?

For example, I tried building the "which" utility which seems to be very 
plain vanilla automake, I want to use -mtune=geode to be certain that I 
avoid problems with the NOPL instruction (which is missing on the Geode 
LX). I also want to see if -flto makes any difference. In addition I 
want to be sure that stack-smashing protection is enabled.

Many thanks

Nicole

Here is the part of the log file where which is compiled
source='getopt.c' object='getopt.o' libtool=no \
DEPDIR=.deps depmode=pch /bin/sh ./depcomp \
/target1/staging/usr/bin/ccache 
/target1/staging/usr/bin/i586-geode-linux-uclibc-gcc -DHAVE_CONFIG_H -I. 
     -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -c getopt.c
source='getopt1.c' object='getopt1.o' libtool=no \
DEPDIR=.deps depmode=pch /bin/sh ./depcomp \
/target1/staging/usr/bin/ccache 
/target1/staging/usr/bin/i586-geode-linux-uclibc-gcc -DHAVE_CONFIG_H -I. 
     -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -c getopt1.c
source='bash.c' object='bash.o' libtool=no \
DEPDIR=.deps depmode=pch /bin/sh ./depcomp \
/target1/staging/usr/bin/ccache 
/target1/staging/usr/bin/i586-geode-linux-uclibc-gcc -DHAVE_CONFIG_H -I. 
     -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -c bash.c
source='which.c' object='which.o' libtool=no \
DEPDIR=.deps depmode=pch /bin/sh ./depcomp \
/target1/staging/usr/bin/ccache 
/target1/staging/usr/bin/i586-geode-linux-uclibc-gcc -DHAVE_CONFIG_H -I. 
     -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -c which.c
/target1/staging/usr/bin/ccache 
/target1/staging/usr/bin/i586-geode-linux-uclibc-gcc  -pipe -Os 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -o 
which getopt.o getopt1.o bash.o which.o ./tilde/libtilde.a


My config file is below
#
# Automatically generated make config: don't edit
# Buildroot 2012.08-git-00142-g9156bbc Configuration
#
BR2_HAVE_DOT_CONFIG=y
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_bfin is not set
BR2_i386=y
# BR2_microblazeel is not set
# BR2_microblazebe is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
BR2_x86_i586=y
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
# BR2_x86_atom is not set
# BR2_x86_k6 is not set
# BR2_x86_k6_2 is not set
# BR2_x86_athlon is not set
# BR2_x86_athlon_4 is not set
# BR2_x86_opteron is not set
# BR2_x86_opteron_sse3 is not set
# BR2_x86_barcelona is not set
# BR2_x86_geode is not set
# BR2_x86_c3 is not set
# BR2_x86_c32 is not set
# BR2_x86_winchip_c6 is not set
# BR2_x86_winchip2 is not set
BR2_ARCH="i586"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i586"
BR2_GCC_TARGET_ARCH="i586"

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
BR2_DL_DIR="$(HOME)/Sources"
BR2_HOST_DIR="/target1/staging"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=4
BR2_CCACHE=y
BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache"
BR2_DEPRECATED=y
# BR2_ENABLE_DEBUG is not set
# BR2_STRIP_strip is not set
BR2_STRIP_sstrip=y
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
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009 is not set
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/x-tools/i586-geode-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="i586-geode-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="i586-geode-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_UCLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
# BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is not set
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_USE_WCHAR=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="en_US"
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="router"
BR2_TARGET_GENERIC_ISSUE="Welcome to CatsMuvva Router"
# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400=y
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE="38400"
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# Package Selection for the target
#
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
# BR2_PACKAGE_CUSTOMIZE is not set

#
# Audio and video applications
#
# BR2_PACKAGE_ALSA_UTILS is not set
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_BELLAGIO is not set
# BR2_PACKAGE_FAAD2 is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_FFMPEG is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LAME is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPD is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_PULSEAUDIO is not set
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
# BR2_PACKAGE_LATENCYTOP is not set

#
# lmbench requires a toolchain with RPC support
#
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP_TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_RT_TESTS is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_STRESS is not set
# BR2_PACKAGE_WHETSTONE is not set
# BR2_PACKAGE_VALGRIND is not set
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
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
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
# BR2_PACKAGE_RRDTOOL is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set
# BR2_PACKAGE_FBSET is not set

#
# fbterm requires a toolchain with C++, WCHAR and locale support
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
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
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_CRAMFS is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMIDECODE is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FLASHROM is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_FMTOOLS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GDISK is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
# BR2_PACKAGE_LCDPROC is not set
# BR2_PACKAGE_LINUX_FIRMWARE is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LSUIO is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MINICOM is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NANOCOM is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_OFONO is not set
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set
# BR2_PACKAGE_PARTED is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PICOCOM is not set
# BR2_PACKAGE_READ_EDID is not set
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
# BR2_PACKAGE_UBOOT_TOOLS is not set
BR2_PACKAGE_UDEV=y
# BR2_PACKAGE_UDEV_RULES_GEN is not set
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
# Audio/Sound
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_AUDIOFILE is not set
# BR2_PACKAGE_LIBAO is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBCUE is not set
# BR2_PACKAGE_LIBCUEFILE is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING is not set

#
# Compression and decompression
#
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_ZLIB is not set

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_GNUTLS is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBNSS is not set
# BR2_PACKAGE_OCF_LINUX is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_POLARSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQLCIPHER is not set
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
# BR2_PACKAGE_IMLIB2 is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBDMTX is not set
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set
# BR2_PACKAGE_GDK_PIXBUF is not set
# BR2_PACKAGE_LIBPNG is not set
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
# BR2_PACKAGE_LIBFREEFARE is not set
# BR2_PACKAGE_LIBFTDI is not set
# BR2_PACKAGE_LIBHID is not set
# BR2_PACKAGE_LIBIQRF is not set
# BR2_PACKAGE_LIBNFC is not set
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
# Multimedia
#
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPEG2 is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBPLAYER is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIVE555 is not set
# BR2_PACKAGE_MEDIASTREAMER is not set

#
# Networking
#
# BR2_PACKAGE_GLIB_NETWORKING is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBESMTP is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBFCGI is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBOAUTH is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBMNL is not set
# BR2_PACKAGE_LIBMODBUS is not set
# BR2_PACKAGE_LIBMBUS is not set
# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
# BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT is not set
# BR2_PACKAGE_LIBNFNETLINK is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBOPING is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBTORRENT is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LIBVNCSERVER is not set
# BR2_PACKAGE_ORTP is not set
# BR2_PACKAGE_ZEROMQ is not set

#
# Other
#
# BR2_PACKAGE_APR is not set
# BR2_PACKAGE_APR_UTIL is not set
# BR2_PACKAGE_FFTW is not set
# BR2_PACKAGE_LIBARGTABLE2 is not set
# BR2_PACKAGE_ARGP_STANDALONE is not set
# BR2_PACKAGE_BOOST is not set
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBCAP_NG is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBEV is not set
# BR2_PACKAGE_LIBFFI is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBICAL is not set
# BR2_PACKAGE_LIBNSPR is not set
# BR2_PACKAGE_LIBSIGC is not set
# BR2_PACKAGE_LIBTPL is not set
# BR2_PACKAGE_LIBURCU is not set
# BR2_PACKAGE_LTTNG_LIBUST is not set
# BR2_PACKAGE_ORC is not set
# BR2_PACKAGE_POCO is not set
# BR2_PACKAGE_PROTOBUF is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# JSON/XML
#
# BR2_PACKAGE_CJSON is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_JSON_C is not set
# BR2_PACKAGE_LIBROXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set
# BR2_PACKAGE_XERCES is not set
# BR2_PACKAGE_YAJL is not set

#
# Miscellaneous
#
# BR2_PACKAGE_COLLECTD is not set
# BR2_PACKAGE_EMPTY is not set
# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BLUEZ_UTILS is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CAN_UTILS is not set
# BR2_PACKAGE_CONNMAN is not set
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CIFS_UTILS is not set
# BR2_PACKAGE_CONNTRACK_TOOLS is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_EBTABLES is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HEIRLOOM_MAILX is not set
# BR2_PACKAGE_HIAWATHA is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IPERF is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPSET is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LINPHONE is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MII_DIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MSMTP is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NDISC6 is not set
# BR2_PACKAGE_NETCAT is not set

#
# netkitbase requires a toolchain with RPC support
#

#
# netkittelnet requires a toolchain with RPC support
#
# BR2_PACKAGE_NETATALK is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
# BR2_PACKAGE_NETWORK_MANAGER is not set
# BR2_PACKAGE_NOIP is not set

#
# nfs-utils requires a toolchain with RPC and LARGEFILE support
#
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSWAN is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with RPC support
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_RSH_REDONE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_RTORRENT is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SOCKETCAND is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SQUID is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TRANSMISSION is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_USHARE is not set
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
# BR2_PACKAGE_OPKG is not set

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
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LOGSURFER is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
BR2_PACKAGE_WHICH=y
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#
# BR2_PACKAGE_ACL is not set
# BR2_PACKAGE_ATTR is not set
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_HTOP is not set
BR2_PACKAGE_KMOD=y
# BR2_PACKAGE_KMOD_TOOLS is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_MONIT is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_RSYSLOG is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_SYSTEMD is not set
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
# BR2_PACKAGE_HOST_LPC3250LOADER is not set
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
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set

#
# iso image requires a Linux kernel to be built
#

#
# initramfs requires a Linux kernel to be built
#
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
BR2_TARGET_GRUB=y
# BR2_TARGET_GRUB_SPLASH is not set
# BR2_TARGET_GRUB_DISKLESS is not set
# BR2_TARGET_GRUB_3c595 is not set
# BR2_TARGET_GRUB_3c90x is not set
# BR2_TARGET_GRUB_davicom is not set
# BR2_TARGET_GRUB_e1000 is not set
# BR2_TARGET_GRUB_eepro100 is not set
# BR2_TARGET_GRUB_epic100 is not set
# BR2_TARGET_GRUB_forcedeth is not set
# BR2_TARGET_GRUB_natsemi is not set
# BR2_TARGET_GRUB_ns83820 is not set
# BR2_TARGET_GRUB_ns8390 is not set
# BR2_TARGET_GRUB_pcnet32 is not set
# BR2_TARGET_GRUB_pnic is not set
# BR2_TARGET_GRUB_rtl8139 is not set
# BR2_TARGET_GRUB_r8169 is not set
# BR2_TARGET_GRUB_sis900 is not set
# BR2_TARGET_GRUB_tg3 is not set
# BR2_TARGET_GRUB_tulip is not set
# BR2_TARGET_GRUB_tlan is not set
# BR2_TARGET_GRUB_undi is not set
# BR2_TARGET_GRUB_via_rhine is not set
# BR2_TARGET_GRUB_w89c840 is not set
# BR2_TARGET_SYSLINUX is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
# BR2_LINUX_KERNEL is not set

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2332 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120613/fa0c0b5c/attachment-0001.p7s>
