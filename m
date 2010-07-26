From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 26 Jul 2010 15:31:36 +0100
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
In-Reply-To: <20100726154939.6a80081d@surf>
References: <1280116089.28885.29.camel@segulix>
	<20100726082816.7a1bd8d1@surf> <1280151165.31502.6.camel@segulix>
	<20100726154939.6a80081d@surf>
Message-ID: <1280154696.31502.11.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2010-07-26 at 15:49 +0200, Thomas Petazzoni wrote: 
> Hello,
> 
> On Mon, 26 Jul 2010 14:32:45 +0100
> Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:
> 
> > > On Mon, 26 Jul 2010 04:48:09 +0100
> > > Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:
> > > 
> > > > I got this error too , with buildroot-2010.05.
> > > 
> > > Which error ?
> > 
> > Well error is in subject (Can't get Buildrooot to finish):
> 
> Aah, okay, I missed it.
> 
> > makedevs: line 49: regular file (...)
> > buildroot/output/target/usr/share/udhcpc/default.script does not
> > exist: No such file or directory
> 
> Can you post your Buildroot .config for us to reproduce the issue ?

ok .config in attach as emtec.config.without qt version 4 .

> 
> > > > After read some threads in this mailing list is this some error , 
> > > > to work around I done:
> > > > cd output/target/usr/share
> > > > ln -s ../../../../target/generic/target_skeleton/usr/share/udhcpc
> > > > 
> > > > and build rootfs , is this correct ? the target is a mips32r2 . 
> > > 
> > > Maybe, but as you haven't copy/pasted the error, it's hard to
> > > say :-)
> 
> In fact, the work around is not correct. You're creating a symbolic
> link from the target directory to the outside. While this symbolic may
> work on the development system where Buildroot runs, it will miserably
> fail on the target system.

oh no,

I successfully build and run bash on my emtec R100 !

  

-- 
S?rgio M. B.
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Mon Jul 26 02:35:23 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.05"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
BR2_mipsel=y
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_mips_1 is not set
# BR2_mips_2 is not set
# BR2_mips_3 is not set
# BR2_mips_4 is not set
# BR2_mips_32 is not set
BR2_mips_32r2=y
# BR2_mips_64 is not set
# BR2_mips_64r2 is not set
# BR2_mips_16 is not set
BR2_MIPS_OABI32=y
# BR2_MIPS_ABI32 is not set
# BR2_MIPS_EABI is not set
# BR2_MIPS_ABI64 is not set
# BR2_MIPS_OABI64 is not set
# BR2_MIPS_ABI_none is not set
BR2_ARCH="mipsel"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="mips32r2"
BR2_GCC_TARGET_ABI="32"

#
# Target options
#

#
# Preset Devices
#
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
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
BR2_COPYTO=""
BR2_STAGING_DIR="$(BASE_DIR)/staging"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
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
BR2_CONFIG_CACHE=y

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
BR2_KERNEL_HEADERS_2_6_33=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.33.5"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
BR2_UCLIBC_VERSION_0_9_30=y
# BR2_UCLIBC_VERSION_0_9_31 is not set
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.30.3"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
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
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_1 is not set
# BR2_GCC_VERSION_4_2_2 is not set
# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
# BR2_GCC_VERSION_4_2_3 is not set
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_2 is not set
# BR2_GCC_VERSION_4_3_3 is not set
BR2_GCC_VERSION_4_3_4=y
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.4"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_LIBGCJ is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y
BR2_GCC_ENABLE_TLS=y

#
# Ccache Options
#
BR2_CCACHE=y
BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"

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
BR2_INET_IPV6=y
BR2_INET_RPC=y
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
# BR2_PROGRAM_INVOCATION is not set
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
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
# BR2_BUSYBOX_VERSION_1_14_X is not set
# BR2_BUSYBOX_VERSION_1_15_X is not set
BR2_BUSYBOX_VERSION_1_16_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.16.1"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_BUSYBOX_SKELETON=y
BR2_PACKAGE_CUSTOMIZE=y

#
# Audio and video libraries and applications
#
BR2_PACKAGE_ALSA_LIB=y

