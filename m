From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 26 Jan 2011 10:40:08 -0700
Subject: [Buildroot] Migrate .05 to .08/.11 fails with glibc based external
	toolchain
Message-ID: <1296063608.3969.20.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've got a build that has been working with 2010.05 that I tried to
migrate to a newer release.  It dies early in the newer releases,
apparently related to a dependency on uclibc.  The problem is my
external toolchain (Crosstool-NG) is glibc based and the buildroot
configs appear to reflect this.  So I'm not sure where this dependency
is coming from.  Here is where the build fails with 2010.11 (2010.08 is
the same):

Checking external toolchain settings
mkdir
-p /home/mjhammel/src/cei/system_build/bld/buildroot-2010.11/output/target/lib
Copy external toolchain libraries to target...
Copy external toolchain sysroot to staging...
# Create lib64 symbolic links if needed
make[1]: *** No rule to make target `uclibc_target', needed by
`gcc_target'. Stop.
make[1]: Leaving directory
`/home/mjhammel/src/cei/system_build/bld/buildroot-2010.11'

I found nothing in bugzilla about this.  Something tells me I'm missing
something basic here.

I've attached the 2010.05 and 2010.11 configs for comparison.  Please
forgive the template tags (re: [...]) for some dirs/files references in
the configs - they are used in my metabuild.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Wed Jan 26 09:32:00 2011
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.08"
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

#
# e300c2 needs gcc >= 4.4.x
#
# BR2_powerpc_e300c2 is not set

#
# e300c3 needs gcc >= 4.4.x
#
# BR2_powerpc_e300c3 is not set

#
# e500mc needs gcc >= 4.4.x
#
# BR2_powerpc_e500mc is not set
BR2_ARCH="powerpc"
BR2_ENDIAN="BIG"
BR2_GCC_TARGET_TUNE="440"

#
# Target options
#

#
# Preset Devices
#
BR2_TARGET_GENERIC_HOSTNAME="rare"
BR2_TARGET_GENERIC_ISSUE="Welcome to ustar"
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
BR2_DL_DIR="/home/mjhammel/src/cei/system_build/src/../archive/buildroot/dl/"
BR2_STAGING_DIR="/home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.08.bld/staging/"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=8
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
BR2_HAVE_DEVFILES=y

#
# Advanced
#
# BR2_CONFIG_CACHE is not set

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_EXTERNAL_UCLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_STRIP=y

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set

#
# Gdb debugger for the target needs WCHAR support in toolchain
#
# BR2_PACKAGE_GDB_SERVER is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_USE_WCHAR=y
BR2_SOFT_FLOAT=y
# BR2_USE_SSP is not set
BR2_PTHREADS_NONE=y
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
# BR2_PTHREADS_NATIVE is not set
BR2_PROGRAM_INVOCATION=y
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/ceippc"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="powerpc-440-linux-gnu"

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_13_X is not set
# BR2_BUSYBOX_VERSION_1_14_X is not set
BR2_BUSYBOX_VERSION_1_15_X=y
# BR2_BUSYBOX_VERSION_1_16_X is not set
# BR2_BUSYBOX_VERSION_1_17_X is not set
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.15.3"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG=".busybox_config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_CUSTOMIZE=y

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
BR2_PACKAGE_BZIP2=y
# BR2_PACKAGE_GZIP is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LMBENCH is not set
BR2_PACKAGE_LSOF=y
# BR2_PACKAGE_LTRACE is not set
BR2_PACKAGE_MEMSTAT=y
# BR2_PACKAGE_NETPERF is not set
BR2_PACKAGE_STRACE=y

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FINDUTILS is not set
BR2_PACKAGE_FLEX=y
BR2_PACKAGE_FLEX_LIBFL=y
# BR2_PACKAGE_GAWK is not set
BR2_PACKAGE_GCC_TARGET=y
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_GREP is not set
BR2_PACKAGE_MAKE=y
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_SED is not set
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
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBSET is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
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
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
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
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HOTPLUG is not set
# BR2_PACKAGE_HWDATA is not set
BR2_PACKAGE_I2C_TOOLS=y
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
BR2_PACKAGE_LM_SENSORS=y
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
BR2_PACKAGE_MEMTESTER=y
BR2_PACKAGE_MTD=y

#
# MTD tools selection
#
BR2_PACKAGE_MTD_DOCFDISK=y
BR2_PACKAGE_MTD_DOC_LOADBIOS=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
# BR2_PACKAGE_MTD_FLASH_OTP_DUMP is not set
# BR2_PACKAGE_MTD_FLASH_OTP_INFO is not set
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FTL_CHECK=y
BR2_PACKAGE_MTD_FTL_FORMAT=y
BR2_PACKAGE_MTD_JFFS2DUMP=y
BR2_PACKAGE_MTD_MKFSJFFS2=y
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDTEST=y
BR2_PACKAGE_MTD_NANDWRITE=y
BR2_PACKAGE_MTD_NFTLDUMP=y
BR2_PACKAGE_MTD_NFTL_FORMAT=y
# BR2_PACKAGE_MTD_RECV_IMAGE is not set
# BR2_PACKAGE_MTD_RFDDUMP is not set
# BR2_PACKAGE_MTD_RFDFORMAT is not set
# BR2_PACKAGE_MTD_SERVE_IMAGE is not set
BR2_PACKAGE_MTD_SUMTOOL=y
BR2_PACKAGE_MTD_MTDINFO=y
BR2_PACKAGE_MTD_UBIATTACH=y
BR2_PACKAGE_MTD_UBICRC32=y
BR2_PACKAGE_MTD_UBIDETACH=y
BR2_PACKAGE_MTD_UBIFORMAT=y
BR2_PACKAGE_MTD_UBIMKVOL=y
BR2_PACKAGE_MTD_UBINFO=y
BR2_PACKAGE_MTD_UBINIZE=y
BR2_PACKAGE_MTD_UBIRENAME=y
BR2_PACKAGE_MTD_UBIRMVOL=y
BR2_PACKAGE_MTD_UBIRSVOL=y
BR2_PACKAGE_MTD_UBIUPDATEVOL=y
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
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
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_CGI=y
# BR2_PACKAGE_PHP_SAPI_CLI is not set
BR2_PACKAGE_PHP_SAPI_CGI=y
# BR2_PACKAGE_PHP_SAPI_CLI_CGI is not set
BR2_PACKAGE_PHP_FASTCGI=y

#
# PHP Extensions
#
BR2_PACKAGE_PHP_CONFIG="$(PHP_DIR)/php.ini-dist"
# BR2_PACKAGE_PHP_EXT_SOCKETS is not set
BR2_PACKAGE_PHP_EXT_POSIX=y
BR2_PACKAGE_PHP_EXT_SPL=y
BR2_PACKAGE_PHP_EXT_SESSION=y
# BR2_PACKAGE_PHP_EXT_OPENSSL is not set
# BR2_PACKAGE_PHP_EXT_LIBXML2 is not set
# BR2_PACKAGE_PHP_EXT_SIMPLEXML is not set
BR2_PACKAGE_PHP_EXT_ZLIB=y
# BR2_PACKAGE_PHP_EXT_EXIF is not set
# BR2_PACKAGE_PHP_EXT_FTP is not set
# BR2_PACKAGE_PHP_EXT_GETTEXT is not set
# BR2_PACKAGE_PHP_EXT_GMP is not set
# BR2_PACKAGE_PHP_EXT_JSON is not set
# BR2_PACKAGE_PHP_EXT_READLINE is not set
# BR2_PACKAGE_PHP_EXT_NCURSES is not set
BR2_PACKAGE_PHP_EXT_PCRE=y
# BR2_PACKAGE_PHP_EXT_SYSVMSG is not set
# BR2_PACKAGE_PHP_EXT_SYSVSEM is not set
# BR2_PACKAGE_PHP_EXT_SYSVSHM is not set
# BR2_PACKAGE_PHP_EXT_ZIP is not set
# BR2_PACKAGE_PHP_EXT_FILTER is not set
# BR2_PACKAGE_PHP_EXT_CALENDAR is not set

#
# Database extensions
#
# BR2_PACKAGE_PHP_EXT_SQLITE is not set
# BR2_PACKAGE_PHP_EXT_PDO is not set
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_DEV=y
# BR2_PACKAGE_PYTHON_PY_ONLY is not set
# BR2_PACKAGE_PYTHON_PYC_ONLY is not set
BR2_PACKAGE_PYTHON_PY_PYC=y

#
# The following modules are unusual or require extra libraries
#
# BR2_PACKAGE_PYTHON_BSDDB is not set
BR2_PACKAGE_PYTHON_CODECSCJK=y
# BR2_PACKAGE_PYTHON_CURSES is not set
# BR2_PACKAGE_PYTHON_PYEXPAT is not set
# BR2_PACKAGE_PYTHON_READLINE is not set
# BR2_PACKAGE_PYTHON_SSL is not set
# BR2_PACKAGE_PYTHON_TKINTER is not set
BR2_PACKAGE_PYTHON_UNICODEDATA=y
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
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
BR2_PACKAGE_LIBSYSFS=y

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
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y

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
BR2_PACKAGE_NEON=y
BR2_PACKAGE_NEON_ZLIB=y
BR2_PACKAGE_NEON_SSL=y
# BR2_PACKAGE_NEON_EXPAT is not set
BR2_PACKAGE_NEON_LIBXML2=y
# BR2_PACKAGE_NEON_NOXML is not set
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
BR2_PACKAGE_LIBELF=y
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBOIL is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
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
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
BR2_PACKAGE_LIBXML2=y
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
BR2_PACKAGE_BRIDGE=y
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCP is not set
# BR2_PACKAGE_DNSMASQ is not set
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_ETHTOOL=y
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
BR2_PACKAGE_IPERF=y
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
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
# BR2_PACKAGE_NFS_UTILS is not set
BR2_PACKAGE_NTP=y
# BR2_PACKAGE_NTP_SNTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
BR2_PACKAGE_RSYNC=y
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SQUID is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
BR2_PACKAGE_TTCP=y
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Package managers
#
BR2_PACKAGE_IPKG=y
# BR2_PACKAGE_RPM is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BASH is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_DIALOG is not set
BR2_PACKAGE_FILE=y
# BR2_PACKAGE_LOCKFILE_PROGS is not set
BR2_PACKAGE_LOGROTATE=y
BR2_PACKAGE_SCREEN=y
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_WHICH is not set

#
# System tools
#
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_UTIL-LINUX is not set

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_LESS is not set
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_VIM is not set

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT="/home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.08/postcfg.sh"
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
# BR2_TARGET_ROOTFS_EXT2_NONE is not set
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
BR2_TARGET_ROOTFS_EXT2_BZIP2=y
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
BR2_TARGET_ROOTFS_JFFS2=y
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K is not set
BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
# BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
# BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
# BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
# BR2_JFFS2_TARGET_SREC is not set
# BR2_TARGET_ROOTFS_JFFS2_PAD is not set
# BR2_TARGET_ROOTFS_JFFS2_LE is not set
BR2_TARGET_ROOTFS_JFFS2_BE=y
BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
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
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Buildroot version: 2010.11
# Wed Jan 26 09:32:57 2011
#
BR2_HAVE_DOT_CONFIG=y
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_i386 is not set
# BR2_mips is not set
# BR2_mipsel is not set
BR2_powerpc=y
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
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

#
# e300c2 needs gcc >= 4.4.x
#
# BR2_powerpc_e300c2 is not set

#
# e300c3 needs gcc >= 4.4.x
#
# BR2_powerpc_e300c3 is not set

#
# e500mc needs gcc >= 4.4.x
#
# BR2_powerpc_e500mc is not set
BR2_ARCH="powerpc"
BR2_ENDIAN="BIG"
BR2_GCC_TARGET_TUNE="440"

#
# Target options
#

#
# Preset Devices
#
BR2_TARGET_GENERIC_HOSTNAME="rare"
BR2_TARGET_GENERIC_ISSUE="Welcome to ustar"
# BR2_TARGET_GENERIC_GETTY is not set

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
BR2_DL_DIR="/home/mjhammel/src/cei/system_build/src/../archive/buildroot/dl/"
BR2_STAGING_DIR="/home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.11.bld/staging/"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.uclibc.org/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=8
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
BR2_HAVE_DEVFILES=y

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_CTNG is not set
# BR2_TOOLCHAIN_EXTERNAL_UCLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_STRIP=y

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_USE_WCHAR=y
BR2_SOFT_FLOAT=y
# BR2_USE_SSP is not set
BR2_PTHREADS_NONE=y
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
BR2_PROGRAM_INVOCATION=y
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/ceippc"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="powerpc-440-linux-gnu"

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_15_X=y
# BR2_BUSYBOX_VERSION_1_16_X is not set
# BR2_BUSYBOX_VERSION_1_17_X is not set
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.15.3"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG=".busybox_config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_CUSTOMIZE=y

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
# BR2_PACKAGE_LIBMPEG2 is not set
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
BR2_PACKAGE_BZIP2=y
# BR2_PACKAGE_GZIP is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LMBENCH is not set
BR2_PACKAGE_LSOF=y
# BR2_PACKAGE_LTRACE is not set
BR2_PACKAGE_MEMSTAT=y
# BR2_PACKAGE_NETPERF is not set
BR2_PACKAGE_STRACE=y

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FINDUTILS is not set
BR2_PACKAGE_FLEX=y
BR2_PACKAGE_FLEX_LIBFL=y
# BR2_PACKAGE_GAWK is not set
BR2_PACKAGE_GCC_TARGET=y
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_GREP is not set
BR2_PACKAGE_MAKE=y
# BR2_PACKAGE_LIBMPC is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_SED is not set
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
# BR2_PACKAGE_FBSET is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
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
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
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
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HWDATA is not set
BR2_PACKAGE_I2C_TOOLS=y
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_KBD is not set
BR2_PACKAGE_LM_SENSORS=y

#
# lm-sensors tools
#
BR2_PACKAGE_LM_SENSORS_SENSORS=y
# BR2_PACKAGE_LM_SENSORS_FANCONTROL is not set
# BR2_PACKAGE_LM_SENSORS_ISADUMP is not set
# BR2_PACKAGE_LM_SENSORS_ISASET is not set
# BR2_PACKAGE_LM_SENSORS_PWMCONFIG is not set
# BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
BR2_PACKAGE_MEMTESTER=y
BR2_PACKAGE_MTD=y

#
# MTD tools selection
#
BR2_PACKAGE_MTD_DOCFDISK=y
BR2_PACKAGE_MTD_DOC_LOADBIOS=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
# BR2_PACKAGE_MTD_FLASH_OTP_DUMP is not set
# BR2_PACKAGE_MTD_FLASH_OTP_INFO is not set
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FTL_CHECK=y
BR2_PACKAGE_MTD_FTL_FORMAT=y
BR2_PACKAGE_MTD_JFFS2DUMP=y
BR2_PACKAGE_MTD_MKFSJFFS2=y
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDTEST=y
BR2_PACKAGE_MTD_NANDWRITE=y
BR2_PACKAGE_MTD_NFTLDUMP=y
BR2_PACKAGE_MTD_NFTL_FORMAT=y
# BR2_PACKAGE_MTD_RECV_IMAGE is not set
# BR2_PACKAGE_MTD_RFDDUMP is not set
# BR2_PACKAGE_MTD_RFDFORMAT is not set
# BR2_PACKAGE_MTD_SERVE_IMAGE is not set
BR2_PACKAGE_MTD_SUMTOOL=y
BR2_PACKAGE_MTD_MTDINFO=y
BR2_PACKAGE_MTD_UBIATTACH=y
BR2_PACKAGE_MTD_UBICRC32=y
BR2_PACKAGE_MTD_UBIDETACH=y
BR2_PACKAGE_MTD_UBIFORMAT=y
BR2_PACKAGE_MTD_UBIMKVOL=y
BR2_PACKAGE_MTD_UBINFO=y
BR2_PACKAGE_MTD_UBINIZE=y
BR2_PACKAGE_MTD_UBIRENAME=y
BR2_PACKAGE_MTD_UBIRMVOL=y
BR2_PACKAGE_MTD_UBIRSVOL=y
BR2_PACKAGE_MTD_UBIUPDATEVOL=y
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_RNG_TOOLS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
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
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_CGI=y
# BR2_PACKAGE_PHP_SAPI_CLI is not set
BR2_PACKAGE_PHP_SAPI_CGI=y
# BR2_PACKAGE_PHP_SAPI_CLI_CGI is not set
BR2_PACKAGE_PHP_FASTCGI=y

#
# PHP Extensions
#
BR2_PACKAGE_PHP_CONFIG="$(PHP_DIR)/php.ini-dist"
# BR2_PACKAGE_PHP_EXT_SOCKETS is not set
BR2_PACKAGE_PHP_EXT_POSIX=y
BR2_PACKAGE_PHP_EXT_SPL=y
BR2_PACKAGE_PHP_EXT_SESSION=y
# BR2_PACKAGE_PHP_EXT_OPENSSL is not set
# BR2_PACKAGE_PHP_EXT_LIBXML2 is not set
# BR2_PACKAGE_PHP_EXT_SIMPLEXML is not set
BR2_PACKAGE_PHP_EXT_ZLIB=y
# BR2_PACKAGE_PHP_EXT_EXIF is not set
# BR2_PACKAGE_PHP_EXT_FTP is not set
# BR2_PACKAGE_PHP_EXT_GETTEXT is not set
# BR2_PACKAGE_PHP_EXT_GMP is not set
# BR2_PACKAGE_PHP_EXT_JSON is not set
# BR2_PACKAGE_PHP_EXT_READLINE is not set
# BR2_PACKAGE_PHP_EXT_NCURSES is not set
BR2_PACKAGE_PHP_EXT_PCRE=y
# BR2_PACKAGE_PHP_EXT_PCNTL is not set
# BR2_PACKAGE_PHP_EXT_SYSVMSG is not set
# BR2_PACKAGE_PHP_EXT_SYSVSEM is not set
# BR2_PACKAGE_PHP_EXT_SYSVSHM is not set
# BR2_PACKAGE_PHP_EXT_ZIP is not set
# BR2_PACKAGE_PHP_EXT_FILTER is not set
# BR2_PACKAGE_PHP_EXT_CALENDAR is not set

#
# Database extensions
#
# BR2_PACKAGE_PHP_EXT_SQLITE is not set
# BR2_PACKAGE_PHP_EXT_PDO is not set
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_DEV=y
# BR2_PACKAGE_PYTHON_PY_ONLY is not set
# BR2_PACKAGE_PYTHON_PYC_ONLY is not set
BR2_PACKAGE_PYTHON_PY_PYC=y

#
# The following modules are unusual or require extra libraries
#
# BR2_PACKAGE_PYTHON_BSDDB is not set
BR2_PACKAGE_PYTHON_CODECSCJK=y
# BR2_PACKAGE_PYTHON_CURSES is not set
# BR2_PACKAGE_PYTHON_PYEXPAT is not set
# BR2_PACKAGE_PYTHON_READLINE is not set
# BR2_PACKAGE_PYTHON_SSL is not set
# BR2_PACKAGE_PYTHON_TKINTER is not set
BR2_PACKAGE_PYTHON_UNICODEDATA=y
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
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
BR2_PACKAGE_LIBSYSFS=y

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
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y

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
BR2_PACKAGE_NEON=y
BR2_PACKAGE_NEON_ZLIB=y
BR2_PACKAGE_NEON_SSL=y
# BR2_PACKAGE_NEON_EXPAT is not set
BR2_PACKAGE_NEON_LIBXML2=y
# BR2_PACKAGE_NEON_NOXML is not set
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
BR2_PACKAGE_LIBELF=y
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBOIL is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
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
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
BR2_PACKAGE_LIBXML2=y
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
BR2_PACKAGE_BRIDGE=y
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCP is not set
# BR2_PACKAGE_DNSMASQ is not set
BR2_PACKAGE_DROPBEAR=y
# BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS is not set
BR2_PACKAGE_ETHTOOL=y
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
BR2_PACKAGE_IPERF=y
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
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
# BR2_PACKAGE_NFS_UTILS is not set
BR2_PACKAGE_NTP=y
# BR2_PACKAGE_NTP_SNTP is not set
# BR2_PACKAGE_NTP_NTP_KEYGEN is not set
# BR2_PACKAGE_NTP_NTPDC is not set
# BR2_PACKAGE_NTP_NTPQ is not set
# BR2_PACKAGE_NTP_TICKADJ is not set
# BR2_PACKAGE_NUTTCP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
BR2_PACKAGE_RSYNC=y
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SQUID is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
BR2_PACKAGE_TTCP=y
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Package managers
#
BR2_PACKAGE_IPKG=y
# BR2_PACKAGE_RPM is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BASH is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_DIALOG is not set
BR2_PACKAGE_FILE=y
# BR2_PACKAGE_LOCKFILE_PROGS is not set
BR2_PACKAGE_LOGROTATE=y
BR2_PACKAGE_SCREEN=y
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_WHICH is not set

#
# System tools
#
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_UTIL-LINUX is not set

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_LESS is not set
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_VIM is not set

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT="/home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.11/postcfg.sh"
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
# BR2_TARGET_ROOTFS_EXT2_NONE is not set
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
BR2_TARGET_ROOTFS_EXT2_BZIP2=y
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
BR2_TARGET_ROOTFS_JFFS2=y
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K is not set
BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
# BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
# BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
# BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
# BR2_JFFS2_TARGET_SREC is not set
# BR2_TARGET_ROOTFS_JFFS2_PAD is not set
# BR2_TARGET_ROOTFS_JFFS2_LE is not set
BR2_TARGET_ROOTFS_JFFS2_BE=y
BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
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
