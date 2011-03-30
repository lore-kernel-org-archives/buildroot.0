From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 30 Mar 2011 10:01:13 +0100
Subject: [Buildroot] BR:Not building the images
In-Reply-To: <20110329233132.ed0f21fc085cea67a12906c6b8e6fb44.eca3bdf083.wbe@email10.secureserver.net>
References: <20110329233132.ed0f21fc085cea67a12906c6b8e6fb44.eca3bdf083.wbe@email10.secureserver.net>
Message-ID: <AANLkTi=4DpOQ9CSSC3htcv8gtvbxMw1YoNRaU1SeGi=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Works for me (Fedora 14 + buildroot-snapshot)

I do use a wrapper script which populates "buildroot/dl" and some other bits
...but since I'm using the buildroot-snapshot, any new package versions
would be downloaded.


>>>   Generating root filesystem image rootfs.romfs
rm -f /opt/buildroot/output/build/_fakeroot.fs
touch /opt/buildroot/output/build/.fakeroot.00000
cat /opt/buildroot/output/build/.fakeroot* >
/opt/buildroot/output/build/_fakeroot.fs
echo "chown -R 0:0 /opt/buildroot/output/target" >>
/opt/buildroot/output/build/_fakeroot.fs
echo "/opt/buildroot/output/host/usr/bin/makedevs -d
target/generic/device_table.txt /opt/buildroot/output/target" >>
/opt/buildroot/output/build/_fakeroot.fs
echo "  /opt/buildroot/output/host/usr/bin/genromfs -d
/opt/buildroot/output/target -f /opt/buildroot/output/images/rootfs.romfs"
>> /opt/buildroot/output/build/_fakeroot.fs
chmod a+x /opt/buildroot/output/build/_fakeroot.fs
/opt/buildroot/output/host/usr/bin/fakeroot --
/opt/buildroot/output/build/_fakeroot.fs
rootdir=/opt/buildroot/output/target
table='target/generic/device_table.txt'
>>>   Generating root filesystem image rootfs.tar
rm -f /opt/buildroot/output/build/_fakeroot.fs
touch /opt/buildroot/output/build/.fakeroot.00000
cat /opt/buildroot/output/build/.fakeroot* >
/opt/buildroot/output/build/_fakeroot.fs
echo "chown -R 0:0 /opt/buildroot/output/target" >>
/opt/buildroot/output/build/_fakeroot.fs
echo "/opt/buildroot/output/host/usr/bin/makedevs -d
target/generic/device_table.txt /opt/buildroot/output/target" >>
/opt/buildroot/output/build/_fakeroot.fs
echo " tar -c""f /opt/buildroot/output/images/rootfs.tar -C
/opt/buildroot/output/target ." >> /opt/buildroot/output/build/_fakeroot.fs
chmod a+x /opt/buildroot/output/build/_fakeroot.fs
/opt/buildroot/output/host/usr/bin/fakeroot --
/opt/buildroot/output/build/_fakeroot.fs
rootdir=/opt/buildroot/output/target
table='target/generic/device_table.txt'
rm -f /opt/buildroot/output/build/.fakeroot*
[root at dlxarm01 vbuild-snapshot]#

[root at dlxarm01 buildroot]# ls -l output/images/
total 94332
-rw-r--r-- 1 root root 46636032 Mar 30 09:58 rootfs.romfs
-rw-r--r-- 1 root root 48138240 Mar 30 09:58 rootfs.tar
-rw-r--r-- 1 root root  1816776 Mar 30 09:57 uImage
[root at dlxarm01 buildroot]#




On Wed, Mar 30, 2011 at 7:31 AM, <nataraj@vaaraahi.com> wrote:

