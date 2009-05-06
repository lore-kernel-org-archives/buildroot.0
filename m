From: Steffen Schulz <pepe_ml@gmx.net>
Date: Wed, 6 May 2009 18:09:55 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <87y6tadzww.fsf@macbook.be.48ers.dk>
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
Message-ID: <20090506160955.GC4066@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090506 at 17:30, Peter Korsgaard wrote:
> >>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:
> 
>  Steffen> is there any buildroot configuration that gives me a working
>  Steffen> X11 using the framebuffer?
> 
>  Steffen> I saw updates in the X11 area again for the current rc1, but
>  Steffen> I still fail to compile anything using X11.
> 
> Strange, it works here ..

That is good to hear. Care to send a sample .config?

>  Steffen> Currently, if I select tinyX and xserver, xfont-encodings
>  Steffen> will complain about missing mkfontscale. If I add that to
>  Steffen> the dependencies, it still complains since the binary is not
>  Steffen> copied to staging. Even then it seems some shared libraries
>  Steffen> are missing that ldd fails to tell me about.
> Hmm, maybe it needs it at build time, E.G. present on the host. Do you
> have it installed on your host? Send your .config and I'll give it a
> try, we should probably build it for the host as well.
 
I have mkfontscale on the host. And when I copy it from the build
directory to staging, it is used by xfont_encodings. But libs are
missing. I tried and failed so often with previous svn versions
that I did not investigate further.

My .config is very simple since I just wanted to see if the build is
getting somewhere. For X11, I activated TinyX and then xorg-server.
This pulls in several libraries and needs i18n, WCHAR etc.

The qtopia error is also at compile time. It might just work if I
enable that funny switch, but since it is not enabled it seems this is
not a common problem either.

I essentially need a minimal X using fbdev so that I can try to port
some apps(virt-manager and a ton of dependencies)..


/steffen
-- 
pepe at unixfan.net                            gpg --recv-key A04D7875
Key fingerprint: B805 57BE E4AF 0104 CC51  77A1 CE6F 8D46 A04D 7875
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Wed May  6 16:10:40 2009
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2009.05-rc1"
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
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
# BR2_x86_i586 is not set
BR2_x86_i686=y
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
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i686"
BR2_GCC_TARGET_ARCH="i686"

#
# Target options
#

#
# Project Options
#
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to Buildroot"

#
# Preset Devices
#
# BR2_TARGET_AMD is not set
# BR2_TARGET_X86 is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set

#
# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#
# BR2_TARGET_GENERIC_GETTY is not set

#
# Build options
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_COPYTO=""

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"

#
# Atmel Mirrors
#
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
# BR2_FPU_SUFFIX is not set
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_RECENT=y
# BR2_CONFIG_CACHE is not set
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
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
BR2_TOOLCHAIN_SOURCE=y
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_GCC_VERSION_4_2_2=y
BR2_EXT_GCC_VERSION_4_2_3=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_BINUTILS_VERSION_2_18=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_30=y
BR2_EXT_UCLIBC_VERSION_0_9_30_1=y

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_23 is not set
# BR2_KERNEL_HEADERS_2_6_24 is not set
# BR2_KERNEL_HEADERS_2_6_25 is not set
# BR2_KERNEL_HEADERS_2_6_26 is not set
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
BR2_KERNEL_HEADERS_2_6_29=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_30_1=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.30.1"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_PROGRAM_INVOCATION is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
BR2_BINUTILS_VERSION_2_19_1=y
BR2_BINUTILS_VERSION="2.19.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_1 is not set
# BR2_GCC_VERSION_4_2_2 is not set
# BR2_GCC_VERSION_4_2_3 is not set
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_1 is not set
# BR2_GCC_VERSION_4_3_2 is not set
BR2_GCC_VERSION_4_3_3=y
# BR2_GCC_VERSION_4_4_X is not set
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.3"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
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
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PREGENERATED is not set
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US"
BR2_USE_WCHAR=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_INSTALL_LIBSTDCPP is not set
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
BR2_BUSYBOX_VERSION_1_14_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.14.0"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_MAKE is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_VALGRIND is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBOIL is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set

#
# Database
#

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLITE is not set

#
# Networking
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MDNSRESPONDER is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set

#
# netkitbase requires a toolchain with RPC support
#
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set

