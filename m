From: A M <madwifi@vermark.com>
Date: Fri, 22 Jun 2007 13:24:32 -0400
Subject: [Buildroot] Help Building Buildroot
In-Reply-To: <f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
References: <20070622084710.5B20648010@busybox.net>
	<f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
Message-ID: <1182533072.3733.7.camel@max.vermark.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

I can not seem to run make sucessfully using the daily snapshot of
buildroot. It seems to always break just after downloading ccache.  Here
is the out put of what I have. I have tried this over and over again.

I have also attached my .config file.  Maybe there is something am
missing.

My target board is the WRAP 2E-E PC Engines

Thanks in advance...

A M


# These are in /lib, so...
#rm
-rf /home/amark/development/buildroot/build_i586/root/usr/lib/libgcc_s*.so*
touch -c /home/amark/development/buildroot/build_i586/root/usr/bin/gcc
wget --passive-ftp -P /home/amark/development/buildroot/dl
http://samba.org/ftp/ccache/ccache-2.4.tar.gz
--13:17:39--  http://samba.org/ftp/ccache/ccache-2.4.tar.gz
Resolving samba.org... 66.70.73.150
Connecting to samba.org|66.70.73.150|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 86363 (84K) [application/x-tar]
Saving to: `/home/amark/development/buildroot/dl/ccache-2.4.tar.gz'

100%[=======================================>] 86,363       139K/s   in
0.6s   

13:17:44 (139 KB/s) -
`/home/amark/development/buildroot/dl/ccache-2.4.tar.gz' saved
[86363/86363]

gzip -d -c /home/amark/development/buildroot/dl/ccache-2.4.tar.gz | tar
-C /home/amark/development/buildroot/toolchain_build_i586   -xf -
touch /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/.unpacked
# WARNING - this will break if the toolchain is moved.
# Should probably patch things to use a relative path.
/home/amark/development/buildroot/toolchain_build_i586/bin/sed -i -e
"s,getenv(\"CCACHE_PATH\"),
\"/home/amark/development/buildroot/build_i586/staging_dir/bin-ccache
\",g" \
                /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/execute.c
# WARNING - this will break if the toolchain build dir is deleted.
/home/amark/development/buildroot/toolchain_build_i586/bin/sed -i -e
"s,getenv(\"CCACHE_DIR\"),
\"/home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/cache\",g" \
                /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/ccache.c
mkdir
-p /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/cache
touch /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/.patched
mkdir
-p /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4
(cd /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4;
rm -rf config.cache; \
                CC="/usr/bin/gcc" \
                /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/configure \
                --target=i386-pc-linux-gnu \
                --host=i386-pc-linux-gnu \
                --build=i386-pc-linux-gnu \
                --prefix=/usr \
        );
