From: =?UTF-8?B?0JrQuNGA0LjQu9C7INCb0YPRhtC10L3QutC+?= <lucenko_kirill@mail.ru>
Date: Mon, 27 Jan 2014 11:37:57 +0400
Subject: [Buildroot]
 =?utf-8?q?i686-buildroot-linux-gnu-as__does_not_work?=
In-Reply-To: <1390764781.939450469@f31.i.mail.ru>
References: <1390645407.666601332@f346.i.mail.ru> <52E54212.8090100@gmail.com>
 <1390764781.939450469@f31.i.mail.ru>
Message-ID: <1390808277.846425310@f271.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 It is output of make bellow. I think it might be helpful.?i686-buildroot-linux-gnu-as set as DEFAULT_ASSEMBLER:

$ make
>>> infozip 30 Building
/usr/bin/make -j9 
PATH="//.../BuildRoot/output/host/bin:/.../BuildRoot/output/host/usr/bin:/.../BuildRoot/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
AR="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-ar" 
AS="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as" 
LD="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-ld" 
NM="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-nm" 
CC="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-gcc" 
GCC="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-gcc" 
CPP="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-cpp" 
CXX="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-g++" 
FC="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-gfortran" 
RANLIB="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-ranlib" 
READELF="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-readelf" STRIP="/home/kirill/NIR/repos/project/examples/buildroot-2013.11/output/host/usr/bin/i686-buildroot-linux-gnu-strip" 
OBJCOPY="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-objcopy" 
OBJDUMP="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-objdump" 
AR_FOR_BUILD="/usr/bin/ar" 
AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/bin/gcc" 
GCC_FOR_BUILD="/usr/bin/gcc" 
CXX_FOR_BUILD="/usr/bin/g++" 
FC_FOR_BUILD="/usr/bin/ld" 
LD_FOR_BUILD="/usr/bin/ld" 
CPPFLAGS_FOR_BUILD="-I/.../BuildRoot/output/host/usr/include" 
CFLAGS_FOR_BUILD="-O2 -I/.../BuildRoot/output/host/usr/include" 
CXXFLAGS_FOR_BUILD="-O2 -I/.../BuildRoot/output/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/.../BuildRoot/output/host/lib -L/home/kirill/NIR/repos/project/examples/buildroot-2013.11/output/host/usr/lib -Wl,-rpath,/home/kirill/NIR/repos/project/examples/buildroot-2013.11/output/host/usr/lib" 
FCFLAGS_FOR_BUILD="" 
DEFAULT_ASSEMBLER="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as"
DEFAULT_LINKER="/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-ld" 
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" 
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -O2 " 
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -O2 " 
LDFLAGS="" 
FCFLAGS="" 
PKG_CONFIG="/.../BuildRoot/output/host/usr/bin/pkg-config" 
PERLLIB="/.../BuildRoot/output/host/usr/lib/perl" 
STAGING_DIR="/.../BuildRoot/output/host/usr/i686-buildroot-linux-gnu/sysroot" 
-C /.../BuildRoot/output/build/infozip-30 -f unix/Makefile generic
make[1]: Entering directory `/.../BuildRoot/output/build/infozip-30'
eval /usr/bin/make -f unix/Makefile zips `cat flags`
make[2]: Entering directory `/.../BuildRoot/output/build/infozip-30'
/usr/bin/cpp match.S > _match.s
/usr/bin/cpp crc_i386.S > _crc_i386.s
/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as _match.s
/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as _crc_i386.s
mv _crc_i386.o crc_i386.o
mv: mv _match.o match.o
cannot stat `_crc_i386.o': No such file or directory
make[2]: *** [crc_i386.o] Error 1
make[2]: *** Waiting for unfinished jobs....
mv: cannot stat `_match.o': No such file or directory
make[2]: *** [match.o] Error 1
make[2]: Leaving directory `/home/kirill/NIR/repos/project/examples/buildroot-2013.11/output/build/infozip-30'
make[1]: *** [generic] Error 2
make[1]: Leaving directory `/home/kirill/NIR/repos/project/examples/buildroot-2013.11/output/build/infozip-30'
make: *** [/home/kirill/NIR/repos/project/examples/buildroot-2013.11/output/build/infozip-30/.stamp_built] Error 2