#
# quagga suite
#
# BR2_PACKAGE_QUAGGA_ZEBRA is not set
# BR2_PACKAGE_QUAGGA_BGPD is not set
# BR2_PACKAGE_QUAGGA_RIPD is not set
# BR2_PACKAGE_QUAGGA_RIPNGD is not set
# BR2_PACKAGE_QUAGGA_OSPFD is not set
# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
# BR2_PACKAGE_QUAGGA_ISISD is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
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
# Hardware handling / blockdevices and filesystem maintenance
#
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MKDOSFS is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# asterisk	- disabled (required openssl and mpg123)
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_FESTIVAL is not set

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_VLC is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# text rendering libraries
#
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_SLANG is not set

#
# text rendering applications
#
# BR2_PACKAGE_DIALOG is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
BR2_PACKAGE_LIBPNG=y
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_LINUX_FUSION is not set
BR2_PACKAGE_PIXMAN=y
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_TIFF is not set

#
# busybox graphic applications
#

#
# --> May be broken in busybox
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FBSET is not set

#
# other GUIs
#

#
# qtopia4 requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_XSERVER_none is not set
# BR2_PACKAGE_XSERVER_xorg is not set
BR2_PACKAGE_XSERVER_tinyx=y
BR2_X11_PREFIX="/usr"
BR2_PACKAGE_XORG7=y

#
# X11R7 Servers
#
BR2_PACKAGE_XSERVER_XORG_SERVER=y
# BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR is not set
# BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS is not set
# BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX is not set

#
# X11R7 Libraries
#
BR2_PACKAGE_LIBXCB=y
# BR2_PACKAGE_MESA3D is not set
BR2_PACKAGE_PTHREAD_STUBS=y
# BR2_PACKAGE_XCB_UTIL is not set
# BR2_PACKAGE_XLIB_LIBFS is not set
BR2_PACKAGE_XLIB_LIBICE=y
BR2_PACKAGE_XLIB_LIBSM=y
BR2_PACKAGE_XLIB_LIBX11=y
BR2_PACKAGE_XLIB_LIBXSCRNSAVER=y
# BR2_PACKAGE_XLIB_LIBXTRAP is not set
BR2_PACKAGE_XLIB_LIBXAU=y
BR2_PACKAGE_XLIB_LIBXAW=y
# BR2_PACKAGE_XLIB_LIBXCOMPOSITE is not set
# BR2_PACKAGE_XLIB_LIBXCURSOR is not set
# BR2_PACKAGE_XLIB_LIBXDAMAGE is not set
BR2_PACKAGE_XLIB_LIBXDMCP=y
# BR2_PACKAGE_XLIB_LIBXEVIE is not set
BR2_PACKAGE_XLIB_LIBXEXT=y
BR2_PACKAGE_XLIB_LIBXFIXES=y
BR2_PACKAGE_XLIB_LIBXFONT=y
# BR2_PACKAGE_XLIB_LIBXFONTCACHE is not set
# BR2_PACKAGE_XLIB_LIBXFT is not set
BR2_PACKAGE_XLIB_LIBXI=y
# BR2_PACKAGE_XLIB_LIBXINERAMA is not set
BR2_PACKAGE_XLIB_LIBXMU=y
BR2_PACKAGE_XLIB_LIBXP=y
BR2_PACKAGE_XLIB_LIBXPM=y
# BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL is not set
# BR2_PACKAGE_XLIB_LIBXPRINTUTIL is not set
# BR2_PACKAGE_XLIB_LIBXRANDR is not set
BR2_PACKAGE_XLIB_LIBXRENDER=y
BR2_PACKAGE_XLIB_LIBXRES=y
BR2_PACKAGE_XLIB_LIBXT=y
# BR2_PACKAGE_XLIB_LIBXTST is not set
# BR2_PACKAGE_XLIB_LIBXV is not set
# BR2_PACKAGE_XLIB_LIBXVMC is not set
# BR2_PACKAGE_XLIB_LIBXXF86DGA is not set
BR2_PACKAGE_XLIB_LIBXXF86MISC=y
BR2_PACKAGE_XLIB_LIBXXF86VM=y
# BR2_PACKAGE_XLIB_LIBDMX is not set
BR2_PACKAGE_XLIB_LIBFONTENC=y
BR2_PACKAGE_XLIB_LIBLBXUTIL=y
# BR2_PACKAGE_XLIB_LIBOLDX is not set
BR2_PACKAGE_XLIB_LIBXKBFILE=y
BR2_PACKAGE_XLIB_LIBXKBUI=y
BR2_PACKAGE_XLIB_XTRANS=y
# BR2_PACKAGE_XLIB_LIBPCIACCESS is not set