> Hi Jacmet, Kos_tom and friends
>
> Hanging at the end of a buildroot make process. Of course, not building the
> images in 'output/images'. I am on a gentoo host.
>
> >>>   Generating root filesystem image rootfs.tar
> rm -f /buildroot/output/build/_fakeroot.fs
> touch /buildroot/output/build/.fakeroot.00000
> cat /buildroot/output/build/.fakeroot* >
> /buildroot/output/build/_fakeroot.fs
> echo "chown -R 0:0 /buildroot/output/target" >>
> /buildroot/output/build/_fakeroot.fs
> echo "/buildroot/output/host/usr/bin/makedevs -d
> target/generic/device_table.txt /buildroot/output/target" >>
> /buildroot/output/build/_fakeroot.fs
> echo " tar -c""f /buildroot/output/images/rootfs.tar -C
> /buildroot/output/target ." >> /buildroot/output/build/_fakeroot.fs
> chmod a+x /buildroot/output/build/_fakeroot.fs
> /buildroot/output/host/usr/bin/fakeroot --
> /buildroot/output/build/_fakeroot.fs
> rootdir=/buildroot/output/target
> table='target/generic/device_table.txt'
>
> My .confg:-
> BR2_HAVE_DOT_CONFIG=y
> BR2_VERSION="2010.08-git"
> BR2_arm=y
> BR2_arm926t=y
>
> BR2_ARM_TYPE="ARM926T"
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="arm926ej-s"
> BR2_GCC_TARGET_ARCH="armv5te"
> BR2_GCC_TARGET_ABI="aapcs-linux"
>
>
> BR2_BOARD_NAME="at91sam9263ek"
> BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
> BR2_TARGET_ATMEL=y
>
> BR2_TARGET_AT91=y
>
> BR2_TARGET_ATMEL_ALL=y
>
> BR2_TARGET_AT91SAM9263=y
>
> BR2_TARGET_AT91SAM9263EK=y
> BR2_TARGET_AT91_ADVANCED_INFO=y
>
>
> BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
>
>
> BR2_WGET="wget --passive-ftp -nd"
> BR2_SVN_CO="svn co"
> BR2_SVN_UP="svn up"
> BR2_BZR_CO="bzr co"
> BR2_BZR_UP="bzr up"
> BR2_GIT="git clone"
> BR2_ZCAT="gzip -d -c"
> BR2_BZCAT="bzcat"
> BR2_TAR_OPTIONS=""
> BR2_DL_DIR="/buildroot/dl"
> BR2_STAGING_DIR="$(BASE_DIR)/staging"
>
> BR2_PRIMARY_SITE=""
> BR2_BACKUP_SITE="http://sources.buildroot.net/"
> BR2_SOURCEFORGE_MIRROR="easynews"
> BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
> BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
> BR2_DEBIAN_MIRROR="http://ftp.debian.org"
> BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
> BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
> BR2_JLEVEL=1
> BR2_STRIP_strip=y
> BR2_OPTIMIZE_S=y
>
> BR2_CONFIG_CACHE=y
>
> BR2_TOOLCHAIN_BUILDROOT=y
>
> BR2_KERNEL_HEADERS_2_6_34=y
> BR2_DEFAULT_KERNEL_HEADERS="2.6.34.1"
>
> BR2_UCLIBC_VERSION_SNAPSHOT=y
> BR2_USE_UCLIBC_SNAPSHOT="snapshot"
> BR2_UCLIBC_VERSION_STRING="snapshot"
> BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
>
> BR2_BINUTILS_VERSION_2_20_1=y
> BR2_BINUTILS_VERSION="2.20.1"
> BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
>
> BR2_GCC_VERSION_4_4_X=y
> BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
> BR2_GCC_VERSION="4.4.4"
> BR2_EXTRA_GCC_CONFIG_OPTIONS=""
> BR2_GCC_SHARED_LIBGCC=y
> BR2_GCC_ENABLE_TLS=y
>
>
> BR2_PACKAGE_GDB=y
>
> BR2_GDB_VERSION_6_8=y
> BR2_GDB_VERSION="6.8"
>
> BR2_LARGEFILE=y
> BR2_INET_RPC=y
> BR2_ENABLE_LOCALE=y
> BR2_ENABLE_LOCALE_PURGE=y
> BR2_ENABLE_LOCALE_WHITELIST="C en_US"
> BR2_NEEDS_GETTEXT=y
> BR2_NEEDS_GETTEXT_IF_LOCALE=y
> BR2_USE_WCHAR=y
> BR2_PREFER_SOFT_FLOAT=y
> BR2_SOFT_FLOAT=y
> BR2_USE_SSP=y
> BR2_PTHREADS_NATIVE=y
> BR2_PROGRAM_INVOCATION=y
> BR2_GCC_CROSS_CXX=y
> BR2_INSTALL_LIBSTDCPP=y
> BR2_TARGET_OPTIMIZATION="-pipe"
> BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
>
> BR2_PACKAGE_BUSYBOX=y
> BR2_BUSYBOX_VERSION_1_17_X=y
> BR2_BUSYBOX_VERSION="1.17.1"
> BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
> BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.17.x.config"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_CUSTOMIZE=y
>
> BR2_PACKAGE_ALSA_LIB=y
>
> BR2_PACKAGE_ALSA_LIB_DEVDIR="/dev/snd"
> BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS="all"
> BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS="all"
> BR2_PACKAGE_ALSA_LIB_ALOAD=y
> BR2_PACKAGE_ALSA_LIB_MIXER=y
> BR2_PACKAGE_ALSA_LIB_PCM=y
> BR2_PACKAGE_ALSA_LIB_RAWMIDI=y
> BR2_PACKAGE_ALSA_LIB_HWDEP=y
> BR2_PACKAGE_ALSA_LIB_SEQ=y
> BR2_PACKAGE_ALSA_LIB_ALISP=y
> BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS=y
> BR2_PACKAGE_ALSA_UTILS=y
>
> BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
> BR2_PACKAGE_ALSA_UTILS_ALSACTL=y
> BR2_PACKAGE_ALSA_UTILS_ALSAMIXER=y
> BR2_PACKAGE_ALSA_UTILS_AMIXER=y
> BR2_PACKAGE_ALSA_UTILS_APLAY=y
> BR2_PACKAGE_ALSA_UTILS_ARECORD=y
> BR2_PACKAGE_LIBMAD=y
> BR2_PACKAGE_MPG123=y
>
>
> BR2_PACKAGE_STRACE=y
>
>
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_GETTEXT_STATIC=y
> BR2_PACKAGE_LIBINTL=y
>
>
>
>
> BR2_PACKAGE_QT=y
> BR2_PACKAGE_QT_SHARED=y
> BR2_PACKAGE_QT_LICENSE_APPROVED=y
> BR2_PACKAGE_QT_GUI_MODULE=y
>
>
> BR2_PACKAGE_QT_PIXEL_DEPTH_1=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_4=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_12=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_15=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_16=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_18=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_24=y
> BR2_PACKAGE_QT_PIXEL_DEPTH_32=y
>
> BR2_PACKAGE_QT_FONT_MICRO=y
> BR2_PACKAGE_QT_FONT_FIXED=y
> BR2_PACKAGE_QT_FONT_HELVETICA=y
> BR2_PACKAGE_QT_FONT_UNIFONT=y
> BR2_PACKAGE_QT_QTFREETYPE=y
> BR2_PACKAGE_QT_GIF=y
> BR2_PACKAGE_QT_LIBMNG=y
> BR2_PACKAGE_QT_QTJPEG=y
> BR2_PACKAGE_QT_QTPNG=y
> BR2_PACKAGE_QT_QTTIFF=y
> BR2_PACKAGE_QT_QTZLIB=y
> BR2_PACKAGE_QT_EMB_PLATFORM="arm"
> BR2_PACKAGE_QT_SQL_MODULE=y
> BR2_PACKAGE_QT_MYSQL=y
> BR2_PACKAGE_QT_SQLITE=y
>
> BR2_PACKAGE_QT_GFX_LINUXFB=y
>
>
> BR2_PACKAGE_QT_MOUSE_LINUXINPUT=y
> BR2_PACKAGE_QT_MOUSE_TSLIB=y
>
> BR2_PACKAGE_QT_KEYBOARD_TTY=y
> BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT=y
>
> BR2_PACKAGE_QT_XML=y
> BR2_PACKAGE_QT_NETWORK=y
> BR2_PACKAGE_QT_WEBKIT=y
> BR2_PACKAGE_QT_JAVASCRIPTCORE=y
> BR2_PACKAGE_QT_STL=y
> BR2_PACKAGE_QT_OPENSSL=y
>
>
>
>
>
> BR2_PACKAGE_DBUS=y
> BR2_DBUS_EXPAT=y
> BR2_PACKAGE_DBUS_GLIB=y
> BR2_PACKAGE_HOTPLUG=y
> BR2_PACKAGE_HWDATA=y
> BR2_PACKAGE_MTD=y
>
> BR2_PACKAGE_MTD_FLASHCP=y
> BR2_PACKAGE_MTD_FLASH_ERASE=y
> BR2_PACKAGE_MTD_FLASH_ERASEALL=y
> BR2_PACKAGE_MTD_FLASH_INFO=y
> BR2_PACKAGE_MTD_FLASH_LOCK=y
> BR2_PACKAGE_MTD_FLASH_UNLOCK=y
> BR2_PACKAGE_MTD_MTD_DEBUG=y
> BR2_PACKAGE_MTD_NANDDUMP=y
> BR2_PACKAGE_MTD_NANDTEST=y
> BR2_PACKAGE_MTD_NANDWRITE=y
>
> BR2_PACKAGE_MTD_MTDINFO=y
> BR2_PACKAGE_MTD_UBIATTACH=y
> BR2_PACKAGE_MTD_UBICRC32=y
> BR2_PACKAGE_MTD_UBIDETACH=y
> BR2_PACKAGE_MTD_UBIFORMAT=y
> BR2_PACKAGE_MTD_UBIMKVOL=y
> BR2_PACKAGE_MTD_UBINFO=y
> BR2_PACKAGE_MTD_UBINIZE=y
> BR2_PACKAGE_MTD_UBIRENAME=y
> BR2_PACKAGE_MTD_UBIRMVOL=y
> BR2_PACKAGE_MTD_UBIRSVOL=y
> BR2_PACKAGE_MTD_UBIUPDATEVOL=y
> BR2_PACKAGE_UDEV=y
> BR2_PACKAGE_UDEV_UTILS=y
>
> BR2_PACKAGE_UDEV_VOLUME_ID=y
> BR2_PACKAGE_UDEV_SCSI_ID=y
> BR2_PACKAGE_UDEV_PATH_ID=y
> BR2_PACKAGE_USB_MODESWITCH=y
> BR2_PACKAGE_USBUTILS=y
>
> BR2_PACKAGE_MICROPERL=y
> BR2_PACKAGE_MICROPERL_MODULES=""
>
>
> BR2_PACKAGE_ZLIB=y
>
> BR2_PACKAGE_OPENSSL=y
>
> BR2_PACKAGE_MYSQL_CLIENT=y
> BR2_PACKAGE_SQLITE=y
>
>
> BR2_PACKAGE_FONTCONFIG=y
> BR2_PACKAGE_FREETYPE=y
> BR2_PACKAGE_JPEG=y
> BR2_PACKAGE_LIBPNG=y
> BR2_PACKAGE_TIFF=y
>
>
> BR2_PACKAGE_TSLIB=y
> BR2_PACKAGE_LIBUSB=y
> BR2_PACKAGE_LIBUSB_COMPAT=y
>
> BR2_PACKAGE_LIBPCAP=y
>
> BR2_PACKAGE_LIBGLIB2=y
>
> BR2_PACKAGE_NCURSES=y
> BR2_PACKAGE_NCURSES_TARGET_PANEL=y
> BR2_PACKAGE_NCURSES_TARGET_FORM=y
> BR2_PACKAGE_NCURSES_TARGET_MENU=y
> BR2_PACKAGE_PCRE=y
> BR2_PACKAGE_READLINE=y
>
> BR2_PACKAGE_EXPAT=y
>
>
>
> BR2_PACKAGE_DROPBEAR=y
>
> BR2_PACKAGE_NETSNMP=y
>
> BR2_PACKAGE_PORTMAP=y
> BR2_PACKAGE_PPPD=y
> BR2_PACKAGE_PPPD_FILTER=y
>
>
>
>
>
>
> BR2_ROOTFS_POST_BUILD_SCRIPT=""
> BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
> BR2_ROOTFS_SKELETON_DEFAULT=y
> BR2_TARGET_ROOTFS_TAR=y
> BR2_TARGET_ROOTFS_TAR_NONE=y
> BR2_TARGET_ROOTFS_TAR_OPTIONS=""
>
>
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_2_6_34=y
> BR2_LINUX_KERNEL_VERSION="2.6.34.1"
> BR2_LINUX_KERNEL_PATCH=""
> BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263ek"
> BR2_LINUX_KERNEL_UIMAGE=y
>
>
> Waiting endlessly. What could be wrong?
>
> regards
>
> *Nataraj S Narayan*
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110330/d3132efb/attachment-0001.html>