#
# ALSA lib selection
#
BR2_PACKAGE_ALSA_LIB_DEVDIR="/dev/snd"
BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS="all"
BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS="all"
BR2_PACKAGE_ALSA_LIB_ALOAD=y
BR2_PACKAGE_ALSA_LIB_MIXER=y
BR2_PACKAGE_ALSA_LIB_PCM=y
BR2_PACKAGE_ALSA_LIB_RAWMIDI=y
BR2_PACKAGE_ALSA_LIB_HWDEP=y
BR2_PACKAGE_ALSA_LIB_SEQ=y
BR2_PACKAGE_ALSA_LIB_ALISP=y
BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS=y
# BR2_PACKAGE_ALSA_UTILS is not set
# BR2_PACKAGE_AUMIX is not set
BR2_PACKAGE_FLAC=y
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set
BR2_PACKAGE_LIBID3TAG=y
BR2_PACKAGE_LIBMAD=y
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPD is not set
BR2_PACKAGE_LIBOGG=y
BR2_PACKAGE_LIBSNDFILE=y
BR2_PACKAGE_LIBTHEORA=y
BR2_PACKAGE_LIBVORBIS=y
BR2_PACKAGE_MADPLAY=y
BR2_PACKAGE_MADPLAY_ALSA=y
BR2_PACKAGE_MPG123=y
# BR2_PACKAGE_MPLAYER is not set
BR2_PACKAGE_SPEEX=y
# BR2_PACKAGE_SWFDEC is not set
# BR2_PACKAGE_FESTIVAL is not set
BR2_PACKAGE_TAGLIB=y
BR2_PACKAGE_TREMOR=y

#
# Compressors and decompressors
#
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_GZIP=y
# BR2_PACKAGE_LZOP is not set
BR2_PACKAGE_LZMA=y

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LMBENCH is not set
BR2_PACKAGE_LSOF=y
BR2_PACKAGE_MEMSTAT=y
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
BR2_PACKAGE_STRACE=y

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
BR2_PACKAGE_BISON=y
BR2_PACKAGE_BSDIFF=y

#
# coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#
# BR2_PACKAGE_CVS is not set
BR2_PACKAGE_DIFFUTILS=y
BR2_PACKAGE_DISTCC=y
BR2_PACKAGE_FAKEROOT=y
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set

#
# native toolchain needs development files in target filesystem
#
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_LIBGMP=y
BR2_PACKAGE_LIBGMP_HEADERS=y
BR2_PACKAGE_GPERF=y
BR2_PACKAGE_GREP=y
BR2_PACKAGE_INTLTOOL=y
BR2_PACKAGE_MAKE=y
BR2_PACKAGE_LIBMPFR=y
BR2_PACKAGE_LIBMPFR_HEADERS=y
BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_M4=y
BR2_PACKAGE_PATCH=y
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_SED is not set

#
# tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#

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
# BR2_PACKAGE_FBSET is not set
# BR2_PACKAGE_FBV is not set
BR2_PACKAGE_IMAGEMAGICK=y
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#
# BR2_PACKAGE_QT is not set
# BR2_PACKAGE_XORG7 is not set

#
# X libraries and helper libraries
#
BR2_PACKAGE_LIBERATION=y

#
# X Window managers
#

#
# X applications
#
# BR2_PACKAGE_GOB2 is not set