#
# X11R7 Applications
#
# BR2_PACKAGE_XAPP_APPRES is not set
# BR2_PACKAGE_XAPP_BDFTOPCF is not set
# BR2_PACKAGE_XAPP_BEFORELIGHT is not set
# BR2_PACKAGE_XAPP_BITMAP is not set
# BR2_PACKAGE_XAPP_EDITRES is not set
# BR2_PACKAGE_XAPP_FONTTOSFNT is not set
# BR2_PACKAGE_XAPP_FSLSFONTS is not set
# BR2_PACKAGE_XAPP_FSTOBDF is not set
# BR2_PACKAGE_XAPP_ICEAUTH is not set
# BR2_PACKAGE_XAPP_ICO is not set
# BR2_PACKAGE_XAPP_LBXPROXY is not set
# BR2_PACKAGE_XAPP_LISTRES is not set
# BR2_PACKAGE_XAPP_LUIT is not set
# BR2_PACKAGE_XAPP_MKFONTDIR is not set
# BR2_PACKAGE_XAPP_MKFONTSCALE is not set
# BR2_PACKAGE_XAPP_OCLOCK is not set
# BR2_PACKAGE_XAPP_PROXYMNGR is not set
# BR2_PACKAGE_XAPP_RGB is not set
# BR2_PACKAGE_XAPP_RSTART is not set
# BR2_PACKAGE_XAPP_SCRIPTS is not set
# BR2_PACKAGE_XAPP_SESSREG is not set
# BR2_PACKAGE_XAPP_SETXKBMAP is not set
# BR2_PACKAGE_XAPP_SHOWFONT is not set
# BR2_PACKAGE_XAPP_SMPROXY is not set
# BR2_PACKAGE_XAPP_TWM is not set
# BR2_PACKAGE_XAPP_VIEWRES is not set
# BR2_PACKAGE_XAPP_X11PERF is not set
# BR2_PACKAGE_XAPP_XAUTH is not set
# BR2_PACKAGE_XAPP_XBACKLIGHT is not set
# BR2_PACKAGE_XAPP_XBIFF is not set
# BR2_PACKAGE_XAPP_XCALC is not set
# BR2_PACKAGE_XAPP_XCLIPBOARD is not set
# BR2_PACKAGE_XAPP_XCLOCK is not set
# BR2_PACKAGE_XAPP_XCMSDB is not set
# BR2_PACKAGE_XAPP_XCURSORGEN is not set
# BR2_PACKAGE_XAPP_XDBEDIZZY is not set
# BR2_PACKAGE_XAPP_XDITVIEW is not set
# BR2_PACKAGE_XAPP_XDM is not set
# BR2_PACKAGE_XAPP_XDPYINFO is not set
# BR2_PACKAGE_XAPP_XDRIINFO is not set
# BR2_PACKAGE_XAPP_XEDIT is not set
# BR2_PACKAGE_XAPP_XEV is not set
# BR2_PACKAGE_XAPP_XEYES is not set
# BR2_PACKAGE_XAPP_XF86DGA is not set
# BR2_PACKAGE_XAPP_XFD is not set
# BR2_PACKAGE_XAPP_XFINDPROXY is not set
# BR2_PACKAGE_XAPP_XFONTSEL is not set
# BR2_PACKAGE_XAPP_XFS is not set
# BR2_PACKAGE_XAPP_XFSINFO is not set
# BR2_PACKAGE_XAPP_XFWP is not set
# BR2_PACKAGE_XAPP_XGAMMA is not set
# BR2_PACKAGE_XAPP_XGC is not set
# BR2_PACKAGE_XAPP_XHOST is not set
# BR2_PACKAGE_XAPP_XINIT is not set
# BR2_PACKAGE_XAPP_XINPUT is not set
# BR2_PACKAGE_XAPP_XKBCOMP is not set
# BR2_PACKAGE_XAPP_XKBEVD is not set
# BR2_PACKAGE_XAPP_XKBPRINT is not set
# BR2_PACKAGE_XAPP_XKBUTILS is not set
# BR2_PACKAGE_XAPP_XKILL is not set
# BR2_PACKAGE_XAPP_XLOAD is not set
# BR2_PACKAGE_XAPP_XLOGO is not set
# BR2_PACKAGE_XAPP_XLSATOMS is not set
# BR2_PACKAGE_XAPP_XLSCLIENTS is not set
# BR2_PACKAGE_XAPP_XLSFONTS is not set
# BR2_PACKAGE_XAPP_XMAG is not set
# BR2_PACKAGE_XAPP_XMAN is not set
# BR2_PACKAGE_XAPP_XMESSAGE is not set
# BR2_PACKAGE_XAPP_XMH is not set
# BR2_PACKAGE_XAPP_XMODMAP is not set
# BR2_PACKAGE_XAPP_XMORE is not set
# BR2_PACKAGE_XAPP_XPHELLOWORLD is not set
# BR2_PACKAGE_XAPP_XPLSPRINTERS is not set
# BR2_PACKAGE_XAPP_XPR is not set
# BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST is not set
# BR2_PACKAGE_XAPP_XPROP is not set
# BR2_PACKAGE_XAPP_XRANDR is not set
# BR2_PACKAGE_XAPP_XRDB is not set
# BR2_PACKAGE_XAPP_XREFRESH is not set
# BR2_PACKAGE_XAPP_XRX is not set
# BR2_PACKAGE_XAPP_XSET is not set
# BR2_PACKAGE_XAPP_XSETMODE is not set
# BR2_PACKAGE_XAPP_XSETPOINTER is not set
# BR2_PACKAGE_XAPP_XSETROOT is not set
# BR2_PACKAGE_XAPP_XSM is not set
# BR2_PACKAGE_XAPP_XSTDCMAP is not set
# BR2_PACKAGE_XAPP_XTRAP is not set
# BR2_PACKAGE_XAPP_XVIDTUNE is not set
# BR2_PACKAGE_XAPP_XVINFO is not set
# BR2_PACKAGE_XAPP_XWD is not set
# BR2_PACKAGE_XAPP_XWININFO is not set
# BR2_PACKAGE_XAPP_XWUD is not set