configure: Configuring ccache
checking for i386-pc-linux-gnu-gcc... /usr/bin/gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking for /usr/bin/gcc option to accept ANSI C... none needed
checking how to run the C preprocessor... /usr/bin/gcc -E
checking for a BSD-compatible install... /usr/bin/install -c
checking for dirent.h that defines DIR... yes
checking for library containing opendir... none required
checking whether time.h and sys/time.h may both be included... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking ctype.h usability... yes
checking ctype.h presence... yes
checking for ctype.h... yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking pwd.h usability... yes
checking pwd.h presence... yes
checking for pwd.h... yes
checking for realpath... yes
checking for snprintf... yes
checking for vsnprintf... yes
checking for vasprintf... yes
checking for asprintf... yes
checking for mkstemp... yes
checking for gethostname... yes
checking for getpwuid... yes
checking for compar_fn_t in stdlib.h... yes
checking for C99 vsnprintf... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating config.h
touch /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/.configured
make -j1 CC="/usr/bin/gcc"
-C /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4
make[1]: Entering directory
`/home/amark/development/buildroot/toolchain_build_i586/ccache-2.4'
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o ccache.o ccache.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o mdfour.o mdfour.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o hash.o hash.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o execute.o execute.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o util.o util.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o args.o args.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o stats.o stats.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o cleanup.o cleanup.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o snprintf.o snprintf.c
/usr/bin/gcc -g -O2 -Wall -W -I.   -c -o unify.o unify.c
/usr/bin/gcc -g -O2 -Wall -W -I. -o ccache ccache.o mdfour.o hash.o
execute.o util.o args.o stats.o cleanup.o snprintf.o unify.o
make[1]: Leaving directory
`/home/amark/development/buildroot/toolchain_build_i586/ccache-2.4'
mkdir
-p /home/amark/development/buildroot/build_i586/staging_dir/usr/bin;
cp /home/amark/development/buildroot/toolchain_build_i586/ccache-2.4/ccache /home/amark/development/buildroot/build_i586/staging_dir/usr/bin
# Keep the actual toolchain binaries in a directory at the same level.
# Otherwise, relative paths for include dirs break.
mkdir
-p /home/amark/development/buildroot/build_i586/staging_dir/bin-ccache;
(cd /home/amark/development/buildroot/build_i586/staging_dir/bin-ccache;
\
                ln -fs i586-linux-uclibc-gcc i586-linux-gcc; \
                ln -fs i586-linux-uclibc-gcc i586-linux-cc; \
                ln -fs i586-linux-uclibc-gcc i586-linux-uclibc-cc);
[ -f /home/amark/development/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc ] && \

mv /home/amark/development/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc /home/amark/development/buildroot/build_i586/staging_dir/bin-ccache/
make: ***
[/home/amark/development/buildroot/build_i586/staging_dir/usr/bin/ccache] Error 1




-------------- next part --------------
#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
BR2_i386=y
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
BR2_x86_i586=y
# BR2_x86_i686 is not set
# BR2_x86_pentium4 is not set
# BR2_x86_nocona is not set
# BR2_x86_core2 is not set
BR2_ARCH="i586"
BR2_ENDIAN="LITTLE"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_PREFER_STATIC_LIB=y
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
# BR2_UCLIBC_VERSION_0_9_29 is not set
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
# BR2_ENABLE_LOCALE is not set
# BR2_PTHREADS_NONE is not set
BR2_PTHREADS=y
# BR2_PTHREADS_OLD is not set
# BR2_PTHREADS_NATIVE is not set
# BR2_PTHREAD_DEBUG is not set

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
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_INSTALL_LIBSTDCPP=y
# BR2_INSTALL_LIBGCJ is not set
BR2_INSTALL_OBJC=y
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y

#
# Ccache Options
#
BR2_CCACHE=y

#
# Gdb Options
#
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
# BR2_PACKAGE_GDB_HOST is not set
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
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
BR2_LARGEFILE=y
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
BR2_BUSYBOX_VERSION_1_6_0=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.6.0"
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_COREUTILS=y
BR2_PACKAGE_DIFFUTILS=y
BR2_PACKAGE_ED=y
BR2_PACKAGE_FINDUTILS=y
BR2_PACKAGE_FLEX=y
BR2_PACKAGE_FLEX_LIBFL=y
BR2_PACKAGE_GAWK=y
BR2_PACKAGE_GCC_TARGET=y
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
BR2_PACKAGE_GREP=y
BR2_PACKAGE_MAKE=y
BR2_PACKAGE_PATCH=y
BR2_PACKAGE_SED=y
BR2_PACKAGE_TAR=y

