From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 25 Jul 2007 19:01:57 +0200
Subject: [Buildroot] No shared libraries for gettext!
Message-ID: <1185382917.8043.85.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Still have problems with no shared gettext libraries.

When I am building gettext, I get the following: 
	(result of "libtool --config" attached)

checking whether
the /home/ulf/projects/Buildroot/20070720/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os -pipe  -I/home/ulf/projects/Buildroot/20070720/buildroot/build_i386/staging_dir/usr/include -I/home/ulf/projects/Buildroot/20070720/buildroot/build_i386/staging_dir/include -mtune=i386 -march=i386 linker (/home/ulf/projects/Buildroot/20070720/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc) supports shared libraries... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... unsupported
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes
configure: creating libtool



My .config contains: (Full file attached)

# BR2_PREFER_STATIC_LIB is not set
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y

Any clues?
Why does the compiler not support linked libraries???

Best Regards
Ulf Samuelsson


-------------- next part --------------
#
# Automatically generated make config: don't edit
# Wed Jul 25 13:49:08 2007
#
BR2_HAVE_DOT_CONFIG=y

#
# Project Options
#
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to the Erik's uClibc development environment."
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
# BR2_s390 is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
BR2_x86_i386=y
# BR2_x86_i486 is not set
# BR2_x86_i586 is not set
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
BR2_ARCH="i386"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i386"
BR2_GCC_TARGET_ARCH="i386"

#
# Build options
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN="svn co"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="/usr/local/install/downloads"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
BR2_PREFER_IMA=y
BR2_DEPRECATED=y
BR2_USE_WCHAR=y
# BR2_PREFER_STATIC_LIB is not set
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Toolchain Options
#

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_4_25 is not set
# BR2_KERNEL_HEADERS_2_4_27 is not set
# BR2_KERNEL_HEADERS_2_4_29 is not set
# BR2_KERNEL_HEADERS_2_4_31 is not set
# BR2_KERNEL_HEADERS_2_6_9 is not set
# BR2_KERNEL_HEADERS_2_6_11 is not set
# BR2_KERNEL_HEADERS_2_6_12 is not set
# BR2_KERNEL_HEADERS_2_6_19_2 is not set
# BR2_KERNEL_HEADERS_2_6_20 is not set
BR2_KERNEL_HEADERS_2_6_21=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.21.5"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28 is not set
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
BR2_UCLIBC_VERSION_0_9_29=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
BR2_ENABLE_LOCALE=y
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
BR2_PTHREAD_DEBUG=y

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
# BR2_BINUTILS_VERSION_2_15 is not set
# BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
# BR2_BINUTILS_VERSION_2_16_1 is not set
# BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_5 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_6 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_7 is not set
BR2_BINUTILS_VERSION_2_17=y
# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
BR2_BINUTILS_VERSION="2.17"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
# BR2_GCC_VERSION_3_4_2 is not set
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_3_4_5 is not set
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_1_2 is not set
BR2_GCC_VERSION_4_2_0=y
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="4.2.0"
# BR2_TOOLCHAIN_SYSROOT is not set
BR2_GCC_USE_SJLJ_EXCEPTIONS=y
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
# BR2_INSTALL_LIBGCJ is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y

#
# Ccache Options
#
BR2_CCACHE=y

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
BR2_PACKAGE_GDB_HOST=y
# BR2_GDB_VERSION_6_2_1 is not set
# BR2_GDB_VERSION_6_3 is not set
# BR2_GDB_VERSION_6_4 is not set
# BR2_GDB_VERSION_6_5 is not set
BR2_GDB_VERSION_6_6=y
# BR2_GDB_VERSION_SNAPSHOT is not set
BR2_GDB_VERSION="6.6"

#
# elf2flt
#
# BR2_ELF2FLT is not set
BR2_MKLIBS=y

#
# Common Toolchain Options
#
BR2_PACKAGE_SSTRIP_TARGET=y
BR2_PACKAGE_SSTRIP_HOST=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#