#
# X11R7 Fonts
#
# BR2_PACKAGE_XFONT_FONT_UTIL is not set
BR2_PACKAGE_XFONT_ENCODINGS=y
# BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1 is not set
BR2_PACKAGE_XFONT_FONT_ALIAS=y
# BR2_PACKAGE_XFONT_FONT_ARABIC_MISC is not set
# BR2_PACKAGE_XFONT_FONT_BH_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_TTF is not set
# BR2_PACKAGE_XFONT_FONT_BH_TYPE1 is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1 is not set
# BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC is not set
BR2_PACKAGE_XFONT_FONT_CURSOR_MISC=y
# BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC is not set
# BR2_PACKAGE_XFONT_FONT_DEC_MISC is not set
# BR2_PACKAGE_XFONT_FONT_IBM_TYPE1 is not set
# BR2_PACKAGE_XFONT_FONT_ISAS_MISC is not set
# BR2_PACKAGE_XFONT_FONT_JIS_MISC is not set
# BR2_PACKAGE_XFONT_FONT_MICRO_MISC is not set
# BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC is not set
# BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC is not set
# BR2_PACKAGE_XFONT_FONT_MISC_MELTHO is not set
BR2_PACKAGE_XFONT_FONT_MISC_MISC=y
# BR2_PACKAGE_XFONT_FONT_MUTT_MISC is not set
# BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC is not set
# BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC is not set
# BR2_PACKAGE_XFONT_FONT_SONY_MISC is not set
# BR2_PACKAGE_XFONT_FONT_SUN_MISC is not set
# BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC is not set
# BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1 is not set

