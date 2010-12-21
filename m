From: Chris Schaefer <chris@dtzq.com>
Date: Mon, 20 Dec 2010 20:26:38 -0500
Subject: [Buildroot] [PATCH] bare-bone support for Soekris net4501
Message-ID: <AANLkTim9KWDfq9pkkUodr19FVTNBZsAiYYLt258Uux0d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had needed bare-bone configs (kernel, buildroot, busybox, uClibc) as
a starting point for projects running on a Soekris net4501 device. I'v
attached what I have been using in hopes it could benefit others. This
is my first experience w/ buildroot so please let me know any
feedback/suggestions.


Signed-off-by: Chris Schaefer <chris@dtzq.com>
---
diff --git a/configs/soekris-net4501_defconfig
b/configs/soekris-net4501_defconfig
new file mode 100644
index 0000000..9deaad5
--- /dev/null
+++ b/configs/soekris-net4501_defconfig
@@ -0,0 +1,889 @@
+#
+# Automatically generated make config: don't edit
+# Buildroot version: 2011.02-git-00078-g767dce8-dirty
+# Sun Dec 19 13:13:41 2010
+#
+BR2_HAVE_DOT_CONFIG=y
+# BR2_arm is not set
+# BR2_armeb is not set
+# BR2_avr32 is not set
+BR2_i386=y
+# BR2_mips is not set
+# BR2_mipsel is not set
+# BR2_powerpc is not set
+# BR2_sh is not set
+# BR2_sh64 is not set
+# BR2_sparc is not set
+# BR2_x86_64 is not set
+# BR2_xtensa is not set
+# BR2_x86_i386 is not set
+BR2_x86_i486=y
+# BR2_x86_i586 is not set
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
+# BR2_x86_c32 is not set
+# BR2_x86_winchip_c6 is not set
+# BR2_x86_winchip2 is not set
+BR2_ARCH="i486"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_TUNE="i486"
+BR2_GCC_TARGET_ARCH="i486"
+
+#
+# Build options
+#
+
+#
+# Commands
+#
+BR2_WGET="wget --passive-ftp -nd -t 3"
+BR2_SVN="svn"
+BR2_BZR="bzr"
+BR2_GIT="git"
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
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
+BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
+BR2_JLEVEL=4
+# BR2_CCACHE is not set
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
+# Toolchain
+#
+BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_EXTERNAL is not set
+# BR2_TOOLCHAIN_CTNG is not set
+
+#
+# Kernel Header Options
+#
+BR2_KERNEL_HEADERS_2_6_34=y
+# BR2_KERNEL_HEADERS_2_6_35 is not set
+# BR2_KERNEL_HEADERS_2_6_36 is not set
+# BR2_KERNEL_HEADERS_VERSION is not set
+# BR2_KERNEL_HEADERS_SNAP is not set
+BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
+
+#
+# uClibc Options
+#
+# BR2_UCLIBC_VERSION_0_9_30 is not set
+BR2_UCLIBC_VERSION_0_9_31=y
+# BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.31"
+BR2_UCLIBC_CONFIG="target/device/soekris/net4501/uClibc.config"
+# BR2_PTHREAD_DEBUG is not set
+# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
+
+#
+# Binutils Options
+#
+# BR2_BINUTILS_VERSION_2_20 is not set
+BR2_BINUTILS_VERSION_2_20_1=y
+BR2_BINUTILS_VERSION="2.20.1"
+BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
+
+#
+# GCC Options
+#
+# BR2_GCC_VERSION_4_2_4 is not set
+BR2_GCC_VERSION_4_3_X=y
+# BR2_GCC_VERSION_4_4_X is not set
+# BR2_GCC_VERSION_4_5_X is not set
+# BR2_GCC_VERSION_SNAP is not set
+BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
+BR2_GCC_VERSION="4.3.5"
+BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+# BR2_GCC_CROSS_OBJC is not set
+# BR2_GCC_CROSS_FORTRAN is not set
+# BR2_INSTALL_OBJC is not set
+# BR2_INSTALL_FORTRAN is not set
+BR2_GCC_SHARED_LIBGCC=y
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
+BR2_TOOLCHAIN_HAS_THREADS=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_ENABLE_LOCALE_WHITELIST="C en_US"
+BR2_NEEDS_GETTEXT=y
+BR2_TARGET_OPTIMIZATION="-pipe"
+
+#
+# Toolchain Options
+#
+# BR2_TOOLCHAIN_BUILDROOT_LARGEFILE is not set
+# BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 is not set
+# BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set
+# BR2_TOOLCHAIN_BUILDROOT_WCHAR is not set
+# BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
+# BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION is not set
+# BR2_TOOLCHAIN_BUILDROOT_CXX is not set
+# BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
+
+#
+# System configuration
+#
+BR2_TARGET_GENERIC_HOSTNAME="soekris4501"
+BR2_TARGET_GENERIC_ISSUE="soekris4501"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600=y
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200 is not set
+BR2_TARGET_GENERIC_GETTY_BAUDRATE="9600"
+
+#
+# Package Selection for the target
+#
+BR2_PACKAGE_BUSYBOX=y
+# BR2_BUSYBOX_VERSION_1_16_X is not set
+BR2_BUSYBOX_VERSION_1_17_X=y
+# BR2_BUSYBOX_VERSION_1_18_X is not set
+# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
+BR2_BUSYBOX_VERSION="1.17.4"
+BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
+BR2_PACKAGE_BUSYBOX_CONFIG="target/device/soekris/net4501/busybox.config"
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_CUSTOMIZE is not set
+
+#
+# Audio and video libraries and applications
+#
+# BR2_PACKAGE_ALSA_LIB is not set
+
+#
+# alsa-utils requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
+
+#
+# ffmpeg requires a toolchain with LARGEFILE support
+#
+
+#
+# gstreamer requires a toolchain with WCHAR support
+#
+
+#
+# gst-ffmpeg requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LIBCDAUDIO is not set
+
+#
+# libdvdread requires a toolchain with LARGEFILE support
+#
+
+#
+# libdvdnav requires a toolchain with LARGEFILE support
+#
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
+# BR2_PACKAGE_LIBMPEG2 is not set
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
+# swfdec requires a toolchain with WCHAR and C++ support
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
+# BR2_PACKAGE_XZ is not set
+
+#
+# Debugging, profiling and benchmark
+#
+# BR2_PACKAGE_DHRYSTONE is not set
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
+# BR2_PACKAGE_LTP_TESTSUITE is not set
+# BR2_PACKAGE_LTRACE is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_NETPERF is not set
+
+#
+# oprofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_STRACE is not set
+# BR2_PACKAGE_WHETSTONE is not set
+# BR2_PACKAGE_VALGRIND is not set
+
+#
+# Development tools
+#
+# BR2_PACKAGE_AUTOCONF is not set
+# BR2_PACKAGE_AUTOMAKE is not set
+# BR2_PACKAGE_BISON is not set
+# BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CCACHE is not set
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
+# BR2_PACKAGE_LIBGMP is not set
+
+#
+# gperf requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_LIBMPC is not set
+# BR2_PACKAGE_LIBMPFR is not set
+# BR2_PACKAGE_LIBTOOL is not set
+
+#
+# m4 requires a toolchain with WCHAR support
+#
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
+# Graphic applications
+#
+
+#
+# rrdtool requires a toolchain with WCHAR support
+#
+
+#
+# graphic libraries
+#
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_FBGRAB is not set
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
+# midori requires C++, WCHAR in toolchain and libgtk2
+#
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_ACPID is not set
+
+#
+# cdrkit requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_CRAMFS is not set
+
+#
+# dbus not available (need expat or libxml2)
+#
+
+#
+# dmraid requires a toolchain with LARGEFILE support
+#
+
+#
+# dosfstools requires a toolchain with LARGEFILE support
+#
+
+#
+# e2fsprogs requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
+# BR2_PACKAGE_GENEXT2FS is not set
+# BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_GPSD is not set
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
+# BR2_PACKAGE_KBD is not set
+# BR2_PACKAGE_LM_SENSORS is not set
+# BR2_PACKAGE_LSUIO is not set
+
+#
+# lvm2 requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_MAKEDEVS is not set
+# BR2_PACKAGE_MDADM is not set
+
+#
+# memtester requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_MTD is not set
+
+#
+# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
+#
+
+#
+# ntfsprogs requires a toolchain with WCHAR and LARGEFILE support
+#
+# BR2_PACKAGE_PCIUTILS is not set
+# BR2_PACKAGE_RNG_TOOLS is not set
+# BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SMARTMONTOOLS is not set
+
+#
+# squashfs requires a toolchain with LARGEFILE support
+#
+
+#
+# sshfs requires a toolchain with LARGEFILE and WCHAR support
+#
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_UDEV is not set
+# BR2_PACKAGE_USB_MODESWITCH is not set
+# BR2_PACKAGE_USBMOUNT is not set
+
+#
+# usbutils requires a toolchain with PROGRAM_INVOCATION support
+#
+# BR2_PACKAGE_WIPE is not set
+
+#
+# xfsprogs requires a toolchain with LARGEFILE support
+#
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
+
+#
+# libfuse requires a toolchain with LARGEFILE support
+#
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
+# libgtk2 requires a toolchain with WCHAR and C++ support
+#
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBSVGTINY is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+
+#
+# pango requires a toolchain with WCHAR and C++ support
+#
+# BR2_PACKAGE_PIXMAN is not set
+# BR2_PACKAGE_TIFF is not set
+
+#
+# webkit requires C++, WCHAR in toolchain and libgtk2
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
+# BR2_PACKAGE_LIBNL is not set
+# BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBRSYNC is not set
+
+#
+# libsoup requires a toolchain with WCHAR support
+#
+
+#
+# libupnp requires a toolchain with LARGEFILE support
+#
+
+#
+# Other
+#
+# BR2_PACKAGE_ARGP_STANDALONE is not set
+# BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBCAP is not set
+# BR2_PACKAGE_LIBDAEMON is not set
+# BR2_PACKAGE_LIBELF is not set
+# BR2_PACKAGE_LIBEVENT is not set
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
+
+#
+# bind requires a toolchain with LARGEFILE support
+#
+
+#
+# bmon requires a toolchain with IPv6 support
+#
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
+
+#
+# iptables requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_IW is not set
+
+#
+# Kismet requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_XL2TP is not set
+# BR2_PACKAGE_LINKS is not set
+# BR2_PACKAGE_LRZSZ is not set
+# BR2_PACKAGE_MII_DIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+
+#
+# mutt requires a toolchain with WCHAR support
+#
+
+#
+# nbd requires a toolchain with WCHAR support
+#
+
+#
+# ncftp requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+
+#
+# nfs-utils requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_NTP is not set
+# BR2_PACKAGE_NUTTCP is not set
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
+# BR2_PACKAGE_RSH_REDONE is not set
+# BR2_PACKAGE_RSYNC is not set
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+
+#
+# Squid requires a toolchain with C++ and IPv6 support enabled
+#
+# BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_TTCP is not set
+
+#
+# udpcast requires a toolchain with LARGEFILE support
+#
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
+BR2_ROOTFS_DEVICE_TABLE="target/device/soekris/net4501/device_table.txt"
+# BR2_ROOTFS_SKELETON_DEFAULT is not set
+BR2_ROOTFS_SKELETON_CUSTOM=y
+BR2_ROOTFS_SKELETON_CUSTOM_PATH="target/device/soekris/net4501/target_skeleton"
+# BR2_TARGET_ROOTFS_CRAMFS is not set
+# BR2_TARGET_ROOTFS_CLOOP is not set
+# BR2_TARGET_ROOTFS_EXT2 is not set
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
+BR2_TARGET_GRUB_natsemi=y
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
+# BR2_TARGET_GRUB_via_rhine is not set
+# BR2_TARGET_GRUB_w89c840 is not set
+# BR2_TARGET_SYSLINUX is not set
+# BR2_TARGET_PXELINUX is not set
+# BR2_TARGET_UBOOT is not set
+
+#
+# Kernel
+#
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_2_6_36=y
+# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
+# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
+# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
+BR2_LINUX_KERNEL_VERSION="2.6.36.2"
+BR2_LINUX_KERNEL_PATCH=""
+# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="target/device/soekris/net4501/linux26.config"
+BR2_LINUX_KERNEL_BZIMAGE=y
diff --git a/target/device/soekris/net4501/busybox.config
b/target/device/soekris/net4501/busybox.config
new file mode 100644
index 0000000..8d61357
--- /dev/null
+++ b/target/device/soekris/net4501/busybox.config
@@ -0,0 +1,954 @@
+#
+# Automatically generated make config: don't edit
+# Busybox version: 1.17.1
+# Mon Dec 13 19:36:06 2010
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
+# CONFIG_INCLUDE_SUSv2 is not set
+# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
+# CONFIG_SHOW_USAGE is not set
+# CONFIG_FEATURE_VERBOSE_USAGE is not set
+# CONFIG_FEATURE_COMPRESS_USAGE is not set
+CONFIG_FEATURE_INSTALLER=y
+# CONFIG_LOCALE_SUPPORT is not set
+# CONFIG_UNICODE_SUPPORT is not set
+# CONFIG_UNICODE_USING_LOCALE is not set
+# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_SUBST_WCHAR=0
+CONFIG_LAST_SUPPORTED_WCHAR=0
+# CONFIG_UNICODE_COMBINING_WCHARS is not set
+# CONFIG_UNICODE_WIDE_WCHARS is not set
+# CONFIG_UNICODE_BIDI_SUPPORT is not set
+# CONFIG_UNICODE_NEUTRAL_TABLE is not set
+# CONFIG_UNICODE_PRESERVE_BROKEN is not set
+# CONFIG_LONG_OPTS is not set
+# CONFIG_FEATURE_DEVPTS is not set
+# CONFIG_FEATURE_CLEAN_UP is not set
+# CONFIG_FEATURE_UTMP is not set
+# CONFIG_FEATURE_WTMP is not set
+CONFIG_FEATURE_PIDFILE=y
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
+# CONFIG_LFS is not set
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
+CONFIG_PREFIX="./_install"
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
+# CONFIG_FEATURE_EDITING_FANCY_PROMPT is not set
+# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
+CONFIG_FEATURE_NON_POSIX_CP=y
+# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
+CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_MONOTONIC_SYSCALL=y
+CONFIG_IOCTL_HEX2STR_ERROR=y
+# CONFIG_FEATURE_HWIB is not set
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+# CONFIG_FEATURE_SEAMLESS_XZ is not set
+# CONFIG_FEATURE_SEAMLESS_LZMA is not set
+# CONFIG_FEATURE_SEAMLESS_BZ2 is not set
+# CONFIG_FEATURE_SEAMLESS_GZ is not set
+# CONFIG_FEATURE_SEAMLESS_Z is not set
+# CONFIG_AR is not set
+# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
+# CONFIG_FEATURE_AR_CREATE is not set
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
+# CONFIG_FEATURE_TAR_TO_COMMAND is not set
+# CONFIG_FEATURE_TAR_UNAME_GNAME is not set
+# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
+# CONFIG_FEATURE_TAR_SELINUX is not set
+# CONFIG_UNCOMPRESS is not set
+# CONFIG_UNLZMA is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
+# CONFIG_LZMA is not set
+# CONFIG_UNXZ is not set
+# CONFIG_XZ is not set
+# CONFIG_UNZIP is not set
+
+#
+# Coreutils
+#
+# CONFIG_BASENAME is not set
+CONFIG_CAT=y
+# CONFIG_DATE is not set
+# CONFIG_FEATURE_DATE_ISOFMT is not set
+# CONFIG_FEATURE_DATE_NANO is not set
+# CONFIG_FEATURE_DATE_COMPAT is not set
+CONFIG_TEST=y
+# CONFIG_FEATURE_TEST_64 is not set
+# CONFIG_TR is not set
+# CONFIG_FEATURE_TR_CLASSES is not set
+# CONFIG_FEATURE_TR_EQUIV is not set
+# CONFIG_CAL is not set
+# CONFIG_CATV is not set
+# CONFIG_CHGRP is not set
+CONFIG_CHMOD=y
+# CONFIG_CHOWN is not set
+# CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
+# CONFIG_CHROOT is not set
+# CONFIG_CKSUM is not set
+# CONFIG_COMM is not set
+CONFIG_CP=y
+# CONFIG_FEATURE_CP_LONG_OPTIONS is not set
+# CONFIG_CUT is not set
+# CONFIG_DD is not set
+# CONFIG_FEATURE_DD_SIGNAL_HANDLING is not set
+# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
+# CONFIG_FEATURE_DD_IBS_OBS is not set
+CONFIG_DF=y
+# CONFIG_FEATURE_DF_FANCY is not set
+# CONFIG_DIRNAME is not set
+# CONFIG_DOS2UNIX is not set
+# CONFIG_UNIX2DOS is not set
+CONFIG_DU=y
+CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
+CONFIG_ECHO=y
+CONFIG_FEATURE_FANCY_ECHO=y
+# CONFIG_ENV is not set
+# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
+# CONFIG_EXPAND is not set
+# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
+# CONFIG_EXPR is not set
+# CONFIG_EXPR_MATH_SUPPORT_64 is not set
+CONFIG_FALSE=y
+# CONFIG_FOLD is not set
+# CONFIG_FSYNC is not set
+# CONFIG_HEAD is not set
+# CONFIG_FEATURE_FANCY_HEAD is not set
+# CONFIG_HOSTID is not set
+CONFIG_ID=y
+# CONFIG_INSTALL is not set
+# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
+# CONFIG_LENGTH is not set
+CONFIG_LN=y
+# CONFIG_LOGNAME is not set
+CONFIG_LS=y
+CONFIG_FEATURE_LS_FILETYPES=y
+CONFIG_FEATURE_LS_FOLLOWLINKS=y
+CONFIG_FEATURE_LS_RECURSIVE=y
+CONFIG_FEATURE_LS_SORTFILES=y
+CONFIG_FEATURE_LS_TIMESTAMPS=y
+CONFIG_FEATURE_LS_USERNAME=y
+# CONFIG_FEATURE_LS_COLOR is not set
+# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
+# CONFIG_MD5SUM is not set
+CONFIG_MKDIR=y
+# CONFIG_FEATURE_MKDIR_LONG_OPTIONS is not set
+# CONFIG_MKFIFO is not set
+CONFIG_MKNOD=y
+CONFIG_MV=y
+# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
+# CONFIG_NICE is not set
+# CONFIG_NOHUP is not set
+# CONFIG_OD is not set
+# CONFIG_PRINTENV is not set
+# CONFIG_PRINTF is not set
+CONFIG_PWD=y
+# CONFIG_READLINK is not set
+# CONFIG_FEATURE_READLINK_FOLLOW is not set
+# CONFIG_REALPATH is not set
+CONFIG_RM=y
+CONFIG_RMDIR=y
+# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
+# CONFIG_SEQ is not set
+# CONFIG_SHA1SUM is not set
+# CONFIG_SHA256SUM is not set
+# CONFIG_SHA512SUM is not set
+CONFIG_SLEEP=y
+# CONFIG_FEATURE_FANCY_SLEEP is not set
+# CONFIG_FEATURE_FLOAT_SLEEP is not set
+# CONFIG_SORT is not set
+# CONFIG_FEATURE_SORT_BIG is not set
+# CONFIG_SPLIT is not set
+# CONFIG_FEATURE_SPLIT_FANCY is not set
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+# CONFIG_STTY is not set
+# CONFIG_SUM is not set
+CONFIG_SYNC=y
+# CONFIG_TAC is not set
+CONFIG_TAIL=y
+CONFIG_FEATURE_FANCY_TAIL=y
+# CONFIG_TEE is not set
+# CONFIG_FEATURE_TEE_USE_BLOCK_IO is not set
+CONFIG_TOUCH=y
+CONFIG_TRUE=y
+# CONFIG_TTY is not set
+CONFIG_UNAME=y
+# CONFIG_UNEXPAND is not set
+# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
+# CONFIG_UNIQ is not set
+# CONFIG_USLEEP is not set
+# CONFIG_UUDECODE is not set
+# CONFIG_UUENCODE is not set
+# CONFIG_WC is not set
+# CONFIG_FEATURE_WC_LARGE is not set
+# CONFIG_WHO is not set
+# CONFIG_WHOAMI is not set
+# CONFIG_YES is not set
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
+# CONFIG_FEATURE_MD5_SHA1_SUM_CHECK is not set
+
+#
+# Console Utilities
+#
+# CONFIG_CHVT is not set
+# CONFIG_FGCONSOLE is not set
+# CONFIG_CLEAR is not set
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
+# CONFIG_FEATURE_LOADFONT_PSF2 is not set
+# CONFIG_FEATURE_LOADFONT_RAW is not set
+
+#
+# Debian Utilities
+#
+# CONFIG_MKTEMP is not set
+# CONFIG_PIPE_PROGRESS is not set
+# CONFIG_RUN_PARTS is not set
+# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
+# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
+# CONFIG_START_STOP_DAEMON is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_FANCY is not set
+# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
+# CONFIG_WHICH is not set
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
+CONFIG_FEATURE_VI_ASK_TERMINAL=y
+CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_FEATURE_ALLOW_EXEC=y
+
+#
+# Finding Utilities
+#
+CONFIG_FIND=y
+CONFIG_FEATURE_FIND_PRINT0=y
+CONFIG_FEATURE_FIND_MTIME=y
+CONFIG_FEATURE_FIND_MMIN=y
+CONFIG_FEATURE_FIND_PERM=y
+CONFIG_FEATURE_FIND_TYPE=y
+CONFIG_FEATURE_FIND_XDEV=y
+CONFIG_FEATURE_FIND_MAXDEPTH=y
+CONFIG_FEATURE_FIND_NEWER=y
+CONFIG_FEATURE_FIND_INUM=y
+CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_FEATURE_FIND_USER=y
+CONFIG_FEATURE_FIND_GROUP=y
+CONFIG_FEATURE_FIND_NOT=y
+CONFIG_FEATURE_FIND_DEPTH=y
+CONFIG_FEATURE_FIND_PAREN=y
+CONFIG_FEATURE_FIND_SIZE=y
+CONFIG_FEATURE_FIND_PRUNE=y
+CONFIG_FEATURE_FIND_DELETE=y
+CONFIG_FEATURE_FIND_PATH=y
+CONFIG_FEATURE_FIND_REGEX=y
+# CONFIG_FEATURE_FIND_CONTEXT is not set
+CONFIG_FEATURE_FIND_LINKS=y
+CONFIG_GREP=y
+CONFIG_FEATURE_GREP_EGREP_ALIAS=y
+CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_FEATURE_GREP_CONTEXT=y
+CONFIG_XARGS=y
+CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION=y
+CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
+CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+
+#
+# Init Utilities
+#
+# CONFIG_BOOTCHARTD is not set
+# CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
+# CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_FEATURE_KILL_REMOVED=y
+CONFIG_FEATURE_KILL_DELAY=0
+CONFIG_FEATURE_INIT_SCTTY=y
+CONFIG_FEATURE_INIT_SYSLOG=y
+CONFIG_FEATURE_EXTRA_QUIET=y
+CONFIG_FEATURE_INIT_COREDUMPS=y
+# CONFIG_FEATURE_INITRD is not set
+CONFIG_HALT=y
+# CONFIG_FEATURE_CALL_TELINIT is not set
+CONFIG_TELINIT_PATH=""
+# CONFIG_MESG is not set
+
+#
+# Login/Password Management Utilities
+#
+CONFIG_FEATURE_SHADOWPASSWDS=y
+# CONFIG_USE_BB_PWD_GRP is not set
+# CONFIG_USE_BB_SHADOW is not set
+CONFIG_USE_BB_CRYPT=y
+# CONFIG_USE_BB_CRYPT_SHA is not set
+# CONFIG_ADDGROUP is not set
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_DELGROUP is not set
+# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
+# CONFIG_FEATURE_CHECK_NAMES is not set
+# CONFIG_ADDUSER is not set
+# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+CONFIG_FIRST_SYSTEM_ID=0
+CONFIG_LAST_SYSTEM_ID=0
+# CONFIG_DELUSER is not set
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
+# CONFIG_PAM is not set
+# CONFIG_LOGIN_SCRIPTS is not set
+# CONFIG_FEATURE_NOLOGIN is not set
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+# CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
+# CONFIG_CRYPTPW is not set
+# CONFIG_CHPASSWD is not set
+CONFIG_SU=y
+CONFIG_FEATURE_SU_SYSLOG=y
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
+# CONFIG_SULOGIN is not set
+# CONFIG_VLOCK is not set
+
+#
+# Linux Ext2 FS Progs
+#
+# CONFIG_CHATTR is not set
+# CONFIG_FSCK is not set
+# CONFIG_LSATTR is not set
+# CONFIG_TUNE2FS is not set
+
+#
+# Linux Module Utilities
+#
+# CONFIG_MODINFO is not set
+# CONFIG_MODPROBE_SMALL is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
+# CONFIG_INSMOD is not set
+# CONFIG_RMMOD is not set
+# CONFIG_LSMOD is not set
+# CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
+# CONFIG_MODPROBE is not set
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
+# CONFIG_FEATURE_CHECK_TAINTED_MODULE is not set
+# CONFIG_FEATURE_MODUTILS_ALIAS is not set
+# CONFIG_FEATURE_MODUTILS_SYMBOLS is not set
+CONFIG_DEFAULT_MODULES_DIR=""
+CONFIG_DEFAULT_DEPMOD_FILE=""
+
+#
+# Linux System Utilities
+#
+# CONFIG_REV is not set
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
+# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
+# CONFIG_FEATURE_FDISK_WRITABLE is not set
+# CONFIG_FEATURE_AIX_LABEL is not set
+# CONFIG_FEATURE_SGI_LABEL is not set
+# CONFIG_FEATURE_SUN_LABEL is not set
+# CONFIG_FEATURE_OSF_LABEL is not set
+# CONFIG_FEATURE_FDISK_ADVANCED is not set
+# CONFIG_FINDFS is not set
+# CONFIG_FLOCK is not set
+# CONFIG_FREERAMDISK is not set
+# CONFIG_FSCK_MINIX is not set
+# CONFIG_MKFS_EXT2 is not set
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
+# CONFIG_MKFS_REISER is not set
+# CONFIG_MKFS_VFAT is not set
+# CONFIG_GETOPT is not set
+# CONFIG_FEATURE_GETOPT_LONG is not set
+# CONFIG_HEXDUMP is not set
+# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
+# CONFIG_HD is not set
+# CONFIG_HWCLOCK is not set
+# CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS is not set
+# CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS is not set
+# CONFIG_IPCRM is not set
+# CONFIG_IPCS is not set
+# CONFIG_LOSETUP is not set
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
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+# CONFIG_FEATURE_MOUNT_VERBOSE is not set
+# CONFIG_FEATURE_MOUNT_HELPERS is not set
+# CONFIG_FEATURE_MOUNT_LABEL is not set
+# CONFIG_FEATURE_MOUNT_NFS is not set
+# CONFIG_FEATURE_MOUNT_CIFS is not set
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
+# CONFIG_FEATURE_MOUNT_LOOP is not set
+# CONFIG_FEATURE_MOUNT_LOOP_CREATE is not set
+# CONFIG_FEATURE_MTAB_SUPPORT is not set
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
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_CONSPY is not set
+# CONFIG_UBIATTACH is not set
+# CONFIG_UBIDETACH is not set
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
+# CONFIG_RFKILL is not set
+# CONFIG_RUNLEVEL is not set
+# CONFIG_RX is not set
+# CONFIG_SETSID is not set
+# CONFIG_STRINGS is not set
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+# CONFIG_TIME is not set
+# CONFIG_TIMEOUT is not set
+# CONFIG_TTYSIZE is not set
+# CONFIG_VOLNAME is not set
+# CONFIG_WALL is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Networking Utilities
+#
+# CONFIG_NC is not set
+# CONFIG_NC_SERVER is not set
+# CONFIG_NC_EXTRA is not set
+# CONFIG_NC_110_COMPAT is not set
+# CONFIG_FEATURE_IPV6 is not set
+# CONFIG_FEATURE_UNIX_LOCAL is not set
+# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
+# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
+# CONFIG_ARP is not set
+# CONFIG_ARPING is not set
+# CONFIG_BRCTL is not set
+# CONFIG_FEATURE_BRCTL_FANCY is not set
+# CONFIG_FEATURE_BRCTL_SHOW is not set
+# CONFIG_DNSD is not set
+# CONFIG_ETHER_WAKE is not set
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
+# CONFIG_FEATURE_IFCONFIG_SLIP is not set
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
+CONFIG_INETD=y
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+# CONFIG_FEATURE_INETD_RPC is not set
+# CONFIG_IP is not set
+# CONFIG_FEATURE_IP_ADDRESS is not set
+# CONFIG_FEATURE_IP_LINK is not set
+# CONFIG_FEATURE_IP_ROUTE is not set
+# CONFIG_FEATURE_IP_TUNNEL is not set
+# CONFIG_FEATURE_IP_RULE is not set
+# CONFIG_FEATURE_IP_SHORT_FORMS is not set
+# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_IPTUNNEL is not set
+# CONFIG_IPRULE is not set
+# CONFIG_IPCALC is not set
+# CONFIG_FEATURE_IPCALC_FANCY is not set
+# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+# CONFIG_NAMEIF is not set
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+CONFIG_NETSTAT=y
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
+# CONFIG_TCPSVD is not set
+CONFIG_TELNET=y
+CONFIG_FEATURE_TELNET_TTYPE=y
+CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+CONFIG_TELNETD=y
+# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
+# CONFIG_TFTP is not set
+# CONFIG_TFTPD is not set
+# CONFIG_FEATURE_TFTP_GET is not set
+# CONFIG_FEATURE_TFTP_PUT is not set
+# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
+# CONFIG_TFTP_DEBUG is not set
+# CONFIG_TRACEROUTE is not set
+# CONFIG_TRACEROUTE6 is not set
+# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
+# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
+# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
+# CONFIG_TUNCTL is not set
+# CONFIG_FEATURE_TUNCTL_UG is not set
+# CONFIG_UDHCPD is not set
+# CONFIG_DHCPRELAY is not set
+# CONFIG_DUMPLEASES is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+CONFIG_DHCPD_LEASES_FILE=""
+# CONFIG_UDHCPC is not set
+# CONFIG_FEATURE_UDHCPC_ARPING is not set
+# CONFIG_FEATURE_UDHCP_PORT is not set
+CONFIG_UDHCP_DEBUG=0
+# CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_UDHCPC_DEFAULT_SCRIPT=""
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=0
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
+# CONFIG_UDPSVD is not set
+# CONFIG_VCONFIG is not set
+# CONFIG_WGET is not set
+# CONFIG_FEATURE_WGET_STATUSBAR is not set
+# CONFIG_FEATURE_WGET_AUTHENTICATION is not set
+# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+# CONFIG_ZCIP is not set
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
+# CONFIG_SMEMCAP is not set
+CONFIG_FREE=y
+# CONFIG_FUSER is not set
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+# CONFIG_KILLALL5 is not set
+# CONFIG_NMETER is not set
+# CONFIG_PGREP is not set
+# CONFIG_PIDOF is not set
+# CONFIG_FEATURE_PIDOF_SINGLE is not set
+# CONFIG_FEATURE_PIDOF_OMIT is not set
+# CONFIG_PKILL is not set
+CONFIG_PS=y
+CONFIG_FEATURE_PS_WIDE=y
+# CONFIG_FEATURE_PS_TIME is not set
+# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
+# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
+# CONFIG_RENICE is not set
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
+# CONFIG_WATCH is not set
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
+# CONFIG_ASH_RANDOM_SUPPORT is not set
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
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+# CONFIG_FEATURE_BASH_IS_ASH is not set
+# CONFIG_FEATURE_BASH_IS_HUSH is not set
+CONFIG_FEATURE_BASH_IS_NONE=y
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
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
+# CONFIG_FEATURE_IPC_SYSLOG is not set
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
+CONFIG_KLOGD=y
+CONFIG_LOGGER=y
diff --git a/target/device/soekris/net4501/device_table.txt
b/target/device/soekris/net4501/device_table.txt
new file mode 100644
index 0000000..a964d6a
--- /dev/null
+++ b/target/device/soekris/net4501/device_table.txt
@@ -0,0 +1,62 @@
+# When building a target filesystem, it is desirable to not have to
+# become root and then run 'mknod' a thousand times. ?Using a device
+# table you can create device nodes and directories "on the fly".
+#
+# This is a sample device table file for use with genext2fs. ?You can
+# do all sorts of interesting things with a device table file. ?For
+# example, if you want to adjust the permissions on a particular file
+# you can just add an entry like:
+# ? /sbin/foobar ? ? ? ?f ? ? ? 2755 ? ?0 ? ? ? 0 ? ? ? - ? ? ? -
? - ? ? ? - ? ? ? -
+# and (assuming the file /sbin/foobar exists) it will be made setuid
+# root (regardless of what its permissions are on the host filesystem.
+# Furthermore, you can use a single table entry to create a many device
+# minors. ?For example, if I wanted to create /dev/hda and /dev/hda[0-15]
+# I could just use the following two table entries:
+# ? /dev/hda ? ?b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 3 ? ? ? 0 ? ? ? 0
? 0 ? ? ? -
+# ? /dev/hda ? ?b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 3 ? ? ? 1 ? ? ? 1
? 1 ? ? ? 15
+#
+# Device table entries take the form of:
+# <name> ? ?<type> ? ? ?<mode> ?<uid> ? <gid> ? <major> <minor>
<start> <inc> ? <count>
+# where name is the file name, ?type can be one of:
+# ? ? ? f ? ? ? A regular file
+# ? ? ? d ? ? ? Directory
+# ? ? ? c ? ? ? Character special device file
+# ? ? ? b ? ? ? Block special device file
+# ? ? ? p ? ? ? Fifo (named pipe)
+# uid is the user id for the target file, gid is the group id for the
+# target file. ?The rest of the entries (major, minor, etc) apply only
+# to device special files.
+
+# Have fun
+# -Erik Andersen <andersen@codepoet.org>
+#
+
+#<name> ? ? ? ? ? ? ? ?<type> ?<mode> ?<uid> ? <gid> ? <major>
<minor> <start> <inc> ? <count>
+/dev ? ? ? ? ? d ? ? ? 755 ? ? 0 ? ? ? 0 ? ? ? - ? ? ? - ? ? ? -
 - ? ? ? -