???????????, 26 ?????? 2014, 23:33 +04:00 ?? ?????? ??????? <lucenko_kirill@mail.ru>:
>Hi, Alexander,
>Thank you for responding!
>I use latest 2013.11 version of BuildRoot. I've downloaded it from this page on official site:  http://buildroot.uclibc.org/download.html
>It is the content of my defconfig file:
>
>BR2_x86_core2=y
>BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
>BR2_DEPRECATED=y
>BR2_OPTIMIZE_2=y
>BR2_KERNEL_HEADERS_VERSION=y
>BR2_DEFAULT_KERNEL_VERSION="3.10.20"
>BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>BR2_GCC_VERSION_4_8_X=y
>BR2_TOOLCHAIN_BUILDROOT_CXX=y
>BR2_GCC_ENABLE_OPENMP=y
>BR2_PACKAGE_HOST_GDB=y
>BR2_ENABLE_LOCALE_PURGE=y
>BR2_ENABLE_LOCALE_WHITELIST="C en_US"
>BR2_ECLIPSE_REGISTER=y
>BR2_TARGET_GENERIC_HOSTNAME="box"
>BR2_TARGET_GENERIC_ISSUE="Welcome to Box"
>BR2_INIT_SYSV=y
>BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
>BR2_TARGET_GENERIC_ROOT_PASSWD="rfhfcbr"
># BR2_TARGET_GENERIC_GETTY is not set
>BR2_ROOTFS_OVERLAY="my_root/"
>BR2_LINUX_KERNEL=y
>BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
>BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="my_config"
>BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>BR2_PACKAGE_GZIP=y
>BR2_PACKAGE_INFOZIP=y
>BR2_PACKAGE_XZ=y
>BR2_PACKAGE_LSOF=y
>BR2_PACKAGE_COREUTILS=y
>BR2_PACKAGE_FINDUTILS=y
>BR2_PACKAGE_GAWK=y
>BR2_PACKAGE_GREP=y
>BR2_PACKAGE_SED=y
>BR2_PACKAGE_TAR=y
>BR2_PACKAGE_E2FSPROGS=y
>BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
>BR2_PACKAGE_MAKEDEVS=y
>BR2_PACKAGE_NTFS_3G=y
>BR2_PACKAGE_NTFS_3G_NTFSPROGS=y
>BR2_PACKAGE_XFSPROGS=y
>BR2_PACKAGE_QT=y
>BR2_PACKAGE_QT_LICENSE_APPROVED=y
># BR2_PACKAGE_QT_GUI_MODULE is not set
>BR2_PACKAGE_LINUX_FIRMWARE=y
>BR2_PACKAGE_HDPARM=y
>BR2_PACKAGE_HWDATA=y
>BR2_PACKAGE_I2C_TOOLS=y
>BR2_PACKAGE_IOSTAT=y
>BR2_PACKAGE_LM_SENSORS=y
>BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT=y
>BR2_PACKAGE_LSHW=y
>BR2_PACKAGE_LSUIO=y
>BR2_PACKAGE_MDADM=y
>BR2_PACKAGE_MEMTESTER=y
>BR2_PACKAGE_PCIUTILS=y
>BR2_PACKAGE_SDPARM=y
>BR2_PACKAGE_SETSERIAL=y
>BR2_PACKAGE_SMARTMONTOOLS=y
>BR2_PACKAGE_USBUTILS=y
>BR2_PACKAGE_ALSA_LIB=y
>BR2_PACKAGE_LIBVORBIS=y
>BR2_PACKAGE_LIBARCHIVE=y
>BR2_PACKAGE_LZO=y
>BR2_PACKAGE_OPENSSL_ENGINES=y
>BR2_PACKAGE_SQLITE_READLINE=y
>BR2_PACKAGE_SQLITE_STAT3=y
>BR2_PACKAGE_SQLITE_ENABLE_FTS3=y
>BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY=y
>BR2_PACKAGE_GAMIN=y
>BR2_PACKAGE_LIBCONFIG=y
>BR2_PACKAGE_LIBCONFUSE=y
>BR2_PACKAGE_LIBFUSE=y
>BR2_PACKAGE_LIBLOCKFILE=y
>BR2_PACKAGE_LIBSYSFS=y
>BR2_PACKAGE_LOCKDEV=y
>BR2_PACKAGE_LIBSERIAL=y
>BR2_PACKAGE_LIBUSB_COMPAT=y
>BR2_PACKAGE_EXPAT=y
>BR2_PACKAGE_LIBXMLPP=y
>BR2_PACKAGE_NEON_SSL=y
>BR2_PACKAGE_NEON_LIBXML2=y
>BR2_PACKAGE_OMNIORB=y
>BR2_PACKAGE_BOOST=y
>BR2_PACKAGE_BOOST_DATE_TIME=y
>BR2_PACKAGE_BOOST_FILESYSTEM=y
>BR2_PACKAGE_BOOST_IOSTREAMS=y
>BR2_PACKAGE_BOOST_MATH=y
>BR2_PACKAGE_BOOST_MPI=y
>BR2_PACKAGE_BOOST_SYSTEM=y
>BR2_PACKAGE_BOOST_THREAD=y
>BR2_PACKAGE_ELFUTILS=y
>BR2_PACKAGE_ELFUTILS_PROGS=y
>BR2_PACKAGE_FFTW=y
>BR2_PACKAGE_LIBBSD=y
>BR2_PACKAGE_LIBCAP=y
>BR2_PACKAGE_LIBELF=y
>BR2_PACKAGE_LOG4CXX=y
>BR2_PACKAGE_MPC=y
>BR2_PACKAGE_PROTOBUF_C=y
>BR2_PACKAGE_TZDATA=y
>BR2_PACKAGE_NCURSES_TARGET_PANEL=y
>BR2_PACKAGE_NCURSES_TARGET_FORM=y
>BR2_PACKAGE_NCURSES_TARGET_MENU=y
>BR2_PACKAGE_PCRE=y
>BR2_PACKAGE_PCRE_16=y
>BR2_PACKAGE_PCRE_32=y
>BR2_PACKAGE_POPT=y
>BR2_PACKAGE_SLANG=y
>BR2_PACKAGE_ARPTABLES=y
>BR2_PACKAGE_BRIDGE_UTILS=y
>BR2_PACKAGE_DHCPCD=y
>BR2_PACKAGE_DROPBEAR=y
>BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
># BR2_PACKAGE_DROPBEAR_SMALL is not set
>BR2_PACKAGE_ETHTOOL=y
>BR2_PACKAGE_IPTABLES=y
>BR2_PACKAGE_IPUTILS=y
>BR2_PACKAGE_IW=y
>BR2_PACKAGE_NETCAT=y
>BR2_PACKAGE_NETKITTELNET=y
>BR2_PACKAGE_NTP=y
>BR2_PACKAGE_NTP_NTPDATE=y
>BR2_PACKAGE_OPENSSH=y
>BR2_PACKAGE_SER2NET=y
>BR2_PACKAGE_TCPDUMP=y
>BR2_PACKAGE_TCPDUMP_SMB=y
>BR2_PACKAGE_TFTPD=y
>BR2_PACKAGE_VSFTPD=y
>BR2_PACKAGE_WGET=y
>BR2_PACKAGE_XINETD=y
>BR2_PACKAGE_BASH=y
>BR2_PACKAGE_DIALOG=y
>BR2_PACKAGE_FILE=y
>BR2_PACKAGE_SCREEN=y
>BR2_PACKAGE_SUDO=y
>BR2_PACKAGE_TIME=y
>BR2_PACKAGE_XMLSTARLET=y
>BR2_PACKAGE_HTOP=y
>BR2_PACKAGE_PROCPS=y
>BR2_PACKAGE_PSMISC=y
>BR2_PACKAGE_UTIL_LINUX_BINARIES=y
>BR2_PACKAGE_UTIL_LINUX_AGETTY=y
>BR2_PACKAGE_UTIL_LINUX_FSCK=y
>BR2_PACKAGE_UTIL_LINUX_KILL=y
>BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
>BR2_PACKAGE_UTIL_LINUX_MOUNT=y
>BR2_PACKAGE_UTIL_LINUX_RESET=y
>BR2_PACKAGE_LESS=y
>BR2_PACKAGE_VIM=y
>BR2_TARGET_ROOTFS_CPIO_BZIP2=y
>BR2_TARGET_ROOTFS_EXT2=y
>BR2_TARGET_ROOTFS_INITRAMFS=y
>BR2_TARGET_ROOTFS_TAR_BZIP2=y ?
>
>
>???????????, 26 ?????? 2014, 19:12 +02:00 ?? Alexander Lukichev <alexander.lukichev@gmail.com>:
>>Hi Kirill,
>>
>>01/25/2014 12:23 PM, ?????? ??????? wrote:
>>> I have got very strange error during building of BuildRoot project.
>>> It happens after running following commands in
>>> /.../BuildRoot/output/build/infozip-30 directory:
>>
>>??Could you please send your Buildroot config file attached or pasted
>>into the message text as defconfig? You can produce defconfig by
>>
>>make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>
>>
>>??What Buildroot release / commit id do you use?
>>
>>-- 
>>Best regards,
>>??Alexander Lukichev
>
>
>-- 
>?????? ???????
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot


-- 
?????? ???????
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140127/8ab188a2/attachment.html>