#
# The default minimal system
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_0_1 is not set
# BR2_BUSYBOX_VERSION_1_1_3 is not set
# BR2_BUSYBOX_VERSION_1_2_2_1 is not set
# BR2_BUSYBOX_VERSION_1_4_0 is not set
# BR2_BUSYBOX_VERSION_1_4_1 is not set
# BR2_BUSYBOX_VERSION_1_4_2 is not set
# BR2_BUSYBOX_VERSION_1_5_0 is not set
# BR2_BUSYBOX_VERSION_1_5_1 is not set
# BR2_BUSYBOX_VERSION_1_6_0 is not set
BR2_BUSYBOX_VERSION_1_6_1=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.6.1"
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
# BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
BR2_PACKAGE_BZIP2=y
# BR2_PACKAGE_COREUTILS is not set
BR2_PACKAGE_DIFFUTILS=y
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_FINDUTILS is not set
BR2_PACKAGE_FLEX=y
BR2_PACKAGE_FLEX_LIBFL=y
# BR2_PACKAGE_GAWK is not set
# BR2_PACKAGE_GCC_TARGET is not set
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
# BR2_PACKAGE_GREP is not set
BR2_PACKAGE_MAKE=y
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_SED is not set
# BR2_PACKAGE_TAR is not set

#
# Other development stuff
#
BR2_PACKAGE_AUTOCONF=y
BR2_PACKAGE_AUTOMAKE=y
BR2_PACKAGE_BISON=y
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_CVS is not set
BR2_PACKAGE_DISTCC=y
# BR2_PACKAGE_DMALLOC is not set
BR2_PACKAGE_EXPAT=y
BR2_PACKAGE_FAKEROOT=y
BR2_HOST_FAKEROOT=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_LIBGMP=y
BR2_PACKAGE_LIBGMP_HEADERS=y
BR2_PACKAGE_LIBMPFR=y
BR2_PACKAGE_LIBMPFR_HEADERS=y
BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_M4=y
# BR2_PACKAGE_MPATROL is not set
BR2_PACKAGE_PKGCONFIG=y
BR2_READLINE=y
BR2_PACKAGE_READLINE_TARGET=y
BR2_PACKAGE_VALGRIND=y
BR2_PACKAGE_XERCES=y