#
# X11R7 X protocols
#
BR2_PACKAGE_XCB_PROTO=y
# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set
BR2_PACKAGE_XPROTO_BIGREQSPROTO=y
BR2_PACKAGE_XPROTO_COMPOSITEPROTO=y
BR2_PACKAGE_XPROTO_DAMAGEPROTO=y
# BR2_PACKAGE_XPROTO_DMXPROTO is not set
BR2_PACKAGE_XPROTO_EVIEEXT=y
BR2_PACKAGE_XPROTO_FIXESPROTO=y
BR2_PACKAGE_XPROTO_FONTCACHEPROTO=y
BR2_PACKAGE_XPROTO_FONTSPROTO=y
BR2_PACKAGE_XPROTO_GLPROTO=y
BR2_PACKAGE_XPROTO_INPUTPROTO=y
BR2_PACKAGE_XPROTO_KBPROTO=y
BR2_PACKAGE_XPROTO_PRINTPROTO=y
BR2_PACKAGE_XPROTO_RANDRPROTO=y
# BR2_PACKAGE_XPROTO_RECORDPROTO is not set
BR2_PACKAGE_XPROTO_RENDERPROTO=y
BR2_PACKAGE_XPROTO_RESOURCEPROTO=y
BR2_PACKAGE_XPROTO_SCRNSAVERPROTO=y
# BR2_PACKAGE_XPROTO_TRAPPROTO is not set
BR2_PACKAGE_XPROTO_VIDEOPROTO=y
# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set
BR2_PACKAGE_XPROTO_XCMISCPROTO=y
BR2_PACKAGE_XPROTO_XEXTPROTO=y
BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO=y
BR2_PACKAGE_XPROTO_XF86DGAPROTO=y
BR2_PACKAGE_XPROTO_XF86DRIPROTO=y
BR2_PACKAGE_XPROTO_XF86MISCPROTO=y
BR2_PACKAGE_XPROTO_XF86RUSHPROTO=y
BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO=y
# BR2_PACKAGE_XPROTO_XINERAMAPROTO is not set
BR2_PACKAGE_XPROTO_XPROTO=y
# BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL is not set

#
# X11R7 Utilities
#
# BR2_PACKAGE_XUTIL_MAKEDEPEND is not set
BR2_PACKAGE_XUTIL_UTIL_MACROS=y
# BR2_PACKAGE_MCOOKIE is not set

#
# X11R7 Other data
#
BR2_PACKAGE_XDATA_XBITMAPS=y
# BR2_PACKAGE_XDATA_XCURSOR_THEMES is not set
# BR2_PACKAGE_XKEYBOARD_CONFIG is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_PANGO is not set
BR2_PACKAGE_LIBDRM=y
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBGTK12 is not set
# BR2_PACKAGE_LIBGTK2 is not set
# BR2_PACKAGE_FLTK is not set
# BR2_PACKAGE_OPENMOTIF is not set
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
# BR2_PACKAGE_TSLIB is not set

#
# webkit requires a toolchain with C++ support and WCHAR enabled
#

#
# X Window managers
#
# BR2_PACKAGE_MATCHBOX is not set
# BR2_PACKAGE_METACITY is not set

#
# X applications
#
# BR2_PACKAGE_ALSAMIXERGUI is not set

#
# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
#
# BR2_PACKAGE_DOCKER is not set
# BR2_PACKAGE_GQVIEW is not set
# BR2_PACKAGE_GOB2 is not set
# BR2_PACKAGE_LEAFPAD is not set
# BR2_PACKAGE_MIDORI is not set
# BR2_PACKAGE_PCMANFM is not set
# BR2_PACKAGE_RDESKTOP is not set
# BR2_PACKAGE_RXVT is not set
# BR2_PACKAGE_SYLPHEED is not set
# BR2_PACKAGE_SYNERGY is not set
# BR2_PACKAGE_TORSMO is not set
# BR2_PACKAGE_X11VNC is not set
# BR2_PACKAGE_XPDF is not set
# BR2_PACKAGE_XSTROKE is not set
# BR2_PACKAGE_XVKBD is not set

#
# Compressors / decompressors
#
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZOP is not set

#
# lzma requires a toolchain with C++ support
#
# BR2_PACKAGE_LZMA_HOST is not set
BR2_PACKAGE_ZLIB=y
# BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set

#
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ support enabled
#

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Games
#
# BR2_PACKAGE_ACE_OF_PENGUINS is not set
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_LXDOOM is not set
# BR2_PACKAGE_MAGICCUBE4D is not set
# BR2_PACKAGE_PRBOOM is not set
# BR2_PACKAGE_RUBIX is not set
# BR2_PACKAGE_VICE is not set
# BR2_PACKAGE_XBOARD is not set