#
# Hardware handling
#
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_CRAMFS is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMRAID is not set
BR2_PACKAGE_DOSFSTOOLS=y
BR2_PACKAGE_DOSFSTOOLS_MKDOSFS=y
BR2_PACKAGE_DOSFSTOOLS_DOSFSCK=y
BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL=y
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_UTILS=y
BR2_PACKAGE_E2FSPROGS_BADBLOCKS=y
BR2_PACKAGE_E2FSPROGS_BLKID=y
BR2_PACKAGE_E2FSPROGS_CHATTR=y
BR2_PACKAGE_E2FSPROGS_DUMPE2FS=y
BR2_PACKAGE_E2FSPROGS_E2FREEFRAG=y
BR2_PACKAGE_E2FSPROGS_E2FSCK=y
BR2_PACKAGE_E2FSPROGS_E2LABEL=y
BR2_PACKAGE_E2FSPROGS_E2UNDO=y
BR2_PACKAGE_E2FSPROGS_FILEFRAG=y
BR2_PACKAGE_E2FSPROGS_FINDFS=y
BR2_PACKAGE_E2FSPROGS_FSCK=y
BR2_PACKAGE_E2FSPROGS_LOGSAVE=y
BR2_PACKAGE_E2FSPROGS_LSATTR=y
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
BR2_PACKAGE_HDPARM=y
# BR2_PACKAGE_HOTPLUG is not set
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_I2C_TOOLS=y
# BR2_PACKAGE_INPUT_TOOLS is not set
BR2_PACKAGE_IOSTAT=y
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
BR2_PACKAGE_MAKEDEVS=y
# BR2_PACKAGE_MDADM is not set
BR2_PACKAGE_MEMTESTER=y
# BR2_PACKAGE_MTD is not set
BR2_PACKAGE_NTFS_3G=y
# BR2_PACKAGE_NTFSPROGS is not set
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_SETSERIAL is not set
BR2_PACKAGE_SFDISK=y
BR2_PACKAGE_SMARTMONTOOLS=y
# BR2_PACKAGE_SQUASHFS is not set
BR2_PACKAGE_SSHFS=y
BR2_PACKAGE_SYSSTAT=y
# BR2_PACKAGE_UDEV is not set
BR2_PACKAGE_UDEV_VOLUME_ID=y
BR2_PACKAGE_UDEV_SCSI_ID=y
BR2_PACKAGE_USB_MODESWITCH=y
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
# BR2_PACKAGE_USBUTILS_ZLIB is not set
BR2_PACKAGE_WIPE=y
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
BR2_PACKAGE_LZO=y
BR2_PACKAGE_ZLIB=y

#
# Crypto
#
BR2_PACKAGE_BEECRYPT=y
BR2_PACKAGE_LIBGCRYPT=y
BR2_PACKAGE_LIBGPG_ERROR=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_BIN=y
BR2_PACKAGE_OPENSSL_ENGINES=y

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
BR2_PACKAGE_LIBFUSE=y
BR2_PACKAGE_LIBLOCKFILE=y
BR2_PACKAGE_LIBSYSFS=y

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_JPEG=y
# BR2_PACKAGE_LIBART is not set
BR2_PACKAGE_LIBPNG=y
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_PIXMAN is not set
BR2_PACKAGE_TIFF=y

#
# Hardware handling
#
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
BR2_PACKAGE_TSLIB=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Networking
#
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_CURL=y
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
BR2_PACKAGE_LIBDAEMON=y
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGLIB12 is not set
BR2_PACKAGE_LIBGLIB2=y
# BR2_PACKAGE_LIBOIL is not set

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
BR2_PACKAGE_POPT=y
BR2_PACKAGE_READLINE=y
BR2_PACKAGE_SLANG=y

#
# XML
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
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
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE is not set
BR2_PACKAGE_CTORRENT=y
# BR2_PACKAGE_CUPS is not set
BR2_PACKAGE_ISC_DHCP=y
# BR2_PACKAGE_DHCP_SERVER is not set
# BR2_PACKAGE_DHCP_RELAY is not set
BR2_PACKAGE_DHCP_CLIENT=y
BR2_PACKAGE_DNSMASQ=y
BR2_PACKAGE_DNSMASQ_TFTP=y
BR2_PACKAGE_DNSMASQ_DHCP=y
# BR2_PACKAGE_DNSMASQ_IDN is not set
# BR2_PACKAGE_DROPBEAR is not set
BR2_PACKAGE_ETHTOOL=y
# BR2_PACKAGE_HOSTAPD is not set
BR2_PACKAGE_IFPLUGD=y
# BR2_PACKAGE_IPERF is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIGHTTPD is not set
BR2_PACKAGE_LINKS=y
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
BR2_PACKAGE_NCFTP=y

#
# ncFTP tools selection
#
BR2_PACKAGE_NCFTP_GET=y
BR2_PACKAGE_NCFTP_PUT=y
BR2_PACKAGE_NCFTP_LS=y
BR2_PACKAGE_NCFTP_BATCH=y
# BR2_PACKAGE_NCFTP_BOOKMARKS is not set
# BR2_PACKAGE_NETCAT is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
BR2_PACKAGE_NETPLUG=y
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
BR2_PACKAGE_NFS_UTILS=y

