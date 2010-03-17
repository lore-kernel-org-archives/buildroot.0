From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Wed, 17 Mar 2010 12:51:04 +0545
Subject: [Buildroot] jffs2 filesystem doesnt boot with buildroot 2010.02
In-Reply-To: <48ab7e011003151840p11db5be3i8d912002a85ea75@mail.gmail.com>
References: <532dd5841003150250p6ad2d8b4h15b9b7ec725cc347@mail.gmail.com>
	<48ab7e011003151840p11db5be3i8d912002a85ea75@mail.gmail.com>
Message-ID: <532dd5841003170006h7727eb08n603f544a72c95700@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> How did you flash the jffs2 image to NAND?
 I flashed it via u-boot using  a usb drive.
the steps i did  r below
usb start
fatls usb 0
fatload usb 0 0x20000000 rootfs.arm.jffs2.img
nand write.jffs2 0x20000000 0x0 HEXVALUE
 HEXVALUE is calculated as value we get
size of image in bytes/(128*1024)= some num.
 tat some num is rounded off to next value * (128*1024)=HEXVALUE
my old buildroot 2009.05 works fine.
warm regards,
Ravi Kulkarni.

>
> 2010/3/15 Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
>>
>> Hi all,
>> i was using buildroot.2009.05 these days and decided to upgrade.
>> to ?buildroot.2010.02 ?. i built a minimal jffs2 filesystem for my
>> target board AT91SAM9261 which is ARM based. im able to generate a
>> jffs2 filesystem
>> image from it. however when i flash it to nand its not booting ?the
>> message im gettin below
>>
>> [ ? ?1.460000] NET: Registered protocol family 17
>> [ ? ?2.300000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
>> at 0x0057bdb8: 0x9c46 instead
>> [ ? ?2.310000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
>> at 0x0057bdbc: 0xe8cd instead
>> [ ? ?2.320000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
>> at 0x0057bdc0: 0x0080 instead
>> [ ? ?2.330000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
>> at 0x0057bdc4: 0x4012 instead
>> [ ? ?2.340000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
>> at 0x0057bdc8: 0x3400 instead
>> [ ? ?2.340000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
>> at 0x0057bdcc: 0xff9b instead
>> [ ? ?2.720000] VFS: Mounted root (jffs2 filesystem) on device 31:0.
>> [ ? ?2.720000] Freeing init memory: 252K
>> [ ? ?2.800000] init used greatest stack depth: 5340 bytes left
>> [ ? ?2.800000] Kernel panic - not syncing: Attempted to kill init!
>> [ ? ?2.810000] Backtrace:
>> [ ? ?2.810000] [<c004b144>] (dump_backtrace+0x0/0x10c) from
>> [<c004b5dc>] (dump_stack+0x18/0x1c)
>> [ ? ?2.820000] ?r6:c7818000 r5:c7818000 r4:c03224d8
>> [ ? ?2.830000] [<c004b5c4>] (dump_stack+0x0/0x1c) from [<c005ba54>]
>> (panic+0x4c/0x134)
>> [ ? ?2.830000] [<c005ba08>] (panic+0x0/0x134) from [<c005e870>]
>> (do_exit+0x64/0x66c)
>> [ ? ?2.840000] ?r3:c0304bb8 r2:c7818228 r1:c7821c10 r0:c02bb1e8
>> [ ? ?2.850000] [<c005e80c>] (do_exit+0x0/0x66c) from [<c005ef08>]
>> (do_group_exit+0x90/0xc4)
>> [ ? ?2.850000] [<c005ee78>] (do_group_exit+0x0/0xc4) from [<c0068674>]
>> (get_signal_to_deliver+0x2e0/0x318)
>> [ ? ?2.860000] ?r4:0000000b
>> [ ? ?2.870000] [<c0068394>] (get_signal_to_deliver+0x0/0x318) from
>> [<c0049a8c>] (do_signal+0x58/0x4e8)
>> [ ? ?2.880000] [<c0049a34>] (do_signal+0x0/0x4e8) from [<c0049f48>]
>> (do_notify_resume+0x2c/0x30)
>> [ ? ?2.880000] [<c0049f1c>] (do_notify_resume+0x0/0x30) from
>> [<c004792c>] (work_pending+0x1c/0x20)
>>
>>
>> attached is my config file ?. can any one tell what is wrong ?
>>
>> #
>> # Automatically generated make config: don't edit
>> # Wed Mar 10 15:30:59 2010
>> #
>> BR2_HAVE_DOT_CONFIG=y
>> BR2_VERSION="2010.02"
>> # BR2_alpha is not set
>> BR2_arm=y
>> # BR2_armeb is not set
>> # BR2_avr32 is not set
>> # BR2_cris is not set
>> # BR2_ia64 is not set
>> # BR2_i386 is not set
>> # BR2_m68k is not set
>> # BR2_mips is not set
>> # BR2_mipsel is not set
>> # BR2_nios2 is not set
>> # BR2_powerpc is not set
>> # BR2_sh is not set
>> # BR2_sh64 is not set
>> # BR2_sparc is not set
>> # BR2_sparc64 is not set
>> # BR2_x86_64 is not set
>> # BR2_xtensa is not set
>> BR2_generic_arm=y
>> # BR2_arm7tdmi is not set
>> # BR2_arm610 is not set
>> # BR2_arm710 is not set
>> # BR2_arm720t is not set
>> # BR2_arm920t is not set
>> # BR2_arm922t is not set
>> # BR2_arm926t is not set
>> # BR2_arm10t is not set
>> # BR2_arm1136jf_s is not set
>> # BR2_arm1176jz_s is not set
>> # BR2_arm1176jzf_s is not set
>>
>> #
>> # cortex-A8 needs gcc >= 4.4.x
>> #
>> # BR2_cortex_a8 is not set
>> # BR2_sa110 is not set
>> # BR2_sa1100 is not set
>> # BR2_xscale is not set
>> # BR2_iwmmxt is not set
>> BR2_ARM_TYPE="GENERIC_ARM"
>> BR2_ARM_EABI=y
>> # BR2_ARM_OABI is not set
>> BR2_ARCH="arm"
>> BR2_ENDIAN="LITTLE"
>> BR2_GCC_TARGET_ABI="aapcs-linux"
>>
>> #
>> # Target options
>> #
>>
>> #
>> # Preset Devices
>> #
>> BR2_TARGET_ARMLTD=y
>>
>> #
>> # ARM Ltd. based Device Support
>> #
>> BR2_TARGET_ARM_INTEGRATOR_926=y
>> # BR2_TARGET_ARM_INTEGRATOR_926_HUGE is not set
>> BR2_BOARD_NAME="integrator926"
>> BR2_BOARD_PATH="target/device/ARMLTD/$(BR2_BOARD_NAME)"
>> # BR2_TARGET_ATMEL is not set
>> # BR2_TARGET_KWIKBYTE is not set
>> BR2_TARGET_GENERIC_HOSTNAME="buildroot"
>> BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
>> BR2_TARGET_GENERIC_GETTY=y
>> # BR2_TARGET_GENERIC_GETTY_NONE is not set
>> BR2_TARGET_GENERIC_GETTY_TTYS0=y
>> # BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYS2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYS3 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYAMA0 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYAMA1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYAMA2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYAMA3 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYSAC0 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYSAC1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYSAC2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYSAC3 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYMXC0 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYMXC1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYMXC2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYUL0 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYUL1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYUL2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYUL3 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYPSC0 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYPSC1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYPSC2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYPSC3 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYCPM0 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYCPM1 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYCPM2 is not set
>> # BR2_TARGET_GENERIC_GETTY_TTYCPM3 is not set
>> BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
>> BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>> BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
>>
>> #
>> # Build options
>> #
>> BR2_WGET="wget --passive-ftp -nd"
>> BR2_SVN_CO="svn co"
>> BR2_SVN_UP="svn up"
>> BR2_BZR_CO="bzr co"
>> BR2_BZR_UP="bzr up"
>> BR2_GIT="git clone"
>> BR2_ZCAT="gzip -d -c"
>> BR2_BZCAT="bzcat"
>> BR2_TAR_OPTIONS=""
>> BR2_DL_DIR="$(TOPDIR)/dl"
>> BR2_COPYTO=""
>>
>> #
>> # Mirrors and Download locations
>> #
>> BR2_PRIMARY_SITE=""
>> BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
>> BR2_SOURCEFORGE_MIRROR="easynews"
>> BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
>> BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
>> BR2_DEBIAN_MIRROR="http://ftp.debian.org"
>> BR2_STAGING_DIR="$(BASE_DIR)/staging"
>> BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
>> BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
>> BR2_JLEVEL=1
>> # BR2_PREFER_IMA is not set
>> # BR2_DEPRECATED is not set
>> BR2_RECENT=y
>> BR2_CONFIG_CACHE=y
>> # BR2_ENABLE_DEBUG is not set
>> BR2_STRIP_strip=y
>> # BR2_STRIP_sstrip is not set
>> # BR2_STRIP_none is not set
>> # BR2_OPTIMIZE_0 is not set
>> # BR2_OPTIMIZE_1 is not set
>> # BR2_OPTIMIZE_2 is not set
>> # BR2_OPTIMIZE_3 is not set
>> BR2_OPTIMIZE_S=y
>> # BR2_PREFER_STATIC_LIB is not set
>> # BR2_HAVE_MANPAGES is not set
>> # BR2_HAVE_INFOPAGES is not set
>> # BR2_HAVE_DOCUMENTATION is not set
>> # BR2_HAVE_DEVFILES is not set
>> BR2_UPDATE_CONFIG=y
>>
>> #
>> # Toolchain
>> #
>> BR2_TOOLCHAIN_BUILDROOT=y
>> # BR2_TOOLCHAIN_EXTERNAL is not set
>>
>> #
>> # Kernel Header Options
>> #
>> # BR2_KERNEL_HEADERS_2_6_26 is not set
>> # BR2_KERNEL_HEADERS_2_6_27 is not set
>> # BR2_KERNEL_HEADERS_2_6_28 is not set
>> # BR2_KERNEL_HEADERS_2_6_29 is not set
>> # BR2_KERNEL_HEADERS_2_6_30 is not set
>> # BR2_KERNEL_HEADERS_2_6_31 is not set
>> BR2_KERNEL_HEADERS_2_6_32=y
>> # BR2_KERNEL_HEADERS_VERSION is not set
>> # BR2_KERNEL_HEADERS_SNAP is not set
>> BR2_DEFAULT_KERNEL_HEADERS="2.6.32.9"
>>
>> #
>> # uClibc Options
>> #
>> # BR2_UCLIBC_VERSION_0_9_28_3 is not set
>> # BR2_UCLIBC_VERSION_0_9_29 is not set
>> # BR2_UCLIBC_VERSION_0_9_30 is not set
>> # BR2_UCLIBC_VERSION_0_9_30_1 is not set
>> BR2_UCLIBC_VERSION_0_9_30_2=y
>> # BR2_UCLIBC_VERSION_SNAPSHOT is not set
>> BR2_UCLIBC_VERSION_STRING="0.9.30.2"
>> BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
>> # BR2_PTHREAD_DEBUG is not set
>> # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
>>
>> #
>> # Binutils Options
>> #
>> # BR2_BINUTILS_VERSION_2_17 is not set
>> # BR2_BINUTILS_VERSION_2_18 is not set
>> # BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
>> # BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
>> # BR2_BINUTILS_VERSION_2_19 is not set
>> # BR2_BINUTILS_VERSION_2_19_1 is not set
>> BR2_BINUTILS_VERSION_2_20=y
>> BR2_BINUTILS_VERSION="2.20"
>> BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
>>
>> #
>> # GCC Options
>> #
>> # BR2_GCC_VERSION_4_1_2 is not set
>> # BR2_GCC_VERSION_4_2_1 is not set
>> # BR2_GCC_VERSION_4_2_2 is not set
>> # BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
>> # BR2_GCC_VERSION_4_2_3 is not set
>> # BR2_GCC_VERSION_4_2_4 is not set
>> # BR2_GCC_VERSION_4_3_2 is not set
>> # BR2_GCC_VERSION_4_3_3 is not set
>> BR2_GCC_VERSION_4_3_4=y
>> # BR2_GCC_VERSION_4_4_X is not set
>> # BR2_GCC_VERSION_SNAP is not set
>> BR2_GCC_SUPPORTS_SYSROOT=y
>> BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
>> BR2_GCC_VERSION="4.3.4"
>> BR2_TOOLCHAIN_SYSROOT=y
>> # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
>> BR2_EXTRA_GCC_CONFIG_OPTIONS=""
>> # BR2_GCC_CROSS_FORTRAN is not set
>> # BR2_INSTALL_OBJC is not set
>> # BR2_INSTALL_FORTRAN is not set
>> BR2_GCC_SHARED_LIBGCC=y
>> BR2_GCC_ENABLE_TLS=y
>>
>> #
>> # Ccache Options
>> #
>> # BR2_CCACHE is not set
>>
>> #
>> # Gdb Options
>> #
>> # BR2_PACKAGE_GDB is not set
>> # BR2_PACKAGE_GDB_SERVER is not set
>> # BR2_PACKAGE_GDB_HOST is not set
>>
>> #
>> # Common Toolchain Options
>> #
>> BR2_LARGEFILE=y
>> # BR2_INET_IPV6 is not set
>> BR2_INET_RPC=y
>> BR2_ENABLE_LOCALE=y
>> # BR2_ENABLE_LOCALE_PURGE is not set
>> BR2_USE_WCHAR=y
>> BR2_PREFER_SOFT_FLOAT=y
>> BR2_SOFT_FLOAT=y
>> # BR2_USE_SSP is not set
>> # BR2_PTHREADS_NONE is not set
>> # BR2_PTHREADS is not set
>> BR2_PTHREADS_OLD=y
>> # BR2_PTHREADS_NATIVE is not set
>> # BR2_PROGRAM_INVOCATION is not set
>> # BR2_INSTALL_LIBSTDCPP is not set
>> BR2_TARGET_OPTIMIZATION="-Os -pipe"
>> # BR2_ELF2FLT is not set
>> # BR2_MKLIBS is not set
>> # BR2_PACKAGE_SSTRIP_TARGET is not set
>> # BR2_PACKAGE_SSTRIP_HOST is not set
>> # BR2_ENABLE_MULTILIB is not set
>> BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
>>
>> #
>> # Package Selection for the target
>> #
>> BR2_PACKAGE_BUSYBOX=y
>> # BR2_BUSYBOX_VERSION_1_12_X is not set
>> # BR2_BUSYBOX_VERSION_1_13_X is not set
>> # BR2_BUSYBOX_VERSION_1_14_X is not set
>> # BR2_BUSYBOX_VERSION_1_15_X is not set
>> BR2_BUSYBOX_VERSION_1_16_X=y
>> # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
>> BR2_BUSYBOX_VERSION="1.16.0"
>> BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
>> BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
>> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> BR2_PACKAGE_BUSYBOX_SKELETON=y
>>
>> #
>> # The minimum needed to build a uClibc development system
>> #
>> BR2_PACKAGE_BASH=y
>> # BR2_PACKAGE_BZIP2 is not set
>>
>> #
>> # coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support
>> #
>> # BR2_PACKAGE_DIFFUTILS is not set
>> # BR2_PACKAGE_FINDUTILS is not set
>> # BR2_PACKAGE_FLEX is not set
>> # BR2_PACKAGE_GAWK is not set
>>
>> #
>> # native toolchain needs development files in target filesystem
>> #
>> BR2_PACKAGE_GREP=y
>> # BR2_PACKAGE_MAKE is not set
>> # BR2_PACKAGE_PATCH is not set
>> # BR2_PACKAGE_SED is not set
>>
>> #
>> # tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support
>> #
>>
>> #
>> # Other development stuff
>> #
>> # BR2_PACKAGE_AUTOCONF is not set
>> # BR2_PACKAGE_AUTOMAKE is not set
>> BR2_PACKAGE_BISON=y
>> # BR2_PACKAGE_CCACHE_TARGET is not set
>> # BR2_PACKAGE_CVS is not set
>> # BR2_PACKAGE_DISTCC is not set
>> # BR2_PACKAGE_DMALLOC is not set
>> # BR2_PACKAGE_FAKEROOT is not set
>> BR2_HOST_FAKEROOT=y
>> BR2_PACKAGE_GETTEXT=y
>> # BR2_PACKAGE_GETTEXT_STATIC is not set
>> BR2_PACKAGE_LIBINTL=y
>> # BR2_PACKAGE_LIBGMP is not set
>>
>> #
>> # gperf requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_LIBMPFR is not set
>> # BR2_PACKAGE_LIBTOOL is not set
>> # BR2_PACKAGE_M4 is not set
>>
>> #
>> # oprofile requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_PKG_CONFIG is not set
>> # BR2_PACKAGE_READLINE is not set
>> # BR2_PACKAGE_PCRE is not set
>> # BR2_PACKAGE_INTLTOOL is not set
>>
>> #
>> # Other stuff
>> #
>> # BR2_PACKAGE_AT is not set
>> # BR2_PACKAGE_BEECRYPT is not set
>> # BR2_PACKAGE_BERKELEYDB is not set
>> # BR2_PACKAGE_BSDIFF is not set
>> BR2_PACKAGE_BOOTUTILS=y
>> # BR2_PACKAGE_CUPS is not set
>> BR2_PACKAGE_CUSTOMIZE=y
>> # BR2_PACKAGE_DASH is not set
>> BR2_PACKAGE_FILE=y
>> # BR2_PACKAGE_GAMIN is not set
>>
>> #
>> # icu requires a toolchain with C++ support and WCHAR enabled
>> #
>> # BR2_PACKAGE_KEXEC is not set
>> # BR2_PACKAGE_LESS is not set
>> # BR2_PACKAGE_LIBCONFIG is not set
>> BR2_PACKAGE_LIBCONFUSE=y
>> BR2_PACKAGE_LIBDAEMON=y
>> # BR2_PACKAGE_LIBELF is not set
>> BR2_PACKAGE_LIBEVENT=y
>> # BR2_PACKAGE_LIBGCRYPT is not set
>> # BR2_PACKAGE_LIBGPG_ERROR is not set
>> BR2_PACKAGE_LIBICONV=y
>> # BR2_PACKAGE_LIBIDN is not set
>> BR2_PACKAGE_LIBLOCKFILE=y
>> # BR2_PACKAGE_LIBOIL is not set
>> BR2_PACKAGE_LIBSYSFS=y
>> BR2_PACKAGE_LOCKFILE_PROGS=y
>> # BR2_PACKAGE_LOGROTATE is not set
>> # BR2_PACKAGE_LSOF is not set
>> # BR2_PACKAGE_LTP-TESTSUITE is not set
>> # BR2_PACKAGE_LTRACE is not set
>> BR2_PACKAGE_MEMSTAT=y
>> BR2_PACKAGE_MODULE_INIT_TOOLS=y
>> # BR2_PACKAGE_POPT is not set
>> BR2_PACKAGE_PROCPS=y
>> BR2_PACKAGE_PSMISC=y
>> # BR2_PACKAGE_SCREEN is not set
>> # BR2_PACKAGE_SHARED_MIME_INFO is not set
>> # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
>> BR2_PACKAGE_STRACE=y
>> # BR2_PACKAGE_SUDO is not set
>> BR2_PACKAGE_SYSKLOGD=y
>> BR2_PACKAGE_SYSVINIT=y
>> # BR2_PACKAGE_UTIL-LINUX is not set
>> # BR2_PACKAGE_WHICH is not set
>>
>> #
>> # Database
>> #
>>
>> #
>> # Mysql client requires a toolchain with C++ support enabled
>> #
>> BR2_PACKAGE_SQLITE=y
>> # BR2_PACKAGE_SQLITE_READLINE is not set
>>
>> #
>> # Text editors
>> #
>> # BR2_PACKAGE_ED is not set
>> BR2_PACKAGE_NANO=y
>> # BR2_PACKAGE_UEMACS is not set
>> # BR2_PACKAGE_VIM is not set
>>
>> #
>> # Networking
>> #
>>
>> #
>> # Networking applications
>> #
>> # BR2_PACKAGE_ARGUS is not set
>> # BR2_PACKAGE_AVAHI is not set
>> # BR2_PACKAGE_AXEL is not set
>> # BR2_PACKAGE_BOA is not set
>> # BR2_PACKAGE_BIND is not set
>> # BR2_PACKAGE_BMON is not set
>> # BR2_PACKAGE_BRIDGE is not set
>>
>> #
>> # ctorrent requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_ISC_DHCP is not set
>> # BR2_PACKAGE_DNSMASQ is not set
>> # BR2_PACKAGE_DROPBEAR is not set
>> # BR2_PACKAGE_ETHTOOL is not set
>> # BR2_PACKAGE_HASERL is not set
>> # BR2_PACKAGE_HOSTAPD is not set
>> # BR2_PACKAGE_IFPLUGD is not set
>>
>> #
>> # iperf requires a toolchain with C++ support enabled
>> #
>>
>> #
>> # iproute2 requires a toolchain with IPv6 support
>> #
>> # BR2_PACKAGE_IPSEC_TOOLS is not set
>> # BR2_PACKAGE_IPTABLES is not set
>> # BR2_PACKAGE_IW is not set
>>
>> #
>> # Kismet requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_L2TP is not set
>> # BR2_PACKAGE_LIBCGI is not set
>>
>> #
>> # libcgicc requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_LIBCURL is not set
>> # BR2_PACKAGE_LIBDNET is not set
>> # BR2_PACKAGE_LIBEXOSIP2 is not set
>> # BR2_PACKAGE_LIBMICROHTTPD is not set
>> # BR2_PACKAGE_LIBNL is not set
>> # BR2_PACKAGE_LIBOSIP2 is not set
>> BR2_PACKAGE_LIBPCAP=y
>> # BR2_PACKAGE_LIBSOUP is not set
>> # BR2_PACKAGE_LIBUPNP is not set
>> # BR2_PACKAGE_LIGHTTPD is not set
>> # BR2_PACKAGE_LINKS is not set
>> # BR2_PACKAGE_LRZSZ is not set
>> # BR2_PACKAGE_MIIDIAG is not set
>> # BR2_PACKAGE_MROUTED is not set
>> # BR2_PACKAGE_MUTT is not set
>> # BR2_PACKAGE_NBD is not set
>> # BR2_PACKAGE_NCFTP is not set
>> # BR2_PACKAGE_NEON is not set
>> # BR2_PACKAGE_NETCAT is not set
>> # BR2_PACKAGE_NETKITBASE is not set
>> # BR2_PACKAGE_NETKITTELNET is not set
>> # BR2_PACKAGE_NETPLUG is not set
>> # BR2_PACKAGE_NETSNMP is not set
>> # BR2_PACKAGE_NETSTAT_NAT is not set
>> # BR2_PACKAGE_NFS_UTILS is not set
>> # BR2_PACKAGE_NTP is not set
>> # BR2_PACKAGE_OLSR is not set
>> # BR2_PACKAGE_OPENNTPD is not set
>> # BR2_PACKAGE_OPENSSH is not set
>> # BR2_PACKAGE_OPENSSL is not set
>> # BR2_PACKAGE_OPENVPN is not set
>> # BR2_PACKAGE_PORTMAP is not set
>> BR2_PACKAGE_PPPD=y
>> BR2_PACKAGE_PPPD_FILTER=y
>> # BR2_PACKAGE_RP_PPPOE is not set
>> # BR2_PACKAGE_PPTP_LINUX is not set
>> # BR2_PACKAGE_PROFTPD is not set
>> # BR2_PACKAGE_QUAGGA is not set
>> # BR2_PACKAGE_RSYNC is not set
>> # BR2_PACKAGE_SAMBA is not set
>> # BR2_PACKAGE_SER2NET is not set
>> # BR2_PACKAGE_SOCAT is not set
>> # BR2_PACKAGE_SPAWN_FCGI is not set
>> # BR2_PACKAGE_STUNNEL is not set
>> # BR2_PACKAGE_TCPDUMP is not set
>> # BR2_PACKAGE_DHCPDUMP is not set
>> # BR2_PACKAGE_TCPREPLAY is not set
>> BR2_PACKAGE_TFTPD=y
>> # BR2_PACKAGE_THTTPD is not set
>> # BR2_PACKAGE_TINYHTTPD is not set
>> # BR2_PACKAGE_TN5250 is not set
>> # BR2_PACKAGE_TTCP is not set
>> # BR2_PACKAGE_UDPCAST is not set
>> # BR2_PACKAGE_VPNC is not set
>> # BR2_PACKAGE_VSFTPD is not set
>> # BR2_PACKAGE_VTUN is not set
>> # BR2_PACKAGE_WEBIF is not set
>> # BR2_PACKAGE_WGET is not set
>> # BR2_PACKAGE_WIRELESS_TOOLS is not set
>> # BR2_PACKAGE_WPA_SUPPLICANT is not set
>>
>> #
>> # Hardware handling / blockdevices and filesystem maintenance
>> #
>>
>> #
>> # dbus not available (need expat or libxml2)
>> #
>> BR2_PACKAGE_DEVMEM2=y
>> # BR2_PACKAGE_DMRAID is not set
>> # BR2_PACKAGE_DOSFSTOOLS is not set
>> # BR2_PACKAGE_E2FSPROGS is not set
>> # BR2_PACKAGE_EEPROG is not set
>> # BR2_PACKAGE_FCONFIG is not set
>> # BR2_PACKAGE_FIS is not set
>> BR2_PACKAGE_LIBFUSE=y
>> # BR2_PACKAGE_GADGETFS_TEST is not set
>> # BR2_PACKAGE_GVFS is not set
>> # BR2_PACKAGE_HAL is not set
>> # BR2_PACKAGE_HDPARM is not set
>> BR2_PACKAGE_HOTPLUG=y
>> # BR2_PACKAGE_HWDATA is not set
>> # BR2_PACKAGE_I2C_TOOLS is not set
>> BR2_PACKAGE_INPUT_TOOLS=y
>> BR2_PACKAGE_INPUT_TOOLS_EVTEST=y
>> BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH=y
>> BR2_PACKAGE_INPUT_TOOLS_JSCAL=y
>> BR2_PACKAGE_INPUT_TOOLS_JSTEST=y
>> # BR2_PACKAGE_IOSTAT is not set
>> # BR2_PACKAGE_LIBAIO is not set
>> # BR2_PACKAGE_LIBRAW1394 is not set
>> BR2_PACKAGE_LIBUSB=y
>> # BR2_PACKAGE_LM_SENSORS is not set
>> # BR2_PACKAGE_LVM2 is not set
>> # BR2_PACKAGE_MDADM is not set
>> # BR2_PACKAGE_MEMTESTER is not set
>> # BR2_PACKAGE_MTD is not set
>> # BR2_PACKAGE_NTFS_3G is not set
>> # BR2_PACKAGE_NTFSPROGS is not set
>> # BR2_PACKAGE_PCIUTILS is not set
>> BR2_PACKAGE_SETSERIAL=y
>> # BR2_PACKAGE_SFDISK is not set
>> # BR2_PACKAGE_SMARTMONTOOLS is not set
>> # BR2_PACKAGE_SYSSTAT is not set
>> BR2_PACKAGE_UDEV=y
>> BR2_PACKAGE_UDEV_UTILS=y
>>
>> #
>> # Extra udev tools
>> #
>> BR2_PACKAGE_UDEV_VOLUME_ID=y
>> BR2_PACKAGE_UDEV_SCSI_ID=y
>> # BR2_PACKAGE_UDEV_PATH_ID is not set
>> # BR2_PACKAGE_UDEV_FIRMWARE_SH is not set
>> # BR2_PACKAGE_USB_MODESWITCH is not set
>> BR2_PACKAGE_USBMOUNT=y
>> BR2_PACKAGE_USBUTILS=y
>> # BR2_PACKAGE_USBUTILS_ZLIB is not set
>> # BR2_PACKAGE_WIPE is not set
>> # BR2_PACKAGE_XFSPROGS is not set
>>
>> #
>> # Audio and video libraries and applications
>> #
>> # BR2_PACKAGE_ALSA_LIB is not set
>> # BR2_PACKAGE_AUMIX is not set
>> # BR2_PACKAGE_FLAC is not set
>> # BR2_PACKAGE_GSTREAMER is not set
>> # BR2_PACKAGE_LIBCDAUDIO is not set
>> # BR2_PACKAGE_LIBDVDREAD is not set
>> # BR2_PACKAGE_LIBDVDNAV is not set
>> # BR2_PACKAGE_LIBID3TAG is not set
>> # BR2_PACKAGE_LIBMAD is not set
>> # BR2_PACKAGE_LIBMMS is not set
>> # BR2_PACKAGE_LIBMPD is not set
>> # BR2_PACKAGE_LIBOGG is not set
>> # BR2_PACKAGE_LIBSNDFILE is not set
>> # BR2_PACKAGE_LIBTHEORA is not set
>> # BR2_PACKAGE_LIBVORBIS is not set
>> # BR2_PACKAGE_MADPLAY is not set
>> # BR2_PACKAGE_MPG123 is not set
>> # BR2_PACKAGE_MPLAYER is not set
>> # BR2_PACKAGE_SPEEX is not set
>> # BR2_PACKAGE_SWFDEC is not set
>>
>> #
>> # festival requires a toolchain with C++ support enabled
>> #
>>
>> #
>> # taglib requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_TREMOR is not set
>> # BR2_PACKAGE_VLC is not set
>>
>> #
>> # Graphic libraries and applications (graphic/text)
>> #
>>
>> #
>> # text rendering libraries
>> #
>> BR2_PACKAGE_NCURSES=y
>> # BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
>> # BR2_PACKAGE_NCURSES_TARGET_FORM is not set
>> # BR2_PACKAGE_NCURSES_TARGET_MENU is not set
>> # BR2_PACKAGE_NEWT is not set
>> # BR2_PACKAGE_SLANG is not set
>>
>> #
>> # text rendering applications
>> #
>> # BR2_PACKAGE_DIALOG is not set
>>
>> #
>> # graphic libraries
>> #
>> # BR2_PACKAGE_DIRECTFB is not set
>> # BR2_PACKAGE_FBDUMP is not set
>> # BR2_PACKAGE_IMAGEMAGICK is not set
>> # BR2_PACKAGE_JPEG is not set
>> # BR2_PACKAGE_LIBART is not set
>> # BR2_PACKAGE_LIBPNG is not set
>> # BR2_PACKAGE_LIBUNGIF is not set
>> # BR2_PACKAGE_LINUX_FUSION is not set
>> # BR2_PACKAGE_PIXMAN is not set
>> # BR2_PACKAGE_SDL is not set
>> # BR2_PACKAGE_TIFF is not set
>>
>> #
>> # busybox graphic applications
>> #
>>
>> #
>> # --> May be broken in busybox
>> #
>> # BR2_PACKAGE_FBV is not set
>> # BR2_PACKAGE_FBSET is not set
>>
>> #
>> # other GUIs
>> #
>>
>> #
>> # qt requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_XORG7 is not set
>>
>> #
>> # X libraries and helper libraries
>> #
>> # BR2_PACKAGE_ATK is not set
>> # BR2_PACKAGE_CAIRO is not set
>> # BR2_PACKAGE_PANGO is not set
>> # BR2_PACKAGE_LIBDRM is not set
>> # BR2_PACKAGE_LIBERATION is not set
>> # BR2_PACKAGE_LIBGLIB12 is not set
>> # BR2_PACKAGE_LIBGLIB2 is not set
>> # BR2_PACKAGE_FONTCONFIG is not set
>> # BR2_PACKAGE_FREETYPE is not set
>> # BR2_PACKAGE_TSLIB is not set
>>
>> #
>> # webkit requires a toolchain with C++ support and WCHAR enabled
>> #
>>
>> #
>> # X Window managers
>> #
>>
>> #
>> # X applications
>> #
>> # BR2_PACKAGE_GOB2 is not set
>> # BR2_PACKAGE_SYLPHEED is not set
>>
>> #
>> # Compressors / decompressors
>> #
>> # BR2_PACKAGE_GZIP is not set
>> # BR2_PACKAGE_LIBARCHIVE is not set
>> BR2_PACKAGE_LZO=y
>> # BR2_PACKAGE_LZOP is not set
>>
>> #
>> # lzma requires a toolchain with C++ support
>> #
>> BR2_PACKAGE_ZLIB=y
>>
>> #
>> # Package managers
>> #
>> # BR2_PACKAGE_IPKG is not set
>> # BR2_PACKAGE_PORTAGE is not set
>>
>> #
>> # rpm requires libneon with SSL, XML and ZLIB support
>> #
>>
>> #
>> # xz payload support requires a toolchain with c++ support
>> #
>>
>> #
>> # Interpreter languages / Scripting
>> #
>> # BR2_PACKAGE_LUA is not set
>> # BR2_PACKAGE_MICROPERL is not set
>> # BR2_PACKAGE_PYTHON is not set
>> # BR2_PACKAGE_RUBY is not set
>> # BR2_PACKAGE_TCL is not set
>> # BR2_PACKAGE_PHP is not set
>>
>> #
>> # XML handling
>> #
>> # BR2_PACKAGE_EXPAT is not set
>> # BR2_PACKAGE_EZXML is not set
>> # BR2_PACKAGE_LIBXML2 is not set
>> # BR2_PACKAGE_LIBXSLT is not set
>>
>> #
>> # xerces-c++ requires a toolchain with C++ support enabled
>> #
>> # BR2_PACKAGE_LIBXML_PARSER_PERL is not set
>>
>> #
>> # Java
>> #
>> # BR2_PACKAGE_CLASSPATH is not set
>>
>> #
>> # Games
>> #
>> BR2_PACKAGE_GNUCHESS=y
>> # BR2_PACKAGE_PRBOOM is not set
>>
>> #
>> # Target filesystem options
>> #
>> BR2_ROOTFS_PREFIX="rootfs"
>> BR2_ROOTFS_SUFFIX=""
>> BR2_ROOTFS_POST_BUILD_SCRIPT=""
>>
>> #
>> # filesystem for target device
>> #
>> # BR2_TARGET_ROOTFS_CRAMFS is not set
>> # BR2_TARGET_ROOTFS_CLOOP is not set
>> # BR2_TARGET_ROOTFS_EXT2 is not set
>> BR2_TARGET_ROOTFS_JFFS2=y
>> # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
>> # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
>> # BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K is not set
>> BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
>> # BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
>> # BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
>> # BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
>> BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
>> BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
>> BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
>> # BR2_JFFS2_TARGET_SREC is not set
>> BR2_TARGET_ROOTFS_JFFS2_PAD=y
>> BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x0
>> BR2_TARGET_ROOTFS_JFFS2_LE=y
>> # BR2_TARGET_ROOTFS_JFFS2_BE is not set
>> BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
>> BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
>> BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
>> # BR2_TARGET_ROOTFS_SQUASHFS is not set
>> # BR2_TARGET_ROOTFS_TAR is not set
>> # BR2_TARGET_ROOTFS_CPIO is not set
>> # BR2_TARGET_ROOTFS_INITRAMFS is not set
>> # BR2_TARGET_ROOTFS_ROMFS is not set
>>
>> #
>> # bootloader for target device
>> #
>> # BR2_TARGET_UBOOT is not set
>>
>> #
>> # Kernel
>> #
>> BR2_KERNEL_none=y
>> # BR2_KERNEL_LINUX_ADVANCED is not set
>> # BR2_KERNEL_LINUX is not set
>>
>> warm regards,
>> Ravi Kulkarni.
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