+/dev/shm ? ? ? d ? ? ? 755 ? ? 0 ? ? ? 0 ? ? ? - ? ? ? - ? ? ? -
 - ? ? ? -
+/tmp ? ? ? ? ? d ? ? ? 1777 ? ?0 ? ? ? 0 ? ? ? - ? ? ? - ? ? ? -
 - ? ? ? -
+/etc ? ? ? ? ? d ? ? ? 755 ? ? 0 ? ? ? 0 ? ? ? - ? ? ? - ? ? ? -
 - ? ? ? -
+/home/default ?d ? ? ? 2755 ? ?1000 ? ?1000 ? ?- ? ? ? - ? ? ? -
 - ? ? ? -
+#<name> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?<type> ?<mode> ?<uid>
 <gid> ? <major> <minor> <start> <inc> ? <count>
+/bin/busybox ? ? ? ? ? ? ? ? ? ? ? ? ? f ? ? ? 4755 ? ?0 ? ? ? 0
 - ? ? ? - ? ? ? - ? ? ? - ? ? ? -
+/etc/shadow ? ? ? ? ? ? ? ? ? ? ? ? ? ?f ? ? ? 600 ? ? 0 ? ? ? 0
 - ? ? ? - ? ? ? - ? ? ? - ? ? ? -