#
# NFS utilities selection
#
# BR2_PACKAGE_NFS_UTILS_RPCDEBUG is not set
# BR2_PACKAGE_NFS_UTILS_RPC_LOCKD is not set
# BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD is not set
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_SNTP=y
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
# BR2_PACKAGE_OPENVPN is not set
BR2_PACKAGE_PORTMAP=y
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RSYNC is not set
BR2_PACKAGE_SAMBA=y

#
# Samba tools selection
#
BR2_PACKAGE_SAMBA_CIFS=y
BR2_PACKAGE_SAMBA_EVENTLOGADM=y

#
# findsmb       - disabled (requires nmblookup, smbclient and perl)
#
BR2_PACKAGE_SAMBA_NET=y
BR2_PACKAGE_SAMBA_NMBD=y
BR2_PACKAGE_SAMBA_NMBLOOKUP=y
BR2_PACKAGE_SAMBA_NTLM_AUTH=y
BR2_PACKAGE_SAMBA_PDBEDIT=y
BR2_PACKAGE_SAMBA_PROFILES=y
BR2_PACKAGE_SAMBA_RPCCLIENT=y
BR2_PACKAGE_SAMBA_SMBCACLS=y
BR2_PACKAGE_SAMBA_SMBCLIENT=y
BR2_PACKAGE_SAMBA_SMBCONTROL=y
BR2_PACKAGE_SAMBA_SMBCQUOTAS=y
BR2_PACKAGE_SAMBA_SMBGET=y
BR2_PACKAGE_SAMBA_SMBLDBTOOLS=y
BR2_PACKAGE_SAMBA_SMBPASSWD=y
BR2_PACKAGE_SAMBA_SMBSHARESEC=y
BR2_PACKAGE_SAMBA_SMBSPOOL=y
BR2_PACKAGE_SAMBA_SMBSTATUS=y
BR2_PACKAGE_SAMBA_SMBTREE=y
BR2_PACKAGE_SAMBA_SWAT=y
BR2_PACKAGE_SAMBA_SMBTAR=y
BR2_PACKAGE_SAMBA_TDB=y
BR2_PACKAGE_SAMBA_TESTPARM=y
BR2_PACKAGE_SAMBA_WINBINDD=y
BR2_PACKAGE_SAMBA_WBINFO=y

#
# Samba libraries selection
#
# BR2_PACKAGE_SAMBA_LIBSMBCLIENT is not set

#
# Samba support selection
#

#
# support avahi - disabled (requires avahi)
#

#
# support gamin - disabled (requires gamin)
#
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SQUID is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
BR2_PACKAGE_VSFTPD=y
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WGET is not set
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_WPA_SUPPLICANT=y
# BR2_PACKAGE_WPA_SUPPLICANT_EAP is not set
# BR2_PACKAGE_WPA_SUPPLICANT_CLI is not set
# BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set

#
# rpm requires libneon with SSL, XML and ZLIB support
#

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
BR2_PACKAGE_BASH=y
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
BR2_PACKAGE_LOCKFILE_PROGS=y
# BR2_PACKAGE_LOGROTATE is not set
BR2_PACKAGE_SCREEN=y
BR2_PACKAGE_SUDO=y
BR2_PACKAGE_WHICH=y

#
# System tools
#
BR2_PACKAGE_BOOTUTILS=y
BR2_PACKAGE_MODULE_INIT_TOOLS=y
BR2_PACKAGE_PROCPS=y
BR2_PACKAGE_PSMISC=y
BR2_PACKAGE_SYSKLOGD=y
BR2_PACKAGE_SYSVINIT=y
BR2_PACKAGE_UTIL-LINUX=y

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
BR2_PACKAGE_LESS=y
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set
BR2_PACKAGE_VIM=y
BR2_PACKAGE_VIM_RUNTIME=y

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
# BR2_TARGET_ROOTFS_EXT2_NONE is not set
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
BR2_TARGET_ROOTFS_EXT2_LZMA=y
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/38c2c1c0/attachment-0001.bin>