#
# Other stuff
#
BR2_PACKAGE_AT=y
BR2_PACKAGE_BERKELEYDB=y
# BR2_PACKAGE_BSDIFF is not set
BR2_PACKAGE_CUSTOMIZE=y
BR2_PACKAGE_DASH=y
BR2_PACKAGE_FILE=y
BR2_PACKAGE_KEXEC=y
BR2_PACKAGE_KEXEC_ZLIB=y
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_LIBDAEMON is not set
BR2_PACKAGE_LIBELF=y
BR2_PACKAGE_LIBELF_HEADERS=y
BR2_PACKAGE_LIBEVENT=y
BR2_PACKAGE_LIBFLOAT=y
# BR2_PACKAGE_LIBGCRYPT is not set
BR2_PACKAGE_LIBGPG_ERROR=y
BR2_PACKAGE_LIBLOCKFILE=y
BR2_PACKAGE_LIBSYSFS=y
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXML2_TARGET_HEADERS is not set
BR2_PACKAGE_LOCKFILE_PROGS=y
BR2_PACKAGE_LSOF=y
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_LTT is not set
BR2_PACKAGE_MICROCOM=y
BR2_PACKAGE_MODULE_INIT_TOOLS=y
BR2_PACKAGE_NANO=y
BR2_PACKAGE_PORTAGE=y
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_TINYLOGIN is not set
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_UTIL-LINUX is not set
# BR2_PACKAGE_WHICH is not set
BR2_NETWORK_SUPPORT=y
BR2_PACKAGE_ARGUS=y
BR2_PACKAGE_BOA=y
BR2_PACKAGE_BIND=y
BR2_PACKAGE_BRIDGE=y
# BR2_PACKAGE_CURL is not set
# BR2_PACKAGE_LIBCURL is not set
BR2_PACKAGE_ISC_DHCP=y
# BR2_PACKAGE_DHCP_SERVER is not set
# BR2_PACKAGE_DHCP_RELAY is not set
# BR2_PACKAGE_DHCP_CLIENT is not set
# BR2_PACKAGE_DNSMASQ is not set
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_URANDOM=y
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_HASERL=y
# BR2_PACKAGE_HOSTAP is not set
# BR2_PACKAGE_IPERF is not set
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_IPSEC_TOOLS=y
BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT=y
BR2_PACKAGE_IPSEC_TOOLS_NATT=y
BR2_PACKAGE_IPSEC_TOOLS_FRAG=y
BR2_PACKAGE_IPSEC_TOOLS_STATS=y
BR2_PACKAGE_IPSEC_TOOLS_IPV6=y
BR2_PACKAGE_IPSEC_TOOLS_READLINE=y
BR2_PACKAGE_IPSEC_TOOLS_LIBS=y
BR2_PACKAGE_IPTABLES=y
# BR2_PACKAGE_L2TP is not set
BR2_PACKAGE_LIBCGI=y
# BR2_PACKAGE_LIBCGICC is not set
BR2_PACKAGE_LIBPCAP=y
BR2_PACKAGE_LINKS=y
BR2_PACKAGE_LRZSZ=y
# BR2_PACKAGE_MROUTED is not set
BR2_PACKAGE_NBD=y
BR2_PACKAGE_NCFTP=y
BR2_PACKAGE_NCFTP_UTILS=y
# BR2_PACKAGE_NETCAT is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
BR2_PACKAGE_NETSNMP=y
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
BR2_PACKAGE_OPENNTPD=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_TARGET_HEADERS=y
BR2_PACKAGE_OPENVPN=y
BR2_PACKAGE_OPENSWAN=y
BR2_PACKAGE_OPENSWAN_DEBUGGING=y
BR2_PACKAGE_PORTMAP=y
BR2_PACKAGE_PPPD=y
BR2_PACKAGE_PROFTPD=y
# BR2_PACKAGE_QUAGGA is not set

#
# quagga suite
#
# BR2_PACKAGE_QUAGGA_ZEBRA is not set
# BR2_PACKAGE_QUAGGA_BGPD is not set
# BR2_PACKAGE_QUAGGA_RIPD is not set
# BR2_PACKAGE_QUAGGA_RIPNGD is not set
# BR2_PACKAGE_QUAGGA_OSPFD is not set
# BR2_PACKAGE_QUAGGA_OSPF6D is not set
# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
# BR2_PACKAGE_QUAGGA_ISISD is not set
BR2_PACKAGE_RSYNC=y
BR2_PACKAGE_SAMBA=y

#
# Samba tools selection
#
BR2_PACKAGE_SAMBA_CIFS=y
BR2_PACKAGE_SAMBA_EVENTLOGADM=y
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
BR2_PACKAGE_SAMBA_SMBPASSWD=y
BR2_PACKAGE_SAMBA_SMBSPOOL=y
BR2_PACKAGE_SAMBA_SMBSTATUS=y
BR2_PACKAGE_SAMBA_SMBTREE=y
BR2_PACKAGE_SAMBA_SWAT=y
BR2_PACKAGE_SAMBA_TDB=y
BR2_PACKAGE_SAMBA_TESTPARM=y
BR2_PACKAGE_SAMBA_WINBINDD=y
BR2_PACKAGE_SAMBA_WBINFO=y
BR2_PACKAGE_SOCAT=y
BR2_PACKAGE_STUNNEL=y
BR2_PACKAGE_TCPDUMP=y
BR2_PACKAGE_DHCPDUMP=y
BR2_PACKAGE_TFTPD=y
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
BR2_PACKAGE_TN5250=y
BR2_PACKAGE_TTCP=y
# BR2_PACKAGE_VPNC is not set
BR2_PACKAGE_VTUN=y
# BR2_PACKAGE_WGET is not set
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_BLOCKDEV_SUPPORT=y
BR2_PACKAGE_ACPID=y
# BR2_PACKAGE_DBUS is not set
BR2_PACKAGE_DM=y
# BR2_PACKAGE_DMRAID is not set
BR2_PACKAGE_E2FSPROGS=y
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HOTPLUG is not set
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_IOSTAT=y
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LVM2 is not set
BR2_PACKAGE_MDADM=y
BR2_PACKAGE_MEMTESTER=y
BR2_PACKAGE_MKDOSFS=y
BR2_PACKAGE_MTD=y

