From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Sun, 10 Jan 2010 13:22:09 +0530
Subject: [Buildroot] Fwd:  Compiling error with microperl
In-Reply-To: <b680c1c11001080924n3e6a898bib25aab764b5a7ba6@mail.gmail.com>
References: <532dd5841001072305t2fed0ea0g2992e5a04ac61197@mail.gmail.com>
	<b680c1c11001080923g4175a366icc1e37c1e8c7c2a4@mail.gmail.com>
	<b680c1c11001080924n3e6a898bib25aab764b5a7ba6@mail.gmail.com>
Message-ID: <532dd5841001092352xf8a98f7rd45f221f81b21170@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Nicholas thanks for your reply.

 >The most obvious question to me is, do you actually need to do native
>development on your target? If not, turn off
>BR2_TARGET_GENERIC_DEV_SYSTEM and only select the packages you
>actually need to run on the target. Otherwise, you could edit
>package/autoconf/Config.in to remove the dependency, but don't be
>surprised if that breaks autoconf on the target.
Yeah i have turned off BR2_TARGET_GENERIC_DEV_SYSTEM and manually
selected the minimal packages which i need on the target  and i came
over microperl thing by not selecting the auto conf and manually
select the packages which it selects except microperl. Now tat error
is gone but another error i'm facing is which is related to X

which is something below