#
# Target filesystem options
#
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_ISO9660 is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_GRUB is not set
# BR2_TARGET_SYSLINUX is not set
# BR2_TARGET_PXELINUX is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
# BR2_KERNEL_HURD is not set
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Wed May  6 12:33:38 2009
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2009.05-rc1"
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
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
# BR2_x86_i586 is not set
BR2_x86_i686=y
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
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i686"
BR2_GCC_TARGET_ARCH="i686"

#
# Target options
#

#
# Project Options
#
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to Buildroot"

#
# Preset Devices
#
# BR2_TARGET_AMD is not set
# BR2_TARGET_X86 is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set

#
# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#
# BR2_TARGET_GENERIC_GETTY is not set

#
# Build options
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_COPYTO=""

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"

#
# Atmel Mirrors
#
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
# BR2_FPU_SUFFIX is not set
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_RECENT=y
# BR2_CONFIG_CACHE is not set
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
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
BR2_TOOLCHAIN_SOURCE=y
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_GCC_VERSION_4_2_2=y
BR2_EXT_GCC_VERSION_4_2_3=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_BINUTILS_VERSION_2_18=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_30=y
BR2_EXT_UCLIBC_VERSION_0_9_30_1=y

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_23 is not set
# BR2_KERNEL_HEADERS_2_6_24 is not set
# BR2_KERNEL_HEADERS_2_6_25 is not set
# BR2_KERNEL_HEADERS_2_6_26 is not set
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
BR2_KERNEL_HEADERS_2_6_29=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_30_1=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.30.1"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_PROGRAM_INVOCATION is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
BR2_BINUTILS_VERSION_2_19_1=y
BR2_BINUTILS_VERSION="2.19.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_1 is not set
# BR2_GCC_VERSION_4_2_2 is not set
# BR2_GCC_VERSION_4_2_3 is not set
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_1 is not set
# BR2_GCC_VERSION_4_3_2 is not set
BR2_GCC_VERSION_4_3_3=y
# BR2_GCC_VERSION_4_4_X is not set
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.3"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_LIBGCJ is not set
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
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PREGENERATED is not set
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US de"
BR2_USE_WCHAR=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
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
BR2_BUSYBOX_VERSION_1_14_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.14.0"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_MAKE is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_VALGRIND is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBOIL is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set

#
# Database
#
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQLITE is not set

#
# Networking
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IPERF is not set

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MDNSRESPONDER is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set

#
# netkitbase requires a toolchain with RPC support
#
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set

#
# quagga suite
#
# BR2_PACKAGE_QUAGGA_ZEBRA is not set
# BR2_PACKAGE_QUAGGA_BGPD is not set
# BR2_PACKAGE_QUAGGA_RIPD is not set
# BR2_PACKAGE_QUAGGA_RIPNGD is not set
# BR2_PACKAGE_QUAGGA_OSPFD is not set
# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
# BR2_PACKAGE_QUAGGA_ISISD is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
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
# Hardware handling / blockdevices and filesystem maintenance
#
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MKDOSFS is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# asterisk	- disabled (required openssl and mpg123)
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_FESTIVAL is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_VLC is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# text rendering libraries
#
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_SLANG is not set

#
# text rendering applications
#
# BR2_PACKAGE_DIALOG is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
BR2_PACKAGE_JPEG=y
# BR2_PACKAGE_LIBART is not set
BR2_PACKAGE_LIBPNG=y
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_SDL is not set
BR2_PACKAGE_TIFF=y

#
# busybox graphic applications
#

#
# --> May be broken in busybox
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FBSET is not set

#
# other GUIs
#
BR2_PACKAGE_QTOPIA4=y
# BR2_PACKAGE_QTOPIA4_DEBUG is not set
BR2_PACKAGE_QTOPIA4_SHARED=y
# BR2_PACKAGE_QTOPIA4_STATIC is not set
# BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED=y
# BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
BR2_PACKAGE_QTOPIA4_GUI_MODULE=y

#
# Pixel depths
#