+/etc/passwd ? ? ? ? ? ? ? ? ? ? ? ? ? ?f ? ? ? 644 ? ? 0 ? ? ? 0
 - ? ? ? - ? ? ? - ? ? ? - ? ? ? -
+# Normal system devices
+/dev/mem ? ? ? c ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 1 ? ? ? 0
 0 ? ? ? -
+/dev/kmem ? ? ?c ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 2 ? ? ? 0
 0 ? ? ? -
+/dev/null ? ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 3 ? ? ? 0
 0 ? ? ? -
+/dev/zero ? ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 5 ? ? ? 0
 0 ? ? ? -
+/dev/random ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 8 ? ? ? 0
 0 ? ? ? -
+/dev/urandom ? c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 9 ? ? ? 0
 0 ? ? ? -
+/dev/ram ? ? ? b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 1 ? ? ? 0
 0 ? ? ? -
+/dev/ram ? ? ? b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 1 ? ? ? 0 ? ? ? 0
 1 ? ? ? 4
+/dev/loop ? ? ?b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 7 ? ? ? 0 ? ? ? 0
 1 ? ? ? 2
+/dev/console ? c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 5 ? ? ? 1 ? ? ? -
 - ? ? ? -
+/dev/tty ? ? ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 5 ? ? ? 0 ? ? ? -
? - ? ? ? -
+/dev/tty ? ? ? ?c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 4 ? ? ? 0 ? ? ? 0
? 1 ? ? ? 4
+/dev/ttyS ? ? ? c ? ? ? 666 ? ? 0 ? ? ? 0 ? ? ? 4 ? ? ? 64 ? ? ?0
? 1 ? ? ? 1
+
+# IDE Devices
+/dev/hda ? ? ? b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 3 ? ? ? 0 ? ? ? 0
 0 ? ? ? -