[I]lcGenConv.c: In function 'stdc_mbstowcs':
lcGenConv.c:865: warning: implicit declaration of function 'mbtowc'
lcGenConv.c:865: warning: nested extern declaration of 'mbtowc'
lcGenConv.c: In function 'stdc_wcstombs':
lcGenConv.c:1030: error: 'MB_CUR_MAX' undeclared (first use in this function)
lcGenConv.c:1030: error: (Each undeclared identifier is reported only once
lcGenConv.c:1030: error: for each function it appears in.)
lcGenConv.c:1031: warning: implicit declaration of function 'wctomb'
lcGenConv.c:1031: warning: nested extern declaration of 'wctomb'
lcGenConv.c: In function 'stdc_wcstocts':
lcGenConv.c:1217: error: 'MB_CUR_MAX' undeclared (first use in this function)
lcGenConv.c: In function 'stdc_ctstowcs':
lcGenConv.c:1540: error: 'MB_CUR_MAX' undeclared (first use in this function)
lcGenConv.c: In function 'stdc_cstowcs':
lcGenConv.c:1576: error: 'MB_CUR_MAX' undeclared (first use in this function)
lcGenConv.c: In function 'stdc_wcstostr':
lcGenConv.c:2069: error: 'MB_CUR_MAX' undeclared (first use in this function)
lcGenConv.c: In function 'stdc_strtowcs':
lcGenConv.c:2598: error: 'MB_CUR_MAX' undeclared (first use in this function)
make[4]: *** [lcGenConv.lo] Error 1
make[4]: Leaving directory
`/home/ravi/buildroot/buildroot-2009.08/build_arm/xlib_libX11-1.1.5/modules/lc/gen'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/ravi/buildroot/buildroot-2009.08/build_arm/xlib_libX11-1.1.5/modules/lc'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/ravi/buildroot/buildroot-2009.08/build_arm/xlib_libX11-1.1.5/modules'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/ravi/buildroot/buildroot-2009.08/build_arm/xlib_libX11-1.1.5'
make: *** [/home/ravi/buildroot/buildroot-2009.08/build_arm/xlib_libX11-1.1.5/.stamp_built]
Error 2 [I]


i tried to google a bit about this error and i came to know tat its
related to some X11font and we we hav to modify host.def file ? can
anybody tell where exactly is this file located on file system . i
couldnt find it on mine,  i'm attachin config file of my own . thanks.
warm regards,
Ravi Kulkarni.
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Sun Jan 10 13:12:57 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2009.08"
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
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
# BR2_xtensa is not set
# BR2_generic_arm is not set
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
BR2_arm926t=y
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM926T"
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="apcs-gnu"

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
BR2_TARGET_ARMLTD=y

#
# ARM Ltd. based Device Support
#
BR2_TARGET_ARM_INTEGRATOR_926=y
# BR2_TARGET_ARM_INTEGRATOR_926_HUGE is not set
BR2_BOARD_NAME="integrator926"
BR2_BOARD_PATH="target/device/ARMLTD/$(BR2_BOARD_NAME)"
BR2_TARGET_ATMEL=y

#
# Atmel AT91 Specific Device Support
#
BR2_TARGET_AT91=y

#
# Selection criteria
#
BR2_TARGET_ATMEL_ALL=y

#
# Device Selection
#
# BR2_TARGET_AT91RM9200 is not set
# BR2_TARGET_AT91SAM9260 is not set
# BR2_TARGET_AT91SAM9G20 is not set
BR2_TARGET_AT91SAM9261=y
# BR2_TARGET_AT91SAM9261S is not set
# BR2_TARGET_AT91SAM9RL64 is not set
# BR2_TARGET_AT91SAM9263 is not set
# BR2_TARGET_AT91SAM9G40 is not set
# BR2_TARGET_AT91SAM9M10 is not set
# BR2_TARGET_AT91SAM9M11 is not set
# BR2_TARGET_AT91SAM9XE is not set
# BR2_TARGET_AT572D940HF is not set
# BR2_TARGET_AT91CAP9 is not set

#
# Development Board Selection
#
# BR2_TARGET_AT91RM9200DF is not set
# BR2_TARGET_AT91RM9200EK is not set
# BR2_TARGET_AT91RM9200DK is not set
# BR2_TARGET_AT91SAM9260DFC is not set
# BR2_TARGET_AT91SAM9260EK is not set
# BR2_TARGET_AT91SAM9G20DFC is not set
# BR2_TARGET_AT91SAM9G20EK is not set
# BR2_TARGET_AT91SAM9XEEK is not set
BR2_TARGET_AT91SAM9261EK=y
# BR2_TARGET_AT91SAM9RL64EK is not set
# BR2_TARGET_AT91SAM9263EK is not set
# BR2_TARGET_AT572D940DCM is not set
# BR2_TARGET_AT91CAP9DK is not set
# BR2_TARGET_AT91CAP9ADK is not set
BR2_TARGET_AT91SAM9261EK_SPIMODE0=y
# BR2_TARGET_AT91SAM9261EK_SPIMODE3 is not set
BR2_TARGET_AT91_ADVANCED_INFO=y

#
# Package support
#

#
# Secondary locations
#
BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
BR2_TARGET_ATMEL_COPYTO="/tftpboot"
# BR2_TARGET_DATAFLASHBOOT is not set
# BR2_TARGET_AT91BOOTSTRAP is not set
# BR2_TARGET_KWIKBYTE is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set

#
# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#

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
# BR2_KERNEL_HEADERS_2_6_26 is not set
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
# BR2_KERNEL_HEADERS_2_6_29 is not set
BR2_KERNEL_HEADERS_2_6_30=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.30.5"

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
# BR2_GCC_VERSION_4_3_2 is not set
BR2_GCC_VERSION_4_3_3=y
# BR2_GCC_VERSION_4_3_4 is not set
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
BR2_PACKAGE_GDB=y
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set
# BR2_GDB_VERSION_6_4 is not set
# BR2_GDB_VERSION_6_5 is not set
# BR2_GDB_VERSION_6_6 is not set
# BR2_GDB_VERSION_6_7_1 is not set
BR2_GDB_VERSION_6_8=y
BR2_GDB_VERSION="6.8"

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
BR2_INET_RPC=y
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
# BR2_USE_WCHAR is not set
# BR2_SOFT_FLOAT is not set
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PROGRAM_INVOCATION is not set
# BR2_INSTALL_LIBSTDCPP is not set
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_ELF2FLT is not set
# BR2_MKLIBS is not set
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
# BR2_VFP_FLOAT is not set
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_12_X is not set
# BR2_BUSYBOX_VERSION_1_13_X is not set
BR2_BUSYBOX_VERSION_1_14_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.14.3"
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
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
BR2_PACKAGE_GETTEXT=y
# BR2_PACKAGE_GETTEXT_STATIC is not set
BR2_PACKAGE_LIBINTL=y
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_MPATROL is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
BR2_PACKAGE_AT=y
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_FILE is not set
BR2_PACKAGE_GAMIN=y

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
BR2_PACKAGE_KEXEC=y
BR2_PACKAGE_KEXEC_ZLIB=y
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
BR2_PACKAGE_LIBDAEMON=y
BR2_PACKAGE_LIBELF=y
# BR2_PACKAGE_LIBELF_HEADERS is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
BR2_PACKAGE_LIBICONV=y
# BR2_PACKAGE_LIBIDN is not set
BR2_PACKAGE_LIBLOCKFILE=y
# BR2_PACKAGE_LIBOIL is not set
BR2_PACKAGE_LIBSYSFS=y
BR2_PACKAGE_LOCKFILE_PROGS=y

#
# logrotate     - disabled (requires wchar support)
#
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
BR2_PACKAGE_MEMSTAT=y
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
BR2_PACKAGE_STARTUP_NOTIFICATION=y
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
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE is not set

#
# ctorrent requires a toolchain with C++ support enabled
#
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
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBNL is not set
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
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
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
# BR2_PACKAGE_SPAWN_FCGI is not set
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
# BR2_PACKAGE_DBUS is not set
BR2_PACKAGE_DEVMEM2=y
# BR2_PACKAGE_DMRAID is not set
BR2_PACKAGE_DOSFSTOOLS=y
# BR2_PACKAGE_DOSFSTOOLS_MKDOSFS is not set
# BR2_PACKAGE_DOSFSTOOLS_DOSFSCK is not set
BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL=y
# BR2_PACKAGE_LIBUUID is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
BR2_PACKAGE_INPUT_TOOLS=y
BR2_PACKAGE_INPUT_TOOLS_EVTEST=y
BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH=y
BR2_PACKAGE_INPUT_TOOLS_JSCAL=y
BR2_PACKAGE_INPUT_TOOLS_JSTEST=y
BR2_PACKAGE_IOSTAT=y
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
BR2_PACKAGE_LIBUSB=y
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
BR2_PACKAGE_MEMTESTER=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_UTILS=y
# BR2_PACKAGE_MTD_UTILS_GIT is not set

#
# MTD tools selection
#
# BR2_PACKAGE_MTD_DOCFDISK is not set
# BR2_PACKAGE_MTD_DOC_LOADBIOS is not set
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FTL_CHECK=y
BR2_PACKAGE_MTD_FTL_FORMAT=y
BR2_PACKAGE_MTD_JFFS2DUMP=y
BR2_PACKAGE_MTD_MKFSJFFS2=y
# BR2_PACKAGE_MTD_MKFSJFFS is not set
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDWRITE=y
# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
# BR2_PACKAGE_MTD_NFTLDUMP is not set
BR2_PACKAGE_MTD_SUMTOOL=y

#
# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
#

#
# ntfsprogs requires a toolchain with WCHAR support
#
# BR2_PACKAGE_PCIUTILS is not set
BR2_PACKAGE_SETSERIAL=y
# BR2_PACKAGE_SMARTMONTOOLS is not set
BR2_PACKAGE_UDEV_VOLUME_ID=y
BR2_PACKAGE_UDEV_SCSI_ID=y
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
BR2_PACKAGE_ALSA_LIB=y
BR2_PACKAGE_ALSA_UTILS=y

#
# ALSA utils selection
#
# BR2_PACKAGE_ALSA_UTILS_ALSACONF is not set
BR2_PACKAGE_ALSA_UTILS_ALSACTL=y
BR2_PACKAGE_ALSA_UTILS_ALSAMIXER=y
# BR2_PACKAGE_ALSA_UTILS_AMIDI is not set
# BR2_PACKAGE_ALSA_UTILS_AMIXER is not set
# BR2_PACKAGE_ALSA_UTILS_APLAY is not set
# BR2_PACKAGE_ALSA_UTILS_ARECORD is not set
# BR2_PACKAGE_ALSA_UTILS_IECSET is not set
# BR2_PACKAGE_ALSA_UTILS_ACONNECT is not set
# BR2_PACKAGE_ALSA_UTILS_APLAYMIDI is not set
# BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI is not set
# BR2_PACKAGE_ALSA_UTILS_ASEQDUMP is not set
# BR2_PACKAGE_ALSA_UTILS_ASEQNET is not set
# BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST is not set

#
# asterisk	- disabled (required openssl and mpg123)
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBID3TAG is not set
BR2_PACKAGE_LIBMAD=y
# BR2_PACKAGE_LIBMAD_TARGET_HEADERS is not set
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
BR2_PACKAGE_MPLAYER=y
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
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_PANEL=y
BR2_PACKAGE_NCURSES_TARGET_FORM=y
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NCURSES_TARGET_HEADERS is not set
# BR2_PACKAGE_NEWT is not set
BR2_PACKAGE_SLANG=y

#
# text rendering applications
#
BR2_PACKAGE_DIALOG=y

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
BR2_PACKAGE_PIXMAN=y
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

#
# qt requires a toolchain with C++ support enabled
#
BR2_PACKAGE_XORG7=y
# BR2_PACKAGE_XSERVER_xorg is not set
# BR2_PACKAGE_XSERVER_tinyx is not set

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
BR2_PACKAGE_PTHREAD_STUBS=y
# BR2_PACKAGE_XCB_UTIL is not set
BR2_PACKAGE_XLIB_LIBFS=y
BR2_PACKAGE_XLIB_LIBICE=y
BR2_PACKAGE_XLIB_LIBSM=y
BR2_PACKAGE_XLIB_LIBX11=y
BR2_PACKAGE_XLIB_LIBXSCRNSAVER=y
# BR2_PACKAGE_XLIB_LIBXTRAP is not set
BR2_PACKAGE_XLIB_LIBXAU=y
BR2_PACKAGE_XLIB_LIBXAW=y
# BR2_PACKAGE_XLIB_LIBXCOMPOSITE is not set
BR2_PACKAGE_XLIB_LIBXCURSOR=y
BR2_PACKAGE_XLIB_LIBXDAMAGE=y
BR2_PACKAGE_XLIB_LIBXDMCP=y
# BR2_PACKAGE_XLIB_LIBXEVIE is not set
BR2_PACKAGE_XLIB_LIBXEXT=y
BR2_PACKAGE_XLIB_LIBXFIXES=y
BR2_PACKAGE_XLIB_LIBXFONT=y
BR2_PACKAGE_XLIB_LIBXFONTCACHE=y
BR2_PACKAGE_XLIB_LIBXFT=y
BR2_PACKAGE_XLIB_LIBXI=y
# BR2_PACKAGE_XLIB_LIBXINERAMA is not set
BR2_PACKAGE_XLIB_LIBXMU=y
BR2_PACKAGE_XLIB_LIBXP=y
BR2_PACKAGE_XLIB_LIBXPM=y
# BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL is not set
BR2_PACKAGE_XLIB_LIBXPRINTUTIL=y
# BR2_PACKAGE_XLIB_LIBXRANDR is not set
BR2_PACKAGE_XLIB_LIBXRENDER=y
BR2_PACKAGE_XLIB_LIBXRES=y
BR2_PACKAGE_XLIB_LIBXT=y
BR2_PACKAGE_XLIB_LIBXTST=y
BR2_PACKAGE_XLIB_LIBXV=y
BR2_PACKAGE_XLIB_LIBXVMC=y
# BR2_PACKAGE_XLIB_LIBXXF86DGA is not set
BR2_PACKAGE_XLIB_LIBXXF86MISC=y
BR2_PACKAGE_XLIB_LIBXXF86VM=y
# BR2_PACKAGE_XLIB_LIBDMX is not set
BR2_PACKAGE_XLIB_LIBFONTENC=y
BR2_PACKAGE_XLIB_LIBLBXUTIL=y
# BR2_PACKAGE_XLIB_LIBOLDX is not set
BR2_PACKAGE_XLIB_LIBXKBFILE=y
# BR2_PACKAGE_XLIB_LIBXKBUI is not set
BR2_PACKAGE_XLIB_XTRANS=y
# BR2_PACKAGE_XLIB_LIBPCIACCESS is not set

#
# X11R7 Applications
#
# BR2_PACKAGE_XAPP_APPRES is not set
# BR2_PACKAGE_XAPP_BDFTOPCF is not set
BR2_PACKAGE_XAPP_BEFORELIGHT=y
# BR2_PACKAGE_XAPP_BITMAP is not set
# BR2_PACKAGE_XAPP_EDITRES is not set
BR2_PACKAGE_XAPP_FONTTOSFNT=y
# BR2_PACKAGE_XAPP_FSLSFONTS is not set
# BR2_PACKAGE_XAPP_FSTOBDF is not set
# BR2_PACKAGE_XAPP_ICEAUTH is not set
# BR2_PACKAGE_XAPP_ICO is not set
# BR2_PACKAGE_XAPP_LBXPROXY is not set
# BR2_PACKAGE_XAPP_LISTRES is not set
# BR2_PACKAGE_XAPP_LUIT is not set
# BR2_PACKAGE_XAPP_MKFONTDIR is not set
# BR2_PACKAGE_XAPP_MKFONTSCALE is not set
BR2_PACKAGE_XAPP_OCLOCK=y
# BR2_PACKAGE_XAPP_PROXYMNGR is not set
# BR2_PACKAGE_XAPP_RGB is not set
# BR2_PACKAGE_XAPP_RSTART is not set
# BR2_PACKAGE_XAPP_SCRIPTS is not set
# BR2_PACKAGE_XAPP_SESSREG is not set
# BR2_PACKAGE_XAPP_SETXKBMAP is not set
BR2_PACKAGE_XAPP_SHOWFONT=y
# BR2_PACKAGE_XAPP_SMPROXY is not set
# BR2_PACKAGE_XAPP_TWM is not set
# BR2_PACKAGE_XAPP_VIEWRES is not set
BR2_PACKAGE_XAPP_X11PERF=y
# BR2_PACKAGE_XAPP_XAUTH is not set
BR2_PACKAGE_XAPP_XBACKLIGHT=y
# BR2_PACKAGE_XAPP_XBIFF is not set
BR2_PACKAGE_XAPP_XCALC=y
# BR2_PACKAGE_XAPP_XCLIPBOARD is not set
BR2_PACKAGE_XAPP_XCLOCK=y
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
BR2_PACKAGE_XAPP_XINPUT=y
# BR2_PACKAGE_XAPP_XKBCOMP is not set
BR2_PACKAGE_XAPP_XKBEVD=y
# BR2_PACKAGE_XAPP_XKBPRINT is not set
# BR2_PACKAGE_XAPP_XKBUTILS is not set
BR2_PACKAGE_XAPP_XKILL=y
# BR2_PACKAGE_XAPP_XLOAD is not set
BR2_PACKAGE_XAPP_XLOGO=y
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
BR2_PACKAGE_XAPP_XSETMODE=y
BR2_PACKAGE_XAPP_XSETPOINTER=y
# BR2_PACKAGE_XAPP_XSETROOT is not set
BR2_PACKAGE_XAPP_XSM=y
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
BR2_PACKAGE_XFONT_FONT_UTIL=y
BR2_PACKAGE_XFONT_ENCODINGS=y
# BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1 is not set
BR2_PACKAGE_XFONT_FONT_ALIAS=y
BR2_PACKAGE_XFONT_FONT_ARABIC_MISC=y
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
BR2_PACKAGE_XPROTO_RECORDPROTO=y
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
BR2_PACKAGE_ATK=y
BR2_PACKAGE_CAIRO=y
BR2_PACKAGE_CAIRO_PS=y
BR2_PACKAGE_CAIRO_PDF=y
BR2_PACKAGE_CAIRO_PNG=y
# BR2_PACKAGE_CAIRO_SVG is not set
BR2_PACKAGE_PANGO=y
BR2_PACKAGE_LIBDRM=y
BR2_PACKAGE_LIBERATION=y
BR2_PACKAGE_LIBGLADE=y
BR2_PACKAGE_LIBGLIB12=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_LIBGTK12=y
BR2_PACKAGE_LIBGTK2=y
BR2_PACKAGE_LIBGTK2_ENGINES=y

#
# GTK Themes
#
BR2_PACKAGE_GTK2_THEME_HICOLOR=y
# BR2_PACKAGE_LIBSEXY is not set
BR2_PACKAGE_FLTK=y
# BR2_PACKAGE_OPENMOTIF is not set
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_TSLIB=y

#
# webkit requires a toolchain with C++ support and WCHAR enabled
#

#
# X Window managers
#
BR2_PACKAGE_MATCHBOX=y
BR2_PACKAGE_MATCHBOX_SNOTIFY=y
BR2_PACKAGE_MATCHBOX_PANEL=y
BR2_PACKAGE_MATCHBOX_DESKTOP=y
BR2_PACKAGE_MATCHBOX_KEYBOARD=y
# BR2_PACKAGE_METACITY is not set

#
# X applications
#
# BR2_PACKAGE_ALSAMIXERGUI is not set
# BR2_PACKAGE_DILLO is not set
# BR2_PACKAGE_DOCKER is not set
# BR2_PACKAGE_GQVIEW is not set
# BR2_PACKAGE_GMPC is not set
# BR2_PACKAGE_GOB2 is not set
BR2_PACKAGE_GTKPERF=y
# BR2_PACKAGE_LEAFPAD is not set
# BR2_PACKAGE_MIDORI is not set
BR2_PACKAGE_PCMANFM=y
# BR2_PACKAGE_RDESKTOP is not set
# BR2_PACKAGE_RXVT is not set
# BR2_PACKAGE_SYLPHEED is not set
# BR2_PACKAGE_SYNERGY is not set
# BR2_PACKAGE_TORSMO is not set
BR2_PACKAGE_X11VNC=y
# BR2_PACKAGE_XPDF is not set
# BR2_PACKAGE_XSTROKE is not set
BR2_PACKAGE_XVKBD=y

#
# Compressors / decompressors
#
BR2_PACKAGE_LZO=y
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

#
# ruby requires a toolchain with WCHAR support
#
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
BR2_PACKAGE_LIBXML2=y
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
BR2_PACKAGE_GNUCHESS=y
# BR2_PACKAGE_LXDOOM is not set
# BR2_PACKAGE_MAGICCUBE4D is not set
# BR2_PACKAGE_PRBOOM is not set
# BR2_PACKAGE_RUBIX is not set
# BR2_PACKAGE_VICE is not set
BR2_PACKAGE_XBOARD=y

#
# Target filesystem options
#
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
BR2_TARGET_ROOTFS_JFFS2=y
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K is not set
# BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
# BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x1000
BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
# BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER is not set
# BR2_JFFS2_TARGET_SREC is not set
# BR2_TARGET_ROOTFS_JFFS2_PAD is not set
BR2_TARGET_ROOTFS_JFFS2_LE=y
# BR2_TARGET_ROOTFS_JFFS2_BE is not set
BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_UBOOT is not set
BR2_BOOTSOURCE_DATAFLASH=y
BR2_BOOTSOURCE_NANDFLASH=y
BR2_BOOTSOURCE=y

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