#
# MTD package selection
#
BR2_PACKAGE_MTD_ORIG=y
# BR2_PACKAGE_MTD_SNAPSHOT is not set
BR2_PACKAGE_MTD_ORIG_STRING="mtd_20050122.orig.tar.gz"

#
# MTD tools selection
#
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_ERASE=y
BR2_PACKAGE_MTD_JFFS2DUMP=y
BR2_PACKAGE_MTD_JFFS3DUMP=y
BR2_PACKAGE_MTD_SUMTOOL=y
BR2_PACKAGE_MTD_FTL_CHECK=y
BR2_PACKAGE_MTD_FTL_FORMAT=y
BR2_PACKAGE_MTD_NFTL_FORMAT=y
BR2_PACKAGE_MTD_NFTLDUMP=y
BR2_PACKAGE_MTD_MKFSJFFS2=y
BR2_PACKAGE_MTD_MKFSJFFS=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDWRITE=y
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_DOCFDISK=y
BR2_PACKAGE_MTD_DOC_LOADBIOS=y
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_PCMCIA is not set
BR2_PACKAGE_RAIDTOOLS=y
BR2_PACKAGE_SETSERIAL=y
# BR2_PACKAGE_SFDISK is not set
BR2_PACKAGE_SMARTMONTOOLS=y
# BR2_PACKAGE_UDEV is not set
BR2_PACKAGE_UDEV_VOLUME_ID=y
BR2_PACKAGE_UDEV_SCSI_ID=y
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
BR2_PACKAGE_WIPE=y
BR2_PACKAGE_XFSPROGS=y
BR2_AUDIO_SUPPORT=y
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_ASTERISK is not set
BR2_PACKAGE_AUMIX=y
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
BR2_PACKAGE_LIBSNDFILE=y
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
BR2_VIDEO_SUPPORT=y
# BR2_PACKAGE_MPLAYER is not set
BR2_GRAPHIC_SUPPORT=y

#
# text rendering libraries
#
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_HEADERS=y
BR2_PACKAGE_NEWT=y
BR2_PACKAGE_SLANG=y

#
# text rendering applications
#
BR2_PACKAGE_DIALOG=y

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
BR2_PACKAGE_IMAGEMAGICK=y
BR2_PACKAGE_JPEG=y
BR2_PACKAGE_LIBPNG=y
# BR2_PACKAGE_LIBUNGIF is not set
BR2_PACKAGE_SDL=y
BR2_PACKAGE_TIFF=y

#
# busybox graphic applications
#

#
# --> (May be broken in busybox)
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FBSET is not set

#
# other GUIs
#
# BR2_PACKAGE_QTE is not set
# BR2_PACKAGE_QTOPIA4 is not set

#
# X Window System server
#
# BR2_PACKAGE_XORG is not set
# BR2_PACKAGE_TINYX is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBGTK12 is not set
# BR2_PACKAGE_LIBGTK2 is not set
# BR2_PACKAGE_FONTCONFIG is not set
BR2_PACKAGE_FREETYPE=y

#
# X Window managers
#
# BR2_PACKAGE_METACITY is not set