+/dev/hda ? ? ? b ? ? ? 640 ? ? 0 ? ? ? 0 ? ? ? 3 ? ? ? 1 ? ? ? 1
 1 ? ? ? 1
+
diff --git a/target/device/soekris/net4501/linux26.config
b/target/device/soekris/net4501/linux26.config
new file mode 100644
index 0000000..a6ba83b
--- /dev/null
+++ b/target/device/soekris/net4501/linux26.config
@@ -0,0 +1,968 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.36.2
+# Sun Dec 19 13:49:27 2010
+#
+# CONFIG_64BIT is not set
+CONFIG_X86_32=y
+# CONFIG_X86_64 is not set
+CONFIG_X86=y
+CONFIG_INSTRUCTION_DECODER=y
+CONFIG_OUTPUT_FORMAT="elf32-i386"
+CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
+CONFIG_GENERIC_CMOS_UPDATE=y
+CONFIG_CLOCKSOURCE_WATCHDOG=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_MMU=y
+CONFIG_ZONE_DMA=y
+# CONFIG_NEED_DMA_MAP_STATE is not set
+CONFIG_NEED_SG_DMA_LENGTH=y
+CONFIG_GENERIC_ISA_DMA=y
+CONFIG_GENERIC_IOMAP=y
+CONFIG_GENERIC_BUG=y
+CONFIG_GENERIC_HWEIGHT=y
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
+CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-ecx -fcall-saved-edx"
+CONFIG_KTIME_SCALAR=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+
+#
+# General setup
+#
+# CONFIG_EXPERIMENTAL is not set
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_LOCK_KERNEL=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_BZIP2=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_BZIP2 is not set
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
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
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
+# CONFIG_CGROUPS is not set
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+# CONFIG_UID16 is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_HOTPLUG is not set
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+# CONFIG_PCSPKR_PLATFORM is not set
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+# CONFIG_SHMEM is not set
+# CONFIG_AIO is not set
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_PCI_QUIRKS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
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
+CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
+CONFIG_HAVE_USER_RETURN_NOTIFIER=y
+CONFIG_HAVE_PERF_EVENTS_NMI=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+# CONFIG_IOSCHED_DEADLINE is not set
+CONFIG_IOSCHED_CFQ=y
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
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
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+CONFIG_SCHED_OMIT_FRAME_POINTER=y
+# CONFIG_PARAVIRT_GUEST is not set
+CONFIG_NO_BOOTMEM=y
+# CONFIG_MEMTEST is not set
+# CONFIG_M386 is not set
+CONFIG_M486=y
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
+# CONFIG_MGEODE_LX is not set
+# CONFIG_MCYRIXIII is not set
+# CONFIG_MVIAC3_2 is not set
+# CONFIG_MVIAC7 is not set
+# CONFIG_MCORE2 is not set
+# CONFIG_MATOM is not set
+# CONFIG_X86_GENERIC is not set
+CONFIG_X86_CPU=y
+CONFIG_X86_INTERNODE_CACHE_SHIFT=4
+CONFIG_X86_CMPXCHG=y
+CONFIG_X86_L1_CACHE_SHIFT=4
+CONFIG_X86_XADD=y
+# CONFIG_X86_PPRO_FENCE is not set
+CONFIG_X86_F00F_BUG=y
+CONFIG_X86_INVD_BUG=y
+CONFIG_X86_WP_WORKS_OK=y
+CONFIG_X86_INVLPG=y
+CONFIG_X86_BSWAP=y
+CONFIG_X86_POPAD_OK=y
+CONFIG_X86_ALIGNMENT_16=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=4
+# CONFIG_PROCESSOR_SELECT is not set
+CONFIG_CPU_SUP_INTEL=y
+CONFIG_CPU_SUP_CYRIX_32=y
+CONFIG_CPU_SUP_AMD=y
+CONFIG_CPU_SUP_CENTAUR=y
+CONFIG_CPU_SUP_TRANSMETA_32=y
+CONFIG_CPU_SUP_UMC_32=y
+# CONFIG_HPET_TIMER is not set
+# CONFIG_DMI is not set
+# CONFIG_IOMMU_HELPER is not set
+# CONFIG_IOMMU_API is not set
+CONFIG_NR_CPUS=1
+# CONFIG_PREEMPT_NONE is not set
+# CONFIG_PREEMPT_VOLUNTARY is not set
+CONFIG_PREEMPT=y
+# CONFIG_X86_UP_APIC is not set
+# CONFIG_X86_MCE is not set
+# CONFIG_VM86 is not set
+# CONFIG_TOSHIBA is not set
+# CONFIG_I8K is not set
+# CONFIG_X86_REBOOTFIXUPS is not set
+# CONFIG_MICROCODE is not set
+# CONFIG_X86_MSR is not set
+# CONFIG_X86_CPUID is not set
+CONFIG_NOHIGHMEM=y
+# CONFIG_HIGHMEM4G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+# CONFIG_X86_PAE is not set
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ILLEGAL_POINTER_VALUE=0
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
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
+# CONFIG_HZ_100 is not set
+# CONFIG_HZ_250 is not set
+# CONFIG_HZ_300 is not set
+CONFIG_HZ_1000=y
+CONFIG_HZ=1000
+# CONFIG_SCHED_HRTICK is not set
+# CONFIG_KEXEC is not set
+CONFIG_PHYSICAL_START=0x1000000
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
+CONFIG_PCI_GOANY=y
+CONFIG_PCI_BIOS=y
+CONFIG_PCI_DIRECT=y
+CONFIG_PCI_DOMAINS=y
+# CONFIG_PCI_CNB20LE_QUIRK is not set
+# CONFIG_PCIEPORTBUS is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCI_STUB is not set
+# CONFIG_PCI_IOV is not set
+CONFIG_ISA_DMA_API=y
+# CONFIG_ISA is not set
+# CONFIG_MCA is not set
+# CONFIG_SCx200 is not set
+# CONFIG_OLPC is not set
+# CONFIG_OLPC_OPENFIRMWARE is not set
+CONFIG_K8_NB=y
+
+#
+# Executable file formats / Emulations
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
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
+# CONFIG_XFRM_USER is not set
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+CONFIG_INET_LRO=y
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_PHONET is not set
+# CONFIG_NET_SCHED is not set
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
+# CONFIG_WIRELESS is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_CAIF is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_STANDALONE=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+# CONFIG_BLK_DEV is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+CONFIG_IDE=y
+
+#
+# Please see Documentation/ide/ide.txt for help/info on IDE drives
+#
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
+CONFIG_IDE_GENERIC=y
+# CONFIG_BLK_DEV_PLATFORM is not set
+# CONFIG_BLK_DEV_CMD640 is not set
+
+#
+# PCI IDE chipsets support
+#
+# CONFIG_BLK_DEV_GENERIC is not set
+# CONFIG_BLK_DEV_RZ1000 is not set
+# CONFIG_BLK_DEV_AEC62XX is not set
+# CONFIG_BLK_DEV_ALI15X3 is not set
+# CONFIG_BLK_DEV_AMD74XX is not set
+# CONFIG_BLK_DEV_ATIIXP is not set
+# CONFIG_BLK_DEV_CMD64X is not set
+# CONFIG_BLK_DEV_TRIFLEX is not set
+# CONFIG_BLK_DEV_CS5530 is not set
+# CONFIG_BLK_DEV_CS5535 is not set
+# CONFIG_BLK_DEV_CS5536 is not set
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
+# CONFIG_BLK_DEV_IDEDMA is not set
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
+# CONFIG_FIREWIRE_NOSY is not set
+# CONFIG_I2O is not set
+# CONFIG_MACINTOSH_DRIVERS is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=y
+# CONFIG_MII is not set
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
+CONFIG_NATSEMI=y
+# CONFIG_NE2K_PCI is not set
+# CONFIG_8139TOO is not set
+# CONFIG_R6040 is not set
+# CONFIG_SIS900 is not set
+# CONFIG_EPIC100 is not set
+# CONFIG_SMSC9420 is not set
+# CONFIG_SUNDANCE is not set
+# CONFIG_TLAN is not set
+# CONFIG_KS8851_MLL is not set
+# CONFIG_VIA_RHINE is not set
+# CONFIG_ATL2 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+# CONFIG_TR is not set
+# CONFIG_WLAN is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+
+#
+# CAIF transport drivers
+#
+# CONFIG_FDDI is not set
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
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_JOYDEV is not set
+# CONFIG_INPUT_EVDEV is not set
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+# CONFIG_SERIO_I8042 is not set
+# CONFIG_SERIO_SERPORT is not set
+# CONFIG_SERIO_CT82C710 is not set
+# CONFIG_SERIO_PCIPS2 is not set
+# CONFIG_SERIO_LIBPS2 is not set
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+# CONFIG_CONSOLE_TRANSLATIONS is not set
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+# CONFIG_DEVKMEM is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FIX_EARLYCON_MEM=y
+# CONFIG_SERIAL_8250_PCI is not set
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MFD_HSU is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_JSM is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_RTC is not set
+# CONFIG_GEN_RTC is not set
+# CONFIG_R3964 is not set
+# CONFIG_APPLICOM is not set
+# CONFIG_MWAVE is not set
+# CONFIG_PC8736x_GPIO is not set
+# CONFIG_NSC_GPIO is not set
+# CONFIG_CS5535_GPIO is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_HANGCHECK_TIMER is not set
+CONFIG_DEVPORT=y
+# CONFIG_RAMOOPS is not set
+# CONFIG_I2C is not set
+# CONFIG_SPI is not set
+
+#
+# PPS support
+#
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
+# CONFIG_GPIOLIB is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+# CONFIG_MFD_SUPPORT is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_AGP is not set
+# CONFIG_VGA_ARB is not set
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
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_INFINIBAND is not set
+# CONFIG_EDAC is not set
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
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
+# CONFIG_ISCSI_IBFT_FIND is not set
+
+#
+# File systems
+#
+# CONFIG_EXT2_FS is not set
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_FILE_LOCKING is not set
+CONFIG_FSNOTIFY=y
+# CONFIG_DNOTIFY is not set
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
+# CONFIG_MSDOS_FS is not set
+# CONFIG_VFAT_FS is not set
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+# CONFIG_PROC_KCORE is not set
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+# CONFIG_SYSFS is not set
+# CONFIG_HUGETLBFS is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_NLS is not set
+
+#
+# Kernel hacking
+#
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+# CONFIG_PRINTK_TIME is not set
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_ARCH_WANT_FRAME_POINTERS=y
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
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
+# CONFIG_ATOMIC64_SELFTEST is not set
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
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
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
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_PCBC is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_CRC32C_INTEL is not set
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_586 is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+# CONFIG_CRYPTO_TWOFISH_586 is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
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
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/target/device/soekris/net4501/target_skeleton/bin/.empty
b/target/device/soekris/net4501/target_skeleton/bin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/boot/grub/menu.lst
b/target/device/soekris/net4501/target_skeleton/boot/grub/menu.lst
new file mode 100644
index 0000000..68f9ef0
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/boot/grub/menu.lst
@@ -0,0 +1,8 @@
+hiddenmenu
+serial --unit=0 --speed=9600 --word=8 --parity=no --stop=1
+terminal serial
+timeout 0
+default 0
+title soekris
+root (hd0,0)
+kernel /boot/bzImage root=0x0301 rw console=ttyS0,9600n8 quiet
diff --git a/target/device/soekris/net4501/target_skeleton/dev/log
b/target/device/soekris/net4501/target_skeleton/dev/log
new file mode 120000
index 0000000..d96b3b1
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/dev/log
@@ -0,0 +1 @@
+../tmp/log
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/etc/TZ
b/target/device/soekris/net4501/target_skeleton/etc/TZ
new file mode 100644
index 0000000..9fcb2a3
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/TZ
@@ -0,0 +1 @@
+MST7MDT
diff --git a/target/device/soekris/net4501/target_skeleton/etc/fstab
b/target/device/soekris/net4501/target_skeleton/etc/fstab
new file mode 100644
index 0000000..812ce1b
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/fstab
@@ -0,0 +1,7 @@
+# /etc/fstab: static file system information.
+#
+# <file system> <mount pt> ? ? <type> ?<options> ? ? ? ? <dump> <pass>
+/dev/root ? ? ? / ? ? ? ? ? ? ?ext3 ? ? ro,noauto ? ? ? ? 0 ? ? ?1
+proc ? ? ? ? ? /proc ? ? ? ? ?proc ? ? defaults ? ? ? ? ?0 ? ? ?0
+devpts ? ? ? ? /dev/pts ? ? ? devpts ? defaults,gid=5,mode=620 ? 0 ? ? ?0
+tmpfs ? ? ? ? ? /tmp ? ? ? ? ? tmpfs ? ?defaults ? ? ? ? ?0 ? ? ?0
diff --git a/target/device/soekris/net4501/target_skeleton/etc/group
b/target/device/soekris/net4501/target_skeleton/etc/group
new file mode 100644
index 0000000..c600be0
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/group
@@ -0,0 +1,17 @@
+root:x:0:
+daemon:x:1:
+bin:x:2:
+sys:x:3:
+adm:x:4:
+tty:x:5:
+disk:x:6:
+wheel:x:10:root
+utmp:x:43:
+staff:x:50:
+haldaemon:x:68:
+dbus:x:81:
+netdev:x:82:
+nobody:x:99:
+nogroup:x:99:
+users:x:100:
+default:x:1000:
diff --git a/target/device/soekris/net4501/target_skeleton/etc/hostname
b/target/device/soekris/net4501/target_skeleton/etc/hostname
new file mode 100644
index 0000000..5b26b35
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/hostname
@@ -0,0 +1 @@
+buildroot
diff --git a/target/device/soekris/net4501/target_skeleton/etc/hosts
b/target/device/soekris/net4501/target_skeleton/etc/hosts
new file mode 100644
index 0000000..ba712fe
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/hosts
@@ -0,0 +1 @@
+127.0.0.1 ? ? ?localhost
diff --git a/target/device/soekris/net4501/target_skeleton/etc/init.d/rcS
b/target/device/soekris/net4501/target_skeleton/etc/init.d/rcS
new file mode 100755
index 0000000..de41153
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/init.d/rcS
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+
+# Start all init scripts in /etc/init.d
+# executing them in numerical order.
+#
+for i in /etc/init.d/S??* ;do
+
+ ? ? # Ignore dangling symlinks (if any).
+ ? ? [ ! -f "$i" ] && continue
+
+ ? ? case "$i" in
+ ? ? ? *.sh)
+ ? ? ? ? ? # Source shell script for speed.
+ ? ? ? ? ? (
+ ? ? ? ? ? ? ? trap - INT QUIT TSTP
+ ? ? ? ? ? ? ? set start
+ ? ? ? ? ? ? ? . $i
+ ? ? ? ? ? )
+ ? ? ? ? ? ;;
+ ? ? ? *)
+ ? ? ? ? ? # No sh extension, so fork subprocess.
+ ? ? ? ? ? $i start
+ ? ? ? ? ? ;;
+ ? ?esac
+done
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/inittab
b/target/device/soekris/net4501/target_skeleton/etc/inittab
new file mode 100644
index 0000000..37c8db3
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/inittab
@@ -0,0 +1,46 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels. ?The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id ? ? ? ?== tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action ? ?== one of sysinit, respawn, askfirst, wait, and once
+# process ? == program to run
+
+# Startup the system
+null::sysinit:/bin/mount -o remount,rw /
+null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mkdir -p /dev/pts
+null::sysinit:/bin/mount -a
+null::sysinit:/bin/hostname -F /etc/hostname
+# now run any rc scripts
+::sysinit:/etc/init.d/rcS
+
+# Set up a couple of getty's
+tty1::respawn:/sbin/getty 9600 tty1
+tty2::respawn:/sbin/getty 9600 tty2
+
+# Put a getty on the serial port
+#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Logging junk
+null::sysinit:/bin/touch /var/log/messages
+null::respawn:/sbin/syslogd -n -m 0
+null::respawn:/sbin/klogd -n
+tty3::respawn:/usr/bin/tail -f /var/log/messages
+
+# Stuff to do for the 3-finger salute
+::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+null::shutdown:/usr/bin/killall klogd
+null::shutdown:/usr/bin/killall syslogd
+null::shutdown:/bin/umount -a -r
+null::shutdown:/sbin/swapoff -a
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/inputrc
b/target/device/soekris/net4501/target_skeleton/etc/inputrc
new file mode 100644
index 0000000..2f1cb60
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/inputrc
@@ -0,0 +1,44 @@
+# /etc/inputrc - global inputrc for libreadline
+# See readline(3readline) and `info readline' for more information.
+
+# Be 8 bit clean.
+set input-meta on
+set output-meta on
+set bell-style visible
+
+# To allow the use of 8bit-characters like the german umlauts, comment out
+# the line below. However this makes the meta key not work as a meta key,
+# which is annoying to those which don't need to type in 8-bit characters.
+
+# set convert-meta off
+
+"\e0d": backward-word
+"\e0c": forward-word
+"\e[h": beginning-of-line
+"\e[f": end-of-line
+"\e[1~": beginning-of-line
+"\e[4~": end-of-line
+#"\e[5~": beginning-of-history
+#"\e[6~": end-of-history
+"\e[3~": delete-char
+"\e[2~": quoted-insert
+
+# Common standard keypad and cursor
+# (codes courtsey Werner Fink, <werner@suse.de>)
+#"\e[1~": history-search-backward
+"\e[2~": yank
+"\e[3~": delete-char
+#"\e[4~": set-mark
+"\e[5~": history-search-backward
+"\e[6~": history-search-forward
+# Normal keypad and cursor of xterm
+"\e[F": end-of-line
+"\e[H": beginning-of-line
+# Application keypad and cursor of xterm
+"\eOA": previous-history
+"\eOC": forward-char
+"\eOB": next-history
+"\eOD": backward-char
+"\eOF": end-of-line
+"\eOH": beginning-of-line
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/issue
b/target/device/soekris/net4501/target_skeleton/etc/issue
new file mode 100644
index 0000000..90f1779
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/issue
@@ -0,0 +1,3 @@
+
+Welcome to Buildroot
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/ld.so.conf.d/.empty
b/target/device/soekris/net4501/target_skeleton/etc/ld.so.conf.d/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/etc/mtab
b/target/device/soekris/net4501/target_skeleton/etc/mtab
new file mode 120000
index 0000000..e1c2045
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/mtab
@@ -0,0 +1 @@
+../proc/mounts
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/etc/network/interfaces
b/target/device/soekris/net4501/target_skeleton/etc/network/interfaces
new file mode 100644
index 0000000..218b82c
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/network/interfaces
@@ -0,0 +1,4 @@
+# Configure Loopback
+auto lo
+iface lo inet loopback
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/passwd
b/target/device/soekris/net4501/target_skeleton/etc/passwd
new file mode 100644
index 0000000..377d4df
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/passwd
@@ -0,0 +1,15 @@
+root:x:0:0:root:/root:/bin/sh
+daemon:x:1:1:daemon:/usr/sbin:/bin/sh
+bin:x:2:2:bin:/bin:/bin/sh
+sys:x:3:3:sys:/dev:/bin/sh
+sync:x:4:100:sync:/bin:/bin/sync
+mail:x:8:8:mail:/var/spool/mail:/bin/sh
+proxy:x:13:13:proxy:/bin:/bin/sh
+www-data:x:33:33:www-data:/var/www:/bin/sh
+backup:x:34:34:backup:/var/backups:/bin/sh
+operator:x:37:37:Operator:/var:/bin/sh
+haldaemon:x:68:68:hald:/:/bin/sh
+dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
+nobody:x:99:99:nobody:/home:/bin/sh
+sshd:x:103:99:Operator:/var:/bin/sh
+default:x:1000:1000:Default non-root user:/home/default:/bin/sh
diff --git a/target/device/soekris/net4501/target_skeleton/etc/profile
b/target/device/soekris/net4501/target_skeleton/etc/profile
new file mode 100644
index 0000000..cc2e0be
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/profile
@@ -0,0 +1,48 @@
+# ~/.bashrc: executed by bash(1) for non-login interactive shells.
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+# If running interactively, then:
+if [ "$PS1" ]; then
+
+ ? ?if [ "$BASH" ]; then
+ ? ? ? export PS1="[\u@\h \W]\\$ "
+ ? ? ? alias ll='/bin/ls --color=tty -laFh'
+ ? ? ? alias ls='/bin/ls --color=tty -F'
+ ? ? ? export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+ ? ?else
+ ? ? ?if [ "`id -u`" -eq 0 ]; then
+ ? ? ? export PS1='# '
+ ? ? ?else
+ ? ? ? export PS1='$ '
+ ? ? ?fi
+ ? ?fi
+
+ ? ?export USER=`id -un`
+ ? ?export LOGNAME=$USER
+ ? ?export HOSTNAME=`/bin/hostname`
+ ? ?export HISTSIZE=1000
+ ? ?export HISTFILESIZE=1000
+ ? ?export PAGER='/bin/more '
+ ? ?export EDITOR='/bin/vi'
+ ? ?export INPUTRC=/etc/inputrc
+ ? ?export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+
+ ? ?### Some aliases
+ ? ?alias ps2='ps facux '
+ ? ?alias ps1='ps faxo "%U %t %p %a" '
+ ? ?alias af='ps af'
+ ? ?alias cls='clear'
+ ? ?alias df='df -h'
+ ? ?alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33
-ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75
-lp -npcs -npsl -nsc -nsob -nss -ts4 '
+ ? ?#alias bc='bc -l'
+ ? ?alias minicom='minicom -c on'
+ ? ?alias calc='calc -Cd '
+ ? ?alias bc='calc -Cd '
+fi;
diff --git a/target/device/soekris/net4501/target_skeleton/etc/protocols
b/target/device/soekris/net4501/target_skeleton/etc/protocols
new file mode 100644
index 0000000..1ac8a40
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/protocols
@@ -0,0 +1,31 @@
+# /etc/protocols:
+# $Id: protocols,v 1.1 2004/10/09 02:49:18 andersen Exp $
+#
+# Internet (IP) protocols
+#
+# ? ? ?from: @(#)protocols ? ? 5.1 (Berkeley) 4/17/89
+#
+# Updated for NetBSD based on RFC 1340, Assigned Numbers (July 1992).
+
+ip ? ? 0 ? ? ? IP ? ? ? ? ? ? ?# internet protocol, pseudo protocol number
+icmp ? 1 ? ? ? ICMP ? ? ? ? ? ?# internet control message protocol
+igmp ? 2 ? ? ? IGMP ? ? ? ? ? ?# Internet Group Management
+ggp ? ?3 ? ? ? GGP ? ? ? ? ? ? # gateway-gateway protocol
+ipencap ? ? ? ?4 ? ? ? IP-ENCAP ? ? ? ?# IP encapsulated in IP
(officially ``IP'')
+st ? ? 5 ? ? ? ST ? ? ? ? ? ? ?# ST datagram mode
+tcp ? ?6 ? ? ? TCP ? ? ? ? ? ? # transmission control protocol
+egp ? ?8 ? ? ? EGP ? ? ? ? ? ? # exterior gateway protocol
+pup ? ?12 ? ? ?PUP ? ? ? ? ? ? # PARC universal packet protocol
+udp ? ?17 ? ? ?UDP ? ? ? ? ? ? # user datagram protocol
+hmp ? ?20 ? ? ?HMP ? ? ? ? ? ? # host monitoring protocol
+xns-idp ? ? ? ?22 ? ? ?XNS-IDP ? ? ? ? # Xerox NS IDP
+rdp ? ?27 ? ? ?RDP ? ? ? ? ? ? # "reliable datagram" protocol
+iso-tp4 ? ? ? ?29 ? ? ?ISO-TP4 ? ? ? ? # ISO Transport Protocol class 4
+xtp ? ?36 ? ? ?XTP ? ? ? ? ? ? # Xpress Tranfer Protocol
+ddp ? ?37 ? ? ?DDP ? ? ? ? ? ? # Datagram Delivery Protocol
+idpr-cmtp ? ? ?39 ? ? ?IDPR-CMTP ? ? ? # IDPR Control Message Transport
+rspf ? 73 ? ? ?RSPF ? ? ? ? ? ?#Radio Shortest Path First.
+vmtp ? 81 ? ? ?VMTP ? ? ? ? ? ?# Versatile Message Transport
+ospf ? 89 ? ? ?OSPFIGP ? ? ? ? # Open Shortest Path First IGP
+ipip ? 94 ? ? ?IPIP ? ? ? ? ? ?# Yet Another IP encapsulation
+encap ?98 ? ? ?ENCAP ? ? ? ? ? # Yet Another IP encapsulation
diff --git a/target/device/soekris/net4501/target_skeleton/etc/resolv.conf
b/target/device/soekris/net4501/target_skeleton/etc/resolv.conf
new file mode 120000
index 0000000..71f6f96
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/resolv.conf
@@ -0,0 +1 @@
+../tmp/resolv.conf
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/etc/securetty
b/target/device/soekris/net4501/target_skeleton/etc/securetty
new file mode 100644
index 0000000..3a89d27
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/securetty
@@ -0,0 +1,10 @@
+tty1
+tty2
+tty3
+tty4
+tty5
+tty6
+tty7
+tty8
+ttyS0
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/services
b/target/device/soekris/net4501/target_skeleton/etc/services
new file mode 100644
index 0000000..b287b63
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/services
@@ -0,0 +1,302 @@
+# /etc/services:
+# $Id: services,v 1.1 2004/10/09 02:49:18 andersen Exp $
+#
+# Network services, Internet style
+#
+# Note that it is presently the policy of IANA to assign a single well-known
+# port number for both TCP and UDP; hence, most entries here have two entries
+# even if the protocol doesn't support UDP operations.
+# Updated from RFC 1700, ``Assigned Numbers'' (October 1994). ?Not all ports
+# are included, only the more common ones.
+
+tcpmux ? ? ? ? 1/tcp ? ? ? ? ? ? ? ? ? ? ? ? ? # TCP port service multiplexer
+echo ? ? ? ? ? 7/tcp
+echo ? ? ? ? ? 7/udp
+discard ? ? ? ? ? ? ? ?9/tcp ? ? ? ? ? sink null
+discard ? ? ? ? ? ? ? ?9/udp ? ? ? ? ? sink null
+systat ? ? ? ? 11/tcp ? ? ? ? ?users
+daytime ? ? ? ? ? ? ? ?13/tcp
+daytime ? ? ? ? ? ? ? ?13/udp
+netstat ? ? ? ? ? ? ? ?15/tcp
+qotd ? ? ? ? ? 17/tcp ? ? ? ? ?quote
+msp ? ? ? ? ? ?18/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# message send protocol
+msp ? ? ? ? ? ?18/udp ? ? ? ? ? ? ? ? ? ? ? ? ?# message send protocol
+chargen ? ? ? ? ? ? ? ?19/tcp ? ? ? ? ?ttytst source
+chargen ? ? ? ? ? ? ? ?19/udp ? ? ? ? ?ttytst source
+ftp-data ? ? ? 20/tcp
+ftp ? ? ? ? ? ?21/tcp
+fsp ? ? ? ? ? ?21/udp ? ? ? ? ?fspd
+ssh ? ? ? ? ? ?22/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# SSH Remote Login Protocol
+ssh ? ? ? ? ? ?22/udp ? ? ? ? ? ? ? ? ? ? ? ? ?# SSH Remote Login Protocol
+telnet ? ? ? ? 23/tcp
+# 24 - private
+smtp ? ? ? ? ? 25/tcp ? ? ? ? ?mail
+# 26 - unassigned
+time ? ? ? ? ? 37/tcp ? ? ? ? ?timserver
+time ? ? ? ? ? 37/udp ? ? ? ? ?timserver
+rlp ? ? ? ? ? ?39/udp ? ? ? ? ?resource ? ? ? ?# resource location
+nameserver ? ? 42/tcp ? ? ? ? ?name ? ? ? ? ? ?# IEN 116
+whois ? ? ? ? ?43/tcp ? ? ? ? ?nicname
+re-mail-ck ? ? 50/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# Remote Mail Checking Protocol
+re-mail-ck ? ? 50/udp ? ? ? ? ? ? ? ? ? ? ? ? ?# Remote Mail Checking Protocol
+domain ? ? ? ? 53/tcp ? ? ? ? ?nameserver ? ? ?# name-domain server
+domain ? ? ? ? 53/udp ? ? ? ? ?nameserver
+mtp ? ? ? ? ? ?57/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# deprecated
+bootps ? ? ? ? 67/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# BOOTP server
+bootps ? ? ? ? 67/udp
+bootpc ? ? ? ? 68/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# BOOTP client
+bootpc ? ? ? ? 68/udp
+tftp ? ? ? ? ? 69/udp
+gopher ? ? ? ? 70/tcp ? ? ? ? ? ? ? ? ? ? ? ? ?# Internet Gopher
+gopher ? ? ? ? 70/udp
+rje ? ? ? ? ? ?77/tcp ? ? ? ? ?netrjs
+finger ? ? ? ? 79/tcp
+www ? ? ? ? ? ?80/tcp ? ? ? ? ?http ? ? ? ? ? ?# WorldWideWeb HTTP
+www ? ? ? ? ? ?80/udp ? ? ? ? ? ? ? ? ? ? ? ? ?# HyperText Transfer Protocol
+link ? ? ? ? ? 87/tcp ? ? ? ? ?ttylink
+kerberos ? ? ? 88/tcp ? ? ? ? ?kerberos5 krb5 ?# Kerberos v5
+kerberos ? ? ? 88/udp ? ? ? ? ?kerberos5 krb5 ?# Kerberos v5
+supdup ? ? ? ? 95/tcp
+# 100 - reserved
+hostnames ? ? ?101/tcp ? ? ? ? hostname ? ? ? ?# usually from sri-nic
+iso-tsap ? ? ? 102/tcp ? ? ? ? tsap ? ? ? ? ? ?# part of ISODE.
+csnet-ns ? ? ? 105/tcp ? ? ? ? cso-ns ? ? ? ? ?# also used by CSO name server
+csnet-ns ? ? ? 105/udp ? ? ? ? cso-ns
+# unfortunately the poppassd (Eudora) uses a port which has already
+# been assigned to a different service. We list the poppassd as an
+# alias here. This should work for programs asking for this service.
+# (due to a bug in inetd the 3com-tsmux line is disabled)
+#3com-tsmux ? ?106/tcp ? ? ? ? poppassd
+#3com-tsmux ? ?106/udp ? ? ? ? poppassd
+rtelnet ? ? ? ? ? ? ? ?107/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Remote Telnet
+rtelnet ? ? ? ? ? ? ? ?107/udp
+pop-2 ? ? ? ? ?109/tcp ? ? ? ? postoffice ? ? ?# POP version 2
+pop-2 ? ? ? ? ?109/udp
+pop-3 ? ? ? ? ?110/tcp ? ? ? ? ? ? ? ? ? ? ? ? # POP version 3
+pop-3 ? ? ? ? ?110/udp
+sunrpc ? ? ? ? 111/tcp ? ? ? ? portmapper ? ? ?# RPC 4.0 portmapper TCP
+sunrpc ? ? ? ? 111/udp ? ? ? ? portmapper ? ? ?# RPC 4.0 portmapper UDP
+auth ? ? ? ? ? 113/tcp ? ? ? ? authentication tap ident
+sftp ? ? ? ? ? 115/tcp
+uucp-path ? ? ?117/tcp
+nntp ? ? ? ? ? 119/tcp ? ? ? ? readnews untp ? # USENET News Transfer Protocol
+ntp ? ? ? ? ? ?123/tcp
+ntp ? ? ? ? ? ?123/udp ? ? ? ? ? ? ? ? ? ? ? ? # Network Time Protocol
+netbios-ns ? ? 137/tcp ? ? ? ? ? ? ? ? ? ? ? ? # NETBIOS Name Service
+netbios-ns ? ? 137/udp
+netbios-dgm ? ?138/tcp ? ? ? ? ? ? ? ? ? ? ? ? # NETBIOS Datagram Service
+netbios-dgm ? ?138/udp
+netbios-ssn ? ?139/tcp ? ? ? ? ? ? ? ? ? ? ? ? # NETBIOS session service
+netbios-ssn ? ?139/udp
+imap2 ? ? ? ? ?143/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Interim Mail Access Proto v2
+imap2 ? ? ? ? ?143/udp
+snmp ? ? ? ? ? 161/udp ? ? ? ? ? ? ? ? ? ? ? ? # Simple Net Mgmt Proto
+snmp-trap ? ? ?162/udp ? ? ? ? snmptrap ? ? ? ?# Traps for SNMP
+cmip-man ? ? ? 163/tcp ? ? ? ? ? ? ? ? ? ? ? ? # ISO mgmt over IP (CMOT)
+cmip-man ? ? ? 163/udp
+cmip-agent ? ? 164/tcp
+cmip-agent ? ? 164/udp
+xdmcp ? ? ? ? ?177/tcp ? ? ? ? ? ? ? ? ? ? ? ? # X Display Mgr. Control Proto
+xdmcp ? ? ? ? ?177/udp
+nextstep ? ? ? 178/tcp ? ? ? ? NeXTStep NextStep ? ? ? # NeXTStep window
+nextstep ? ? ? 178/udp ? ? ? ? NeXTStep NextStep ? ? ? # server
+bgp ? ? ? ? ? ?179/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Border Gateway Proto.
+bgp ? ? ? ? ? ?179/udp
+prospero ? ? ? 191/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Cliff Neuman's Prospero
+prospero ? ? ? 191/udp
+irc ? ? ? ? ? ?194/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Internet Relay Chat
+irc ? ? ? ? ? ?194/udp
+smux ? ? ? ? ? 199/tcp ? ? ? ? ? ? ? ? ? ? ? ? # SNMP Unix Multiplexer
+smux ? ? ? ? ? 199/udp
+at-rtmp ? ? ? ? ? ? ? ?201/tcp ? ? ? ? ? ? ? ? ? ? ? ? # AppleTalk routing
+at-rtmp ? ? ? ? ? ? ? ?201/udp
+at-nbp ? ? ? ? 202/tcp ? ? ? ? ? ? ? ? ? ? ? ? # AppleTalk name binding
+at-nbp ? ? ? ? 202/udp
+at-echo ? ? ? ? ? ? ? ?204/tcp ? ? ? ? ? ? ? ? ? ? ? ? # AppleTalk echo
+at-echo ? ? ? ? ? ? ? ?204/udp
+at-zis ? ? ? ? 206/tcp ? ? ? ? ? ? ? ? ? ? ? ? # AppleTalk zone information
+at-zis ? ? ? ? 206/udp
+qmtp ? ? ? ? ? 209/tcp ? ? ? ? ? ? ? ? ? ? ? ? # The Quick Mail
Transfer Protocol
+qmtp ? ? ? ? ? 209/udp ? ? ? ? ? ? ? ? ? ? ? ? # The Quick Mail
Transfer Protocol
+z3950 ? ? ? ? ?210/tcp ? ? ? ? wais ? ? ? ? ? ?# NISO Z39.50 database
+z3950 ? ? ? ? ?210/udp ? ? ? ? wais
+ipx ? ? ? ? ? ?213/tcp ? ? ? ? ? ? ? ? ? ? ? ? # IPX
+ipx ? ? ? ? ? ?213/udp
+imap3 ? ? ? ? ?220/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Interactive Mail Access
+imap3 ? ? ? ? ?220/udp ? ? ? ? ? ? ? ? ? ? ? ? # Protocol v3
+ulistserv ? ? ?372/tcp ? ? ? ? ? ? ? ? ? ? ? ? # UNIX Listserv
+ulistserv ? ? ?372/udp
+https ? ? ? ? ?443/tcp ? ? ? ? ? ? ? ? ? ? ? ? # MCom
+https ? ? ? ? ?443/udp ? ? ? ? ? ? ? ? ? ? ? ? # MCom
+snpp ? ? ? ? ? 444/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Simple Network Paging Protocol
+snpp ? ? ? ? ? 444/udp ? ? ? ? ? ? ? ? ? ? ? ? # Simple Network Paging Protocol
+saft ? ? ? ? ? 487/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Simple Asynchronous
File Transfer
+saft ? ? ? ? ? 487/udp ? ? ? ? ? ? ? ? ? ? ? ? # Simple Asynchronous
File Transfer
+npmp-local ? ? 610/tcp ? ? ? ? dqs313_qmaster ?# npmp-local / DQS
+npmp-local ? ? 610/udp ? ? ? ? dqs313_qmaster ?# npmp-local / DQS
+npmp-gui ? ? ? 611/tcp ? ? ? ? dqs313_execd ? ?# npmp-gui / DQS
+npmp-gui ? ? ? 611/udp ? ? ? ? dqs313_execd ? ?# npmp-gui / DQS
+hmmp-ind ? ? ? 612/tcp ? ? ? ? dqs313_intercell# HMMP Indication / DQS
+hmmp-ind ? ? ? 612/udp ? ? ? ? dqs313_intercell# HMMP Indication / DQS
+#
+# UNIX specific services
+#
+exec ? ? ? ? ? 512/tcp
+biff ? ? ? ? ? 512/udp ? ? ? ? comsat
+login ? ? ? ? ?513/tcp
+who ? ? ? ? ? ?513/udp ? ? ? ? whod
+shell ? ? ? ? ?514/tcp ? ? ? ? cmd ? ? ? ? ? ? # no passwords used
+syslog ? ? ? ? 514/udp
+printer ? ? ? ? ? ? ? ?515/tcp ? ? ? ? spooler ? ? ? ? # line printer spooler
+talk ? ? ? ? ? 517/udp
+ntalk ? ? ? ? ?518/udp
+route ? ? ? ? ?520/udp ? ? ? ? router routed ? # RIP
+timed ? ? ? ? ?525/udp ? ? ? ? timeserver
+tempo ? ? ? ? ?526/tcp ? ? ? ? newdate
+courier ? ? ? ? ? ? ? ?530/tcp ? ? ? ? rpc
+conference ? ? 531/tcp ? ? ? ? chat
+netnews ? ? ? ? ? ? ? ?532/tcp ? ? ? ? readnews
+netwall ? ? ? ? ? ? ? ?533/udp ? ? ? ? ? ? ? ? ? ? ? ? # -for
emergency broadcasts
+uucp ? ? ? ? ? 540/tcp ? ? ? ? uucpd ? ? ? ? ? # uucp daemon
+afpovertcp ? ? 548/tcp ? ? ? ? ? ? ? ? ? ? ? ? # AFP over TCP
+afpovertcp ? ? 548/udp ? ? ? ? ? ? ? ? ? ? ? ? # AFP over TCP
+remotefs ? ? ? 556/tcp ? ? ? ? rfs_server rfs ?# Brunhoff remote filesystem
+klogin ? ? ? ? 543/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Kerberized `rlogin' (v5)
+kshell ? ? ? ? 544/tcp ? ? ? ? krcmd ? ? ? ? ? # Kerberized `rsh' (v5)
+kerberos-adm ? 749/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Kerberos `kadmin' (v5)
+#
+webster ? ? ? ? ? ? ? ?765/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Network dictionary
+webster ? ? ? ? ? ? ? ?765/udp
+#
+# From ``Assigned Numbers'':
+#
+#> The Registered Ports are not controlled by the IANA and on most systems
+#> can be used by ordinary user processes or programs executed by ordinary
+#> users.
+#
+#> Ports are used in the TCP [45,106] to name the ends of logical
+#> connections which carry long term conversations. ?For the purpose of
+#> providing services to unknown callers, a service contact port is
+#> defined. ?This list specifies the port used by the server process as its
+#> contact port. ?While the IANA can not control uses of these ports it
+#> does register or list uses of these ports as a convienence to the
+#> community.
+#
+nfsdstatus ? ? 1110/tcp
+nfsd-keepalive 1110/udp
+
+ingreslock ? ? 1524/tcp
+ingreslock ? ? 1524/udp
+prospero-np ? ?1525/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Prospero non-privileged
+prospero-np ? ?1525/udp
+datametrics ? ?1645/tcp ? ? ? ?old-radius ? ? ?# datametrics / old radius entry
+datametrics ? ?1645/udp ? ? ? ?old-radius ? ? ?# datametrics / old radius entry
+sa-msg-port ? ?1646/tcp ? ? ? ?old-radacct ? ? # sa-msg-port / old
radacct entry
+sa-msg-port ? ?1646/udp ? ? ? ?old-radacct ? ? # sa-msg-port / old
radacct entry
+radius ? ? ? ? 1812/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Radius
+radius ? ? ? ? 1812/udp ? ? ? ? ? ? ? ? ? ? ? ?# Radius
+radacct ? ? ? ? ? ? ? ?1813/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Radius Accounting
+radacct ? ? ? ? ? ? ? ?1813/udp ? ? ? ? ? ? ? ? ? ? ? ?# Radius Accounting
+nfsd ? ? ? ? ? 2049/tcp ? ? ? ?nfs
+nfsd ? ? ? ? ? 2049/udp ? ? ? ?nfs
+cvspserver ? ? 2401/tcp ? ? ? ? ? ? ? ? ? ? ? ?# CVS client/server operations
+cvspserver ? ? 2401/udp ? ? ? ? ? ? ? ? ? ? ? ?# CVS client/server operations
+mysql ? ? ? ? ?3306/tcp ? ? ? ? ? ? ? ? ? ? ? ?# MySQL
+mysql ? ? ? ? ?3306/udp ? ? ? ? ? ? ? ? ? ? ? ?# MySQL
+rfe ? ? ? ? ? ?5002/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Radio Free Ethernet
+rfe ? ? ? ? ? ?5002/udp ? ? ? ? ? ? ? ? ? ? ? ?# Actually uses UDP only
+cfengine ? ? ? 5308/tcp ? ? ? ? ? ? ? ? ? ? ? ?# CFengine
+cfengine ? ? ? 5308/udp ? ? ? ? ? ? ? ? ? ? ? ?# CFengine
+bbs ? ? ? ? ? ?7000/tcp ? ? ? ? ? ? ? ? ? ? ? ?# BBS service
+#
+#
+# Kerberos (Project Athena/MIT) services
+# Note that these are for Kerberos v4, and are unofficial. ?Sites running
+# v4 should uncomment these and comment out the v5 entries above.
+#
+kerberos4 ? ? ?750/udp ? ? ? ? kerberos-iv kdc # Kerberos (server) udp
+kerberos4 ? ? ?750/tcp ? ? ? ? kerberos-iv kdc # Kerberos (server) tcp
+kerberos_master ? ? ? ?751/udp ? ? ? ? ? ? ? ? ? ? ? ? # Kerberos
authentication
+kerberos_master ? ? ? ?751/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Kerberos
authentication
+passwd_server ?752/udp ? ? ? ? ? ? ? ? ? ? ? ? # Kerberos passwd server
+krb_prop ? ? ? 754/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Kerberos slave propagation
+krbupdate ? ? ?760/tcp ? ? ? ? kreg ? ? ? ? ? ?# Kerberos registration
+kpasswd ? ? ? ? ? ? ? ?761/tcp ? ? ? ? kpwd ? ? ? ? ? ?# Kerberos "passwd"
+kpop ? ? ? ? ? 1109/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Pop with Kerberos
+knetd ? ? ? ? ?2053/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Kerberos de-multiplexor
+zephyr-srv ? ? 2102/udp ? ? ? ? ? ? ? ? ? ? ? ?# Zephyr server
+zephyr-clt ? ? 2103/udp ? ? ? ? ? ? ? ? ? ? ? ?# Zephyr serv-hm connection
+zephyr-hm ? ? ?2104/udp ? ? ? ? ? ? ? ? ? ? ? ?# Zephyr hostmanager
+eklogin ? ? ? ? ? ? ? ?2105/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Kerberos
encrypted rlogin
+#
+# Unofficial but necessary (for NetBSD) services
+#
+supfilesrv ? ? 871/tcp ? ? ? ? ? ? ? ? ? ? ? ? # SUP server
+supfiledbg ? ? 1127/tcp ? ? ? ? ? ? ? ? ? ? ? ?# SUP debugging
+#
+# Datagram Delivery Protocol services
+#
+rtmp ? ? ? ? ? 1/ddp ? ? ? ? ? ? ? ? ? ? ? ? ? # Routing Table
Maintenance Protocol
+nbp ? ? ? ? ? ?2/ddp ? ? ? ? ? ? ? ? ? ? ? ? ? # Name Binding Protocol
+echo ? ? ? ? ? 4/ddp ? ? ? ? ? ? ? ? ? ? ? ? ? # AppleTalk Echo Protocol
+zip ? ? ? ? ? ?6/ddp ? ? ? ? ? ? ? ? ? ? ? ? ? # Zone Information Protocol
+#
+# Services added for the Debian GNU/Linux distribution
+poppassd ? ? ? 106/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Eudora
+poppassd ? ? ? 106/udp ? ? ? ? ? ? ? ? ? ? ? ? # Eudora
+mailq ? ? ? ? ?174/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Mailer transport
queue for Zmailer
+mailq ? ? ? ? ?174/tcp ? ? ? ? ? ? ? ? ? ? ? ? # Mailer transport
queue for Zmailer
+omirr ? ? ? ? ?808/tcp ? ? ? ? omirrd ? ? ? ? ?# online mirror
+omirr ? ? ? ? ?808/udp ? ? ? ? omirrd ? ? ? ? ?# online mirror
+rmtcfg ? ? ? ? 1236/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Gracilis Packeten
remote config server
+xtel ? ? ? ? ? 1313/tcp ? ? ? ? ? ? ? ? ? ? ? ?# french minitel
+coda_opcons ? ?1355/udp ? ? ? ? ? ? ? ? ? ? ? ?# Coda opcons
 ?(Coda fs)
+coda_venus ? ? 1363/udp ? ? ? ? ? ? ? ? ? ? ? ?# Coda venus
? (Coda fs)
+coda_auth ? ? ?1357/udp ? ? ? ? ? ? ? ? ? ? ? ?# Coda auth
 ?(Coda fs)
+coda_udpsrv ? ?1359/udp ? ? ? ? ? ? ? ? ? ? ? ?# Coda udpsrv
 ?(Coda fs)
+coda_filesrv ? 1361/udp ? ? ? ? ? ? ? ? ? ? ? ?# Coda filesrv
? (Coda fs)
+codacon ? ? ? ? ? ? ? ?1423/tcp ? ? ? ?venus.cmu ? ? ? # Coda Console
? ? ? ? ? (Coda fs)
+coda_aux1 ? ? ?1431/tcp ? ? ? ? ? ? ? ? ? ? ? ?# coda auxiliary
service (Coda fs)
+coda_aux1 ? ? ?1431/udp ? ? ? ? ? ? ? ? ? ? ? ?# coda auxiliary
service (Coda fs)
+coda_aux2 ? ? ?1433/tcp ? ? ? ? ? ? ? ? ? ? ? ?# coda auxiliary
service (Coda fs)
+coda_aux2 ? ? ?1433/udp ? ? ? ? ? ? ? ? ? ? ? ?# coda auxiliary
service (Coda fs)
+coda_aux3 ? ? ?1435/tcp ? ? ? ? ? ? ? ? ? ? ? ?# coda auxiliary
service (Coda fs)
+coda_aux3 ? ? ?1435/udp ? ? ? ? ? ? ? ? ? ? ? ?# coda auxiliary
service (Coda fs)
+cfinger ? ? ? ? ? ? ? ?2003/tcp ? ? ? ? ? ? ? ? ? ? ? ?# GNU Finger
+afbackup ? ? ? 2988/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Afbackup system
+afbackup ? ? ? 2988/udp ? ? ? ? ? ? ? ? ? ? ? ?# Afbackup system
+icp ? ? ? ? ? ?3130/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Internet Cache
Protocol (Squid)
+icp ? ? ? ? ? ?3130/udp ? ? ? ? ? ? ? ? ? ? ? ?# Internet Cache
Protocol (Squid)
+postgres ? ? ? 5432/tcp ? ? ? ? ? ? ? ? ? ? ? ?# POSTGRES
+postgres ? ? ? 5432/udp ? ? ? ? ? ? ? ? ? ? ? ?# POSTGRES
+fax ? ? ? ? ? ?4557/tcp ? ? ? ? ? ? ? ? ? ? ? ?# FAX transmission
service ? ? ? ?(old)
+hylafax ? ? ? ? ? ? ? ?4559/tcp ? ? ? ? ? ? ? ? ? ? ? ?# HylaFAX
client-server protocol ?(new)
+noclog ? ? ? ? 5354/tcp ? ? ? ? ? ? ? ? ? ? ? ?# noclogd with TCP (nocol)
+noclog ? ? ? ? 5354/udp ? ? ? ? ? ? ? ? ? ? ? ?# noclogd with UDP (nocol)
+hostmon ? ? ? ? ? ? ? ?5355/tcp ? ? ? ? ? ? ? ? ? ? ? ?# hostmon uses
TCP (nocol)
+hostmon ? ? ? ? ? ? ? ?5355/udp ? ? ? ? ? ? ? ? ? ? ? ?# hostmon uses
TCP (nocol)
+ircd ? ? ? ? ? 6667/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Internet Relay Chat
+ircd ? ? ? ? ? 6667/udp ? ? ? ? ? ? ? ? ? ? ? ?# Internet Relay Chat
+webcache ? ? ? 8080/tcp ? ? ? ? ? ? ? ? ? ? ? ?# WWW caching service
+webcache ? ? ? 8080/udp ? ? ? ? ? ? ? ? ? ? ? ?# WWW caching service
+tproxy ? ? ? ? 8081/tcp ? ? ? ? ? ? ? ? ? ? ? ?# Transparent Proxy
+tproxy ? ? ? ? 8081/udp ? ? ? ? ? ? ? ? ? ? ? ?# Transparent Proxy
+mandelspawn ? ?9359/udp ? ? ? ?mandelbrot ? ? ?# network mandelbrot
+amanda ? ? ? ? 10080/udp ? ? ? ? ? ? ? ? ? ? ? # amanda backup services
+amandaidx ? ? ?10082/tcp ? ? ? ? ? ? ? ? ? ? ? # amanda backup services
+amidxtape ? ? ?10083/tcp ? ? ? ? ? ? ? ? ? ? ? # amanda backup services
+isdnlog ? ? ? ? ? ? ? ?20011/tcp ? ? ? ? ? ? ? ? ? ? ? # isdn logging system
+isdnlog ? ? ? ? ? ? ? ?20011/udp ? ? ? ? ? ? ? ? ? ? ? # isdn logging system
+vboxd ? ? ? ? ?20012/tcp ? ? ? ? ? ? ? ? ? ? ? # voice box system
+vboxd ? ? ? ? ?20012/udp ? ? ? ? ? ? ? ? ? ? ? # voice box system
+binkp ? ? ? ? ? 24554/tcp ? ? ? ? ? ? ? ? ? ? ?# Binkley
+binkp ? ? ? ? ? 24554/udp ? ? ? ? ? ? ? ? ? ? ?# Binkley
+asp ? ? ? ? ? ?27374/tcp ? ? ? ? ? ? ? ? ? ? ? # Address Search Protocol
+asp ? ? ? ? ? ?27374/udp ? ? ? ? ? ? ? ? ? ? ? # Address Search Protocol
+tfido ? ? ? ? ? 60177/tcp ? ? ? ? ? ? ? ? ? ? ?# Ifmail
+tfido ? ? ? ? ? 60177/udp ? ? ? ? ? ? ? ? ? ? ?# Ifmail
+fido ? ? ? ? ? ?60179/tcp ? ? ? ? ? ? ? ? ? ? ?# Ifmail
+fido ? ? ? ? ? ?60179/udp ? ? ? ? ? ? ? ? ? ? ?# Ifmail
+
+# Local services
+
diff --git a/target/device/soekris/net4501/target_skeleton/etc/shadow
b/target/device/soekris/net4501/target_skeleton/etc/shadow
new file mode 100644
index 0000000..4941a1a
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/etc/shadow
@@ -0,0 +1,12 @@
+root::10933:0:99999:7:::
+bin:*:10933:0:99999:7:::
+daemon:*:10933:0:99999:7:::
+adm:*:10933:0:99999:7:::
+lp:*:10933:0:99999:7:::
+sync:*:10933:0:99999:7:::
+shutdown:*:10933:0:99999:7:::
+halt:*:10933:0:99999:7:::
+uucp:*:10933:0:99999:7:::
+operator:*:10933:0:99999:7:::
+nobody:*:10933:0:99999:7:::
+default::10933:0:99999:7:::
diff --git a/target/device/soekris/net4501/target_skeleton/home/.empty
b/target/device/soekris/net4501/target_skeleton/home/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/lib/.empty
b/target/device/soekris/net4501/target_skeleton/lib/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/proc/.empty
b/target/device/soekris/net4501/target_skeleton/proc/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/root/.bash_history
b/target/device/soekris/net4501/target_skeleton/root/.bash_history
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/root/.bash_logout
b/target/device/soekris/net4501/target_skeleton/root/.bash_logout
new file mode 100644
index 0000000..77ef1f9
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/root/.bash_logout
@@ -0,0 +1,7 @@
+# ~/.bash_logout: executed by bash(1) when login shell exits.
+
+# when leaving the console clear the screen to increase privacy
+
+case "`tty`" in
+ ? ?/dev/tty[0-9]*) clear
+esac
diff --git a/target/device/soekris/net4501/target_skeleton/root/.bash_profile
b/target/device/soekris/net4501/target_skeleton/root/.bash_profile
new file mode 100644
index 0000000..27bf149
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/root/.bash_profile
@@ -0,0 +1,15 @@
+# .bash_profile
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+umask 022
+
+if [ -f ~/.bashrc ]; then
+ ? ?source ~/.bashrc
+fi
diff --git a/target/device/soekris/net4501/target_skeleton/root/.bashrc
b/target/device/soekris/net4501/target_skeleton/root/.bashrc
new file mode 100644
index 0000000..d13c8f9
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/root/.bashrc
@@ -0,0 +1,48 @@
+# ~/.bashrc: executed by bash(1) for non-login interactive shells.
+
+export PATH=\
+/bin:\
+/sbin:\
+/usr/bin:\
+/usr/sbin:\
+/usr/bin/X11:\
+/usr/local/bin
+
+# If running interactively, then:
+if [ "$PS1" ]; then
+
+ ? ?if [ "$BASH" ]; then
+ ? ? ? export PS1="[\u@\h \W]\\$ "
+ ? ?else
+ ? ? ?if [ "`id -u`" -eq 0 ]; then
+ ? ? ? export PS1='# '
+ ? ? ?else
+ ? ? ? export PS1='$ '
+ ? ? ?fi
+ ? ?fi
+
+ ? ?export USER=`id -un`
+ ? ?export LOGNAME=$USER
+ ? ?export HOSTNAME=`/bin/hostname`
+ ? ?export HISTSIZE=1000
+ ? ?export HISTFILESIZE=1000
+ ? ?export PAGER='/bin/more '
+ ? ?export EDITOR='/bin/vi'
+ ? ?export INPUTRC=/etc/inputrc
+ ? ?export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+ ? ?export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+
+ ? ?### Some aliases
+ ? ?alias ps2='ps facux '
+ ? ?alias ps1='ps faxo "%U %t %p %a" '
+ ? ?alias af='ps af'
+ ? ?alias cls='clear'
+ ? ?alias ll='/bin/ls --color=tty -laFh'
+ ? ?alias ls='/bin/ls --color=tty -F'
+ ? ?alias df='df -h'
+ ? ?alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33
-ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75
-lp -npcs -npsl -nsc -nsob -nss -ts4 '
+ ? ?#alias bc='bc -l'
+ ? ?alias minicom='minicom -c on'
+ ? ?alias calc='calc -Cd '
+ ? ?alias bc='calc -Cd '
+fi;
diff --git a/target/device/soekris/net4501/target_skeleton/root/.empty
b/target/device/soekris/net4501/target_skeleton/root/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/sbin/.empty
b/target/device/soekris/net4501/target_skeleton/sbin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/tmp/.empty
b/target/device/soekris/net4501/target_skeleton/tmp/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/usr/bin/.empty
b/target/device/soekris/net4501/target_skeleton/usr/bin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/usr/lib/.empty
b/target/device/soekris/net4501/target_skeleton/usr/lib/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/usr/sbin/.empty
b/target/device/soekris/net4501/target_skeleton/usr/sbin/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/usr/share/.empty
b/target/device/soekris/net4501/target_skeleton/usr/share/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/target/device/soekris/net4501/target_skeleton/var/cache
b/target/device/soekris/net4501/target_skeleton/var/cache
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/cache
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/var/lib
b/target/device/soekris/net4501/target_skeleton/var/lib
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/lib
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/var/lock
b/target/device/soekris/net4501/target_skeleton/var/lock
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/lock
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/var/log
b/target/device/soekris/net4501/target_skeleton/var/log
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/log
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/var/run
b/target/device/soekris/net4501/target_skeleton/var/run
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/run
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/var/spool
b/target/device/soekris/net4501/target_skeleton/var/spool
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/spool
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/target_skeleton/var/tmp
b/target/device/soekris/net4501/target_skeleton/var/tmp
new file mode 120000
index 0000000..1431b0e
--- /dev/null
+++ b/target/device/soekris/net4501/target_skeleton/var/tmp
@@ -0,0 +1 @@
+../tmp
\ No newline at end of file
diff --git a/target/device/soekris/net4501/uClibc.config
b/target/device/soekris/net4501/uClibc.config
new file mode 100644
index 0000000..6aa5be4
--- /dev/null
+++ b/target/device/soekris/net4501/uClibc.config
@@ -0,0 +1,243 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.31
+# Sun Dec 12 23:29:20 2010
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
+CONFIG_486=y
+# CONFIG_586 is not set
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
+UCLIBC_HAS_FENV=y
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+KERNEL_HEADERS="output/toolchain/linux/include"
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+# DOPIC is not set
+# ARCH_HAS_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+HAVE_SHARED=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+# LDSO_CACHE_SUPPORT is not set
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+# UCLIBC_STATIC_LDCONFIG is not set
+# LDSO_RUNPATH is not set
+LDSO_SEARCH_INTERP_PATH=y
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+LINUXTHREADS_OLD=y
+# LINUXTHREADS_NEW is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+UCLIBC_HAS_SYSLOG=y
+# UCLIBC_HAS_LFS is not set
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
+# UCLIBC_HAS_PTY is not set
+UCLIBC_HAS_GETPT=y
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
+# UCLIBC_LINUX_MODULE_24 is not set
+UCLIBC_LINUX_SPECIFIC=y
+# UCLIBC_HAS_GNU_ERROR is not set
+# UCLIBC_BSD_SPECIFIC is not set
+# UCLIBC_HAS_BSD_ERR is not set
+# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
+# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
+# UCLIBC_NTP_LEGACY is not set
+# UCLIBC_SV4_DEPRECATED is not set
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_EPOLL=y
+# UCLIBC_HAS_XATTR is not set
+# UCLIBC_HAS_PROFILING is not set
+UCLIBC_HAS_CRYPT_IMPL=y
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+# UCLIBC_HAS_COMPAT_RES_STATE is not set
+# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
+
+#
+# String and Stdio Support
+#
+# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+# UCLIBC_HAS_CTYPE_CHECKED is not set
+UCLIBC_HAS_CTYPE_ENFORCED=y
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_PRINTF is not set
+# USE_OLD_VFPRINTF is not set
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
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
+# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
+# UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not set
+# UCLIBC_HAS_PRINTF_M_SPEC is not set
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
+UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+# UCLIBC_HAS_FNMATCH_OLD is not set
+# UCLIBC_HAS_WORDEXP is not set
+# UCLIBC_HAS_NFTW is not set
+UCLIBC_HAS_GLOB=y
+# UCLIBC_HAS_GNU_GLOB is not set
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
+# UCLIBC_BUILD_RELRO is not set
+# UCLIBC_BUILD_NOW is not set
+UCLIBC_BUILD_NOEXECSTACK=y
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX="output/staging/usr/bin/i486-unknown-linux-uclibc-"
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