#
# Other development stuff
#
BR2_PACKAGE_AUTOCONF=y
BR2_PACKAGE_AUTOMAKE=y
# BR2_PACKAGE_BISON is not set
BR2_PACKAGE_CCACHE_TARGET=y
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_LIBMPFR is not set
BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_M4=y
# BR2_PACKAGE_MPATROL is not set
# BR2_PACKAGE_PKGCONFIG is not set
# BR2_READLINE is not set
# BR2_PACKAGE_VALGRIND is not set
# BR2_PACKAGE_XERCES is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_DASH is not set
BR2_PACKAGE_FILE=y
# BR2_PACKAGE_KEXEC is not set
BR2_PACKAGE_LESS=y
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_MICROCOM is not set
# BR2_PACKAGE_PORTAGE is not set
BR2_PACKAGE_PROCPS=y
# BR2_PACKAGE_SQLITE is not set
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_SUDO=y
BR2_PACKAGE_UTIL-LINUX=y
BR2_NETWORK_SUPPORT=y
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_BOA is not set
BR2_PACKAGE_BIND=y
BR2_PACKAGE_BRIDGE=y
# BR2_PACKAGE_CURL is not set
# BR2_PACKAGE_LIBCURL is not set
BR2_PACKAGE_DHCP_RELAY=y
# BR2_PACKAGE_DNSMASQ is not set
BR2_PACKAGE_DROPBEAR=y
# BR2_PACKAGE_DROPBEAR_URANDOM is not set
BR2_PACKAGE_ETHTOOL=y
# BR2_PACKAGE_HASERL is not set
BR2_PACKAGE_HOSTAP=y
# BR2_PACKAGE_IPERF is not set
BR2_PACKAGE_IPROUTE2=y
# BR2_PACKAGE_IPSEC_TOOLS is not set
BR2_PACKAGE_IPTABLES=y
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
BR2_PACKAGE_NETKITBASE=y
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_TARGET_HEADERS=y
BR2_PACKAGE_OPENVPN=y
# BR2_PACKAGE_OPENSWAN is not set
# BR2_PACKAGE_PORTMAP is not set
BR2_PACKAGE_PPPD=y
BR2_PACKAGE_PROFTPD=y
BR2_PACKAGE_RSYNC=y
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_STUNNEL is not set
BR2_PACKAGE_TCPDUMP=y
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_TN5250 is not set
BR2_PACKAGE_TTCP=y
# BR2_PACKAGE_VTUN is not set
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_BLOCKDEV_SUPPORT=y
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
BR2_PACKAGE_E2FSPROGS=y
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MKDOSFS is not set
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
BR2_PACKAGE_PCMCIA=y
# BR2_PACKAGE_RAIDTOOLS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set
# BR2_AUDIO_SUPPORT is not set
# BR2_GRAPHIC_SUPPORT is not set
BR2_PACKAGE_NCURSES=y
BR2_COMPRESSOR_SUPPORT=y
BR2_PACKAGE_GZIP=y
BR2_PACKAGE_LZO=y
BR2_PACKAGE_LZMA_TARGET=y
# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
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
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE=y
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
# BR2_JFFS2_TARGET_SREC is not set
# BR2_TARGET_ROOTFS_JFFS2_PAD is not set
BR2_TARGET_ROOTFS_JFFS2_LE=y
# BR2_TARGET_ROOTFS_JFFS2_BE is not set
# BR2_TARGET_ROOTFS_JFFS2_SQUASH is not set
BR2_TARGET_ROOTFS_JFFS2_OUTPUT="$(IMAGE).jffs2"
BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_ISO9660 is not set

#
# bootloader for target device
#
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
BR2_TARGET_GRUB_sis900=y
# BR2_TARGET_GRUB_tg3 is not set
BR2_TARGET_GRUB_tulip=y
# BR2_TARGET_GRUB_tlan is not set
# BR2_TARGET_GRUB_undi is not set
# BR2_TARGET_GRUB_via_rhine is not set
# BR2_TARGET_GRUB_w89c840 is not set
BR2_TARGET_SYSLINUX=y

#
# Board Support Options
#
# BR2_PACKAGE_LINUX is not set
# BR2_TARGET_SOEKRIS_NET4521 is not set
# BR2_TARGET_SOEKRIS_NET4801 is not set
# BR2_TARGET_VIA_EPIA_MII is not set

#
# Generic x86 Device Support
#

#
# Generic System Support
#
BR2_TARGET_GENERIC_ACCESS_POINT=y
BR2_TARGET_GENERIC_FIREWALL=y
BR2_TARGET_GENERIC_DEV_SYSTEM=y