#
# X applications
#
# BR2_PACKAGE_DILLO is not set
# BR2_PACKAGE_RDESKTOP is not set
# BR2_PACKAGE_RXVT is not set
BR2_COMPRESSOR_SUPPORT=y
# BR2_PACKAGE_GZIP is not set
BR2_PACKAGE_LZO=y
# BR2_PACKAGE_LZMA_TARGET is not set
# BR2_PACKAGE_LZMA_HOST is not set
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_ZLIB_TARGET_HEADERS=y
BR2_SCRIPTING_SUPPORT=y
BR2_PACKAGE_MICROPERL=y
BR2_PACKAGE_MICROPERL_MODULES=""
BR2_PACKAGE_PYTHON=y
# BR2_PACKAGE_RUBY is not set
BR2_PACKAGE_TCL=y
BR2_PACKAGE_TCL_DEL_ENCODINGS=y
BR2_PACKAGE_TCL_SHLIB_ONLY=y

#
# Target Options
#

#
# filesystem for target device
#
BR2_TARGET_ROOTFS_CRAMFS=y
BR2_TARGET_ROOTFS_CLOOP=y
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
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_FLASH=y
# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH is not set
BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
BR2_JFFS2_TARGET_SREC=y
BR2_TARGET_ROOTFS_JFFS2_PAD=y
BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x0
BR2_TARGET_ROOTFS_JFFS2_LE=y
# BR2_TARGET_ROOTFS_JFFS2_BE is not set
BR2_TARGET_ROOTFS_JFFS2_SQUASH=y
BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
BR2_TARGET_ROOTFS_SQUASHFS=y
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_ISO9660=y
BR2_TARGET_ROOTFS_ISO9660_OUTPUT="$(IMAGE).iso"
BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="target/iso9660/menu.lst"
BR2_TARGET_ROOTFS_INITRAMFS=y

#
# bootloader for target device
#
BR2_TARGET_GRUB=y
BR2_TARGET_GRUB_SPLASH=y
BR2_TARGET_GRUB_DISKLESS=y
BR2_TARGET_GRUB_3c595=y
BR2_TARGET_GRUB_3c90x=y
BR2_TARGET_GRUB_davicom=y
BR2_TARGET_GRUB_e1000=y
BR2_TARGET_GRUB_eepro100=y
BR2_TARGET_GRUB_epic100=y
BR2_TARGET_GRUB_forcedeth=y
BR2_TARGET_GRUB_natsemi=y
BR2_TARGET_GRUB_ns83820=y
BR2_TARGET_GRUB_ns8390=y
BR2_TARGET_GRUB_pcnet32=y
BR2_TARGET_GRUB_pnic=y
BR2_TARGET_GRUB_rtl8139=y
BR2_TARGET_GRUB_r8169=y
BR2_TARGET_GRUB_sis900=y
BR2_TARGET_GRUB_tg3=y
BR2_TARGET_GRUB_tulip=y
BR2_TARGET_GRUB_tlan=y
BR2_TARGET_GRUB_undi=y
BR2_TARGET_GRUB_via_rhine=y
BR2_TARGET_GRUB_w89c840=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_PXELINUX=y

#
# Linux Options
#
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG=y
BR2_PACKAGE_LINUX_KCONFIG=""
BR2_PACKAGE_LINUX_FORMAT="bzImage"
# BR2_LINUX_2_6_SNAP is not set
# BR2_LINUX_2_6_MM is not set
# BR2_LINUX_2_6_STABLE is not set
# BR2_LINUX_2_6_22_1 is not set
# BR2_LINUX_2_6_22 is not set
# BR2_LINUX_2_6_21_6 is not set
BR2_LINUX_2_6_21_5=y
# BR2_LINUX_2_6_21_1 is not set
# BR2_LINUX_2_6_21 is not set
# BR2_LINUX_2_6_20_4 is not set
# BR2_LINUX_2_6_20 is not set
# BR2_LINUX_2_6_19_2 is not set
# BR2_LINUX_2_6_19 is not set
# BR2_LINUX_2_6_18 is not set
# BR2_LINUX_2_6_17 is not set
# BR2_LINUX_2_6_16 is not set
# BR2_LINUX_2_6_15 is not set
# BR2_LINUX_2_6_23 is not set
# BR2_LINUX_CUSTOM is not set