#
# Deselecting each option leads to Qt's default (8,16,32)
#
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL is not set
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_1 is not set
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_4 is not set
BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_8=y
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_12 is not set
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_15 is not set
BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_16=y
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_18 is not set
BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_24=y
# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_32 is not set
# BR2_PACKAGE_QTOPIA4_GIF is not set
# BR2_PACKAGE_QTOPIA4_LIBMNG is not set
# BR2_PACKAGE_QTOPIA4_NOJPEG is not set
BR2_PACKAGE_QTOPIA4_SYSTEMJPEG=y
# BR2_PACKAGE_QTOPIA4_QTJPEG is not set
# BR2_PACKAGE_QTOPIA4_NOPNG is not set
BR2_PACKAGE_QTOPIA4_SYSTEMPNG=y
# BR2_PACKAGE_QTOPIA4_QTPNG is not set
# BR2_PACKAGE_QTOPIA4_NOTIFF is not set
BR2_PACKAGE_QTOPIA4_SYSTEMTIFF=y
# BR2_PACKAGE_QTOPIA4_QTTIFF is not set
BR2_PACKAGE_QTOPIA4_QTZLIB=y
# BR2_PACKAGE_QTOPIA4_SYSTEMZLIB is not set
# BR2_PACKAGE_QTOPIA4_NOFREETYPE is not set
# BR2_PACKAGE_QTOPIA4_QTFREETYPE is not set
BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE=y
BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="x86"
# BR2_PACKAGE_QTOPIA4_SQL_MODULE is not set

#
# Graphics drivers
#
BR2_PACKAGE_QTOPIA4_GFX_LINUXFB=y
# BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED is not set
# BR2_PACKAGE_QTOPIA4_GFX_QVFB is not set
# BR2_PACKAGE_QTOPIA4_GFX_VNC is not set
# BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN is not set

#
# Mouse drivers
#
# BR2_PACKAGE_QTOPIA4_MOUSE_PC is not set
# BR2_PACKAGE_QTOPIA4_MOUSE_BUS is not set
# BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP is not set
# BR2_PACKAGE_QTOPIA4_MOUSE_YOPY is not set
# BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX is not set
# BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB is not set
# BR2_PACKAGE_QTOPIA4_MOUSE_QVFB is not set
# BR2_PACKAGE_QTOPIA4_PHONON is not set
BR2_PACKAGE_QTOPIA4_XML=y
# BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
# BR2_PACKAGE_QTOPIA4_SVG is not set
BR2_PACKAGE_QTOPIA4_NETWORK=y
# BR2_PACKAGE_QTOPIA4_WEBKIT is not set
# BR2_PACKAGE_QTOPIA4_OPENSSL is not set
BR2_PACKAGE_QTOPIA4_SCRIPT=y
# BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS is not set
BR2_PACKAGE_XSERVER_none=y
# BR2_PACKAGE_XSERVER_xorg is not set
# BR2_PACKAGE_XSERVER_tinyx is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_LIBDRM is not set
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_OPENMOTIF is not set
# BR2_PACKAGE_FONTCONFIG is not set
BR2_PACKAGE_FREETYPE=y
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_WEBKIT is not set

#
# X Window managers
#
# BR2_PACKAGE_MATCHBOX is not set

#
# X applications
#
# BR2_PACKAGE_ALSAMIXERGUI is not set

#
# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
#
# BR2_PACKAGE_GQVIEW is not set
# BR2_PACKAGE_GOB2 is not set
# BR2_PACKAGE_LEAFPAD is not set

#
# midori		- disabled (requires Xorg(7))
#
# BR2_PACKAGE_PCMANFM is not set
# BR2_PACKAGE_SYLPHEED is not set
# BR2_PACKAGE_TORSMO is not set
# BR2_PACKAGE_X11VNC is not set
# BR2_PACKAGE_XPDF is not set
# BR2_PACKAGE_XSTROKE is not set
# BR2_PACKAGE_XVKBD is not set

#
# Compressors / decompressors
#
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA_TARGET is not set
# BR2_PACKAGE_LZMA_HOST is not set
BR2_PACKAGE_ZLIB=y
# BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set

#
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_XERCES is not set

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_MAGICCUBE4D is not set
# BR2_PACKAGE_PRBOOM is not set
# BR2_PACKAGE_RUBIX is not set
# BR2_PACKAGE_VICE is not set
# BR2_PACKAGE_XBOARD is not set

#
# Target filesystem options
#
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_ISO9660 is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_GRUB is not set
# BR2_TARGET_SYSLINUX is not set
# BR2_TARGET_PXELINUX is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
# BR2_KERNEL_HURD is not set