#
# Patches
#
BR2_LINUX_BSP_PATCH=""
BR2_DOWNLOAD_LINUX26_VERSION="2.6.21.5"
BR2_LINUX26_VERSION="2.6.21.5"
BR2_LINUX26_RC_PATCH=""
BR2_PACKAGE_LINUX_USE_KCONFIG=y
# BR2_LINUX26_DEFCONFIG is not set
# BR2_LINUX_CUSTOMIZE is not set
BR2_LINUX_BIN_BZIMAGE=y
# BR2_LINUX_BIN_UIMAGE is not set
# BR2_LINUX_BIN_VMLINUX is not set
# BR2_LINUX_BIN_ZIMAGE is not set
# BR2_LINUX_BIN_CUSTOM is not set

#
# Destinations for linux kernel binaries
#
# BR2_LINUX_IN_ROOTFS is not set
BR2_LINUX_COPY=y
BR2_LINUX_COPYTO="/tftpboot"

#
# Board Support Options
#
# BR2_TARGET_SOEKRIS_NET4521 is not set
# BR2_TARGET_SOEKRIS_NET4801 is not set
# BR2_TARGET_VIA_EPIA_MII is not set

#
# Generic x86 Device Support
#

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set
-------------- next part --------------

# Libtool was configured on host kapillar:

# Shell to use when invoking shell scripts.
SHELL="/bin/sh"

# Whether or not to build shared libraries.
build_libtool_libs=yes

# Whether or not to build static libraries.
build_old_libs=yes

# Whether or not to add -lc for building shared libraries.
build_libtool_need_lc=no

# Whether or not to disallow shared libs when runtime libs are static
allow_libtool_libs_with_static_runtimes=no

# Whether or not to optimize for fast installation.
fast_install=yes

# The host system.
host_alias=
host=i686-suse-linux-gnu
host_os=linux-gnu

# The build system.
build_alias=
build=i686-suse-linux-gnu
build_os=linux-gnu

# An echo program that does not interpret backslashes.
echo="echo"

# The archiver.
AR="ar"
AR_FLAGS="cru"

# A C compiler.
LTCC="gcc"

# LTCC compiler flags.
LTCFLAGS="-O2 -march=i586 -mtune=i686 -fmessage-length=0 -Wall -D_FORTIFY_SOURCE=2 -g"

# A language-specific compiler.
CC="gcc"

# Is the compiler the GNU C compiler?
with_gcc=yes

# An ERE matcher.
EGREP="/usr/bin/grep -E"

# The linker used to build libraries.
LD="/usr/i586-suse-linux/bin/ld"

# Whether we need hard or soft links.
LN_S="ln -s"

# A BSD-compatible nm program.
NM="/usr/bin/nm -B"

# A symbol stripping program
STRIP="strip"

# Used to examine libraries when file_magic_cmd begins "file"
MAGIC_CMD=file

# Used on cygwin: DLL creation program.
DLLTOOL="dlltool"

# Used on cygwin: object dumper.
OBJDUMP="objdump"

# Used on cygwin: assembler.
AS="as"

# The name of the directory that contains temporary libtool files.
objdir=.libs

# How to create reloadable object files.
reload_flag=" -r"
reload_cmds="\$LD\$reload_flag -o \$output\$reload_objs"

# How to pass a linker flag through the compiler.
wl="-Wl,"

# Object file suffix (normally "o").
objext="o"

# Old archive suffix (normally "a").
libext="a"

# Shared library suffix (normally ".so").
shrext_cmds='.so'

# Executable file suffix (normally "").
exeext=""

# Additional compiler flags for building library objects.
pic_flag=" -fPIC -DPIC"
pic_mode=default

# What is the maximum length of a command?
max_cmd_len=32768

# Does compiler simultaneously support -c and -o options?
compiler_c_o="yes"

# Must we lock files when doing compilation?
need_locks="no"

# Do we need the lib prefix for modules?
need_lib_prefix=no

# Do we need a version for libraries?
need_version=no

# Whether dlopen is supported.
dlopen_support=yes

# Whether dlopen of programs is supported.
dlopen_self=yes

# Whether dlopen of statically linked programs is supported.
dlopen_self_static=no

# Compiler flag to prevent dynamic linking.
link_static_flag="-static"

# Compiler flag to turn off builtin functions.
no_builtin_flag=" -fno-builtin"

# Compiler flag to allow reflexive dlopens.
export_dynamic_flag_spec="\${wl}--export-dynamic"

# Compiler flag to generate shared objects directly from archives.
whole_archive_flag_spec="\${wl}--whole-archive\$convenience \${wl}--no-whole-archive"

# Compiler flag to generate thread-safe objects.
thread_safe_flag_spec=""

# Library versioning type.
version_type=linux

# Format of library name prefix.
libname_spec="lib\$name"

# List of archive names.  First name is the real one, the rest are links.
# The last name is the one that the linker finds with -lNAME.
library_names_spec="\${libname}\${release}\${shared_ext}\$versuffix \${libname}\${release}\${shared_ext}\$major \$libname\${shared_ext}"

# The coded name of the library, if different from the real name.
soname_spec="\${libname}\${release}\${shared_ext}\$major"

# Commands used to build and install an old-style archive.
RANLIB="ranlib"
old_archive_cmds="\$AR \$AR_FLAGS \$oldlib\$oldobjs\$old_deplibs~\$RANLIB \$oldlib"
old_postinstall_cmds="chmod 644 \$oldlib~\$RANLIB \$oldlib"
old_postuninstall_cmds=""

# Create an old-style archive from a shared archive.
old_archive_from_new_cmds=""

# Create a temporary old-style archive to link instead of a shared archive.
old_archive_from_expsyms_cmds=""

# Commands used to build and install a shared archive.
archive_cmds="\$CC -shared \$libobjs \$deplibs \$compiler_flags \${wl}-soname \$wl\$soname -o \$lib"
archive_expsym_cmds="\$echo \\\"{ global:\\\" > \$output_objdir/\$libname.ver~
  cat \$export_symbols | sed -e \\\"s/\\\\(.*\\\\)/\\\\1;/\\\" >> \$output_objdir/\$libname.ver~
  \$echo \\\"local: *; };\\\" >> \$output_objdir/\$libname.ver~
	  \$CC -shared \$libobjs \$deplibs \$compiler_flags \${wl}-soname \$wl\$soname \${wl}-version-script \${wl}\$output_objdir/\$libname.ver -o \$lib"
postinstall_cmds=""
postuninstall_cmds=""

# Commands used to build a loadable module (assumed same as above if empty)
module_cmds=""
module_expsym_cmds=""

# Commands to strip libraries.
old_striplib="strip --strip-debug"
striplib="strip --strip-unneeded"

# Dependencies to place before the objects being linked to create a
# shared library.
predep_objects=""

# Dependencies to place after the objects being linked to create a
# shared library.
postdep_objects=""

# Dependencies to place before the objects being linked to create a
# shared library.
predeps=""

# Dependencies to place after the objects being linked to create a
# shared library.
postdeps=""

# The library search path used internally by the compiler when linking
# a shared library.
compiler_lib_search_path=""

# Method to check whether dependent libraries are shared objects.
deplibs_check_method="pass_all"

# Command to use when deplibs_check_method == file_magic.
file_magic_cmd="\$MAGIC_CMD"

# Flag that allows shared libraries with undefined symbols to be built.
allow_undefined_flag=""

# Flag that forces no undefined symbols.
no_undefined_flag=""

# Commands used to finish a libtool library installation in a directory.
finish_cmds="PATH=\\\"\\\$PATH:/sbin\\\" ldconfig -n \$libdir"

# Same as above, but a single script fragment to be evaled but not shown.
finish_eval=""

# Take the output of nm and produce a listing of raw symbols and C names.
global_symbol_pipe="sed -n -e 's/^.*[ 	]\\([ABCDGIRSTW][ABCDGIRSTW]*\\)[ 	][ 	]*\\([_A-Za-z][_A-Za-z0-9]*\\)\$/\\1 \\2 \\2/p'"

# Transform the output of nm in a proper C declaration
global_symbol_to_cdecl="sed -n -e 's/^. .* \\(.*\\)\$/extern int \\1;/p'"

# Transform the output of nm in a C name address pair
global_symbol_to_c_name_address="sed -n -e 's/^: \\([^ ]*\\) \$/  {\\\"\\1\\\", (lt_ptr) 0},/p' -e 's/^[BCDEGRST] \\([^ ]*\\) \\([^ ]*\\)\$/  {\"\\2\", (lt_ptr) \\&\\2},/p'"

# This is the shared library runtime path variable.
runpath_var=LD_RUN_PATH

# This is the shared library path variable.
shlibpath_var=LD_LIBRARY_PATH

# Is shlibpath searched before the hard-coded library search path?
shlibpath_overrides_runpath=no

# How to hardcode a shared library path into an executable.
hardcode_action=immediate

# Whether we should hardcode library paths into libraries.
hardcode_into_libs=yes

# Flag to hardcode $libdir into a binary during linking.
# This must work even if $libdir does not exist.
hardcode_libdir_flag_spec="\${wl}--rpath \${wl}\$libdir"

# If ld is used when linking, flag to hardcode $libdir into
# a binary during linking. This must work even if $libdir does
# not exist.
hardcode_libdir_flag_spec_ld=""

# Whether we need a single -rpath flag with a separated argument.
hardcode_libdir_separator=""

# Set to yes if using DIR/libNAME during linking hardcodes DIR into the
# resulting binary.
hardcode_direct=no

# Set to yes if using the -LDIR flag during linking hardcodes DIR into the
# resulting binary.
hardcode_minus_L=no

# Set to yes if using SHLIBPATH_VAR=DIR during linking hardcodes DIR into
# the resulting binary.
hardcode_shlibpath_var=unsupported

# Set to yes if building a shared library automatically hardcodes DIR into the library
# and all subsequent libraries and executables linked against it.
hardcode_automatic=no

# Variables whose values should be saved in libtool wrapper scripts and
# restored at relink time.
variables_saved_for_relink="PATH LD_LIBRARY_PATH LD_RUN_PATH GCC_EXEC_PREFIX COMPILER_PATH LIBRARY_PATH"

# Whether libtool must link a program against all its dependency libraries.
link_all_deplibs=unknown

# Compile-time system search path for libraries
sys_lib_search_path_spec=" /usr/lib/gcc/i586-suse-linux/4.1.2/ /usr/lib/gcc/i586-suse-linux/4.1.2/ /usr/lib/gcc/i586-suse-linux/4.1.2/../../../../i586-suse-linux/lib/i586-suse-linux/4.1.2/ /usr/lib/gcc/i586-suse-linux/4.1.2/../../../../i586-suse-linux/lib/ /usr/lib/gcc/i586-suse-linux/4.1.2/../../../i586-suse-linux/4.1.2/ /usr/lib/gcc/i586-suse-linux/4.1.2/../../../ /lib/i586-suse-linux/4.1.2/ /lib/ /usr/lib/i586-suse-linux/4.1.2/ /usr/lib/"

# Run-time system search path for libraries
sys_lib_dlsearch_path_spec="/lib /usr/lib /usr/X11R6/lib/Xaw3d /usr/X11R6/lib /usr/lib/Xaw3d /usr/i386-suse-linux/lib /usr/local/lib /opt/kde3/lib /opt/gnome/lib "

# Fix the shell variable $srcfile for the compiler.
fix_srcfile_path=""

# Set to yes if exported symbols are required.
always_export_symbols=no

# The commands to list exported symbols.
export_symbols_cmds="\$NM \$libobjs \$convenience | \$global_symbol_pipe | \$SED 's/.* //' | sort | uniq > \$export_symbols"

# The commands to extract the exported symbol list from a shared archive.
extract_expsyms_cmds=""

# Symbols that should not be listed in the preloaded symbols.
exclude_expsyms="_GLOBAL_OFFSET_TABLE_"

# Symbols that must always be exported.
include_expsyms=""
