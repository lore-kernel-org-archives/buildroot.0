From: Rob Schottland (buildroot) <arm@ras.kells.com>
Date: Fri, 19 Apr 2013 22:36:24 -0700
Subject: [Buildroot] elfutils 1.55 build fail - arm
Message-ID: <51722958.9030700@ras.kells.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We encountered a build failure in elftools 0.155 compiling bzip2.c

Any insights would be appreciated.

build.log,  .config  and  elfutils.mk
details follow:
= = = = = = = =
build.log
= = = = = = = =
--->>> elfutils 0.155 Building
PATH="/data1/Packages/buildroot-2013.02/output/host/bin:/data1/Packages/buildroot-2013.02/output/host/usr/bin:/data1/Packages/buildroot-2013.02/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
PERLLIB="/data1/Packages/buildroot-2013.02/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C 
/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/
make[1]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155'
/usr/bin/make  all-recursive
make[2]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155'
Making all in config
make[3]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/config'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/config'
Making all in m4
make[3]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/m4'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/m4'
Making all in lib
make[3]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/lib'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/lib'
Making all in libelf
make[3]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libelf'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libelf'
Making all in libebl
make[3]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libebl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libebl'
Making all in libdwfl
make[3]: Entering directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libdwfl'
/data1/Packages/buildroot-2013.02/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
-D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"/usr/share/locale"' -I. -I.. 
-I. -I. -I../lib -I.. -I. -I./../libelf -I./../libebl -I./../libdw  
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -std=gnu99 -Wall -Wshadow 
-Wunused -Wextra -fgnu89-inline -Wformat=2 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -pipe -Os -MT bzip2.o -MD -MP -MF .deps/bzip2.Tpo 
-c -o bzip2.o bzip2.c
if 
/data1/Packages/buildroot-2013.02/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc 
-D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"/usr/share/locale"' -I. -I.. 
-I. -I. -I../lib -I.. -I. -I./../libelf -I./../libebl -I./../libdw 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -std=gnu99 -Wall -Wshadow 
-Wunused -Wextra -fgnu89-inline -Wformat=2 -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -pipe -Os -c -o dwfl_begin.os -fpic -DPIC -DSHARED 
-MT dwfl_begin.os -MD -MP \
       -MF ".deps/dwfl_begin.Tpo" `test -f 'dwfl_begin.c' || echo 
'./'`dwfl_begin.c; \
     then cat ".deps/dwfl_begin.Tpo" >> ".deps/dwfl_begin.Po"; \
          rm -f ".deps/dwfl_begin.Tpo"; \
     else rm -f ".deps/dwfl_begin.Tpo"; exit 1; \
     fi
In file included from bzip2.c:4:0:
gzip.c:49:20: fatal error: bzlib.h: No such file or directory
compilation terminated.
make[3]: *** [bzip2.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/libdwfl'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155'
make: *** 
[/data1/Packages/buildroot-2013.02/output/build/elfutils-0.155/.stamp_built] 
Error 2-----------------
= = = = = = = = = = = = =
.config file follows:
= = = = = = = = == = = =
#
# Automatically generated make config: don't edit
# Buildroot 2013.02 Configuration
#
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
# BR2_armeb is not set
# BR2_aarch64 is not set
# BR2_avr32 is not set
# BR2_bfin is not set
# BR2_i386 is not set
# BR2_microblazeel is not set
# BR2_microblazebe is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_mips64 is not set
# BR2_mips64el is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"
# BR2_generic_arm is not set
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
BR2_arm926t=y
# BR2_arm10t is not set
# BR2_arm1136jf_s_r0 is not set
# BR2_arm1136jf_s_r1 is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_cortex_a5 is not set
# BR2_cortex_a8 is not set
# BR2_cortex_a9 is not set
# BR2_cortex_a15 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
# BR2_arm1136jf_s is not set
BR2_ARM_EABI=y

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_LOCALFILES="cp"
BR2_SCP="scp"
BR2_SSH="ssh"
BR2_HG="hg"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=0
# BR2_CCACHE is not set
# BR2_DEPRECATED is not set
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
BR2_STRIP_EXCLUDE_FILES=""
BR2_STRIP_EXCLUDE_DIRS=""
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
# BR2_TOOLCHAIN_EXTERNAL is not set
BR2_TOOLCHAIN_CTNG=y
BR2_TOOLCHAIN_CTNG_uClibc=y
# BR2_TOOLCHAIN_CTNG_eglibc is not set
# BR2_TOOLCHAIN_CTNG_glibc is not set
BR2_TOOLCHAIN_CTNG_LIBC="uClibc"
BR2_TOOLCHAIN_CTNG_CONFIG="toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc"

#
# Toolchain Options
#
BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE=y
# BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6 is not set
# BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC is not set
BR2_TOOLCHAIN_CTNG_uClibc_WCHAR=y
# BR2_TOOLCHAIN_CTNG_uClibc_LOCALE is not set
# BR2_TOOLCHAIN_CTNG_CXX is not set
# BR2_TOOLCHAIN_CTNG_THREADS_NONE is not set
# BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS is not set
# BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD is not set
BR2_TOOLCHAIN_CTNG_THREADS_NPTL=y

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set
BR2_LARGEFILE=y
BR2_USE_WCHAR=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
# BR2_ECLIPSE_REGISTER is not set

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="GESBC-9G20u"
BR2_TARGET_GENERIC_ISSUE="Welcome to GESBC-9G20u"
# BR2_TARGET_GENERIC_PASSWD_DES is not set
BR2_TARGET_GENERIC_PASSWD_MD5=y
# BR2_TARGET_GENERIC_PASSWD_SHA256 is not set
# BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_INIT_BUSYBOX=y
# BR2_INIT_SYSV is not set

#
# systemd requires largefile, wchar, IPv6, threads and udev support
#
# BR2_INIT_NONE is not set
BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
BR2_TARGET_GENERIC_ROOT_PASSWD=""
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_GETTY_TERM="vt100"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_OVERLAY=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_POST_IMAGE_SCRIPT=""

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_19_X is not set
# BR2_BUSYBOX_VERSION_1_20_X is not set
BR2_BUSYBOX_VERSION_1_21_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.21.0"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.21.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set

#
# Audio and video applications
#
# BR2_PACKAGE_ALSA_UTILS is not set
# BR2_PACKAGE_AUMIX is not set

#
# bellagio requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_FAAD2 is not set
# BR2_PACKAGE_FLAC is not set

#
# ffmpeg requires a toolchain with LARGEFILE and IPV6 support
#
# BR2_PACKAGE_GSTREAMER is not set

#
# gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support
#
# BR2_PACKAGE_LAME is not set
# BR2_PACKAGE_MADPLAY is not set

#
# mpd requires a toolchain with C++ and WCHAR support
#
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_OPUS_TOOLS is not set
# BR2_PACKAGE_PULSEAUDIO is not set
# BR2_PACKAGE_VORBIS_TOOLS is not set
# BR2_PACKAGE_WAVPACK is not set
# BR2_PACKAGE_YAVTA is not set

#
# Compressors and decompressors
#
BR2_PACKAGE_BZIP2=y
# BR2_PACKAGE_GZIP is not set
BR2_PACKAGE_INFOZIP=y
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#

#
# bonnie++ requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_CACHE_CALIBRATOR is not set
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DSTAT is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LATENCYTOP is not set
# BR2_PACKAGE_LMBENCH is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP_TESTSUITE is not set
# BR2_PACKAGE_LTTNG_MODULES is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_PERF is not set
# BR2_PACKAGE_RAMSPEED is not set
# BR2_PACKAGE_RT_TESTS is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_STRESS is not set
# BR2_PACKAGE_WHETSTONE is not set
# BR2_PACKAGE_PV is not set

#
# Development tools
#
BR2_PACKAGE_BINUTILS=y
BR2_PACKAGE_BINUTILS_TARGET=y
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
BR2_PACKAGE_COREUTILS=y
# BR2_PACKAGE_CVS is not set
BR2_PACKAGE_DIFFUTILS=y
# BR2_PACKAGE_DISTCC is not set
BR2_PACKAGE_FINDUTILS=y
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set
BR2_PACKAGE_GETTEXT=y
# BR2_PACKAGE_GETTEXT_TOOLS is not set
# BR2_PACKAGE_GMP is not set

#
# gperf requires a toolchain with C++ support enabled
#
BR2_PACKAGE_GREP=y
# BR2_PACKAGE_MPC is not set
# BR2_PACKAGE_MPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_PKGCONF is not set
BR2_PACKAGE_SED=y
# BR2_PACKAGE_SSTRIP is not set
BR2_PACKAGE_TAR=y
# BR2_PACKAGE_VALA is not set

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

#
# cegui06 needs a toolchain with C++ and threads
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set
# BR2_PACKAGE_FBSET is not set

#
# fbterm requires a toolchain with C++, WCHAR and locale support
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FB_TEST_APP is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#
# BR2_PACKAGE_EFL is not set

#
# qt requires a toolchain with C++ support enabled
#
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
# Filesystem and flash utilities
#
# BR2_PACKAGE_CIFS_UTILS is not set
# BR2_PACKAGE_CRAMFS is not set
# BR2_PACKAGE_CURLFTPFS is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_FLASHBENCH is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_MAKEDEVS is not set
BR2_PACKAGE_MTD=y

#
# MTD tools selection
#
# BR2_PACKAGE_MTD_DOCFDISK is not set
# BR2_PACKAGE_MTD_DOC_LOADBIOS is not set
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
# BR2_PACKAGE_MTD_FLASH_OTP_DUMP is not set
# BR2_PACKAGE_MTD_FLASH_OTP_INFO is not set
# BR2_PACKAGE_MTD_FLASH_OTP_LOCK is not set
# BR2_PACKAGE_MTD_FLASH_OTP_WRITE is not set
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
# BR2_PACKAGE_MTD_FTL_CHECK is not set
# BR2_PACKAGE_MTD_FTL_FORMAT is not set
# BR2_PACKAGE_MTD_JFFS2DUMP is not set
# BR2_PACKAGE_MTD_MKFSJFFS2 is not set
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDTEST=y
BR2_PACKAGE_MTD_NANDWRITE=y
# BR2_PACKAGE_MTD_NFTLDUMP is not set
# BR2_PACKAGE_MTD_NFTL_FORMAT is not set

#
# recv_image requires a toolchain with IPv6 support
#
# BR2_PACKAGE_MTD_RFDDUMP is not set
# BR2_PACKAGE_MTD_RFDFORMAT is not set
# BR2_PACKAGE_MTD_SERVE_IMAGE is not set
# BR2_PACKAGE_MTD_SUMTOOL is not set
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
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_UNIONFS is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Hardware handling
#

#
# Misc devices firmwares
#
# BR2_PACKAGE_B43_FIRMWARE is not set
# BR2_PACKAGE_FIRMWARE_IMX is not set
# BR2_PACKAGE_LINUX_FIRMWARE is not set
# BR2_PACKAGE_RPI_FIRMWARE is not set
# BR2_PACKAGE_UX500_FIRMWARE is not set
# BR2_PACKAGE_ZD1211_FIRMWARE is not set
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DVB_APPS is not set
# BR2_PACKAGE_DVBSNOOP is not set
BR2_PACKAGE_EEPROG=y
# BR2_PACKAGE_EVTEST is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_FMTOOLS is not set
# BR2_PACKAGE_FXLOAD is not set
# BR2_PACKAGE_GADGETFS_TEST is not set

#
# gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled
#
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
BR2_PACKAGE_INPUT_EVENT_DAEMON=y
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
BR2_PACKAGE_LCDPROC=y
BR2_PACKAGE_LCDPROC_DRIVERS="all"
# BR2_PACKAGE_LCDPROC_MENUS is not set
# BR2_PACKAGE_LM_SENSORS is not set

#
# lshw requires a toolchain with C++, LARGEFILE & WCHAR support enabled
#
# BR2_PACKAGE_LSUIO is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEDIA_CTL is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MINICOM is not set
# BR2_PACKAGE_NANOCOM is not set
# BR2_PACKAGE_NEARD is not set
# BR2_PACKAGE_OFONO is not set
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set
# BR2_PACKAGE_OWL_LINUX is not set
# BR2_PACKAGE_PARTED is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PICOCOM is not set
# BR2_PACKAGE_RNG_TOOLS is not set

#
# rpi-userland requires a toolchain with C++ and LARGEFILE support
#
# BR2_PACKAGE_SANE_BACKENDS is not set
# BR2_PACKAGE_SDPARM is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SG3_UTILS is not set

#
# smartmontools requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SNOWBALL_HDMISERVICE is not set
# BR2_PACKAGE_SREDIRD is not set
# BR2_PACKAGE_STATSERIAL is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_TI_UTILS is not set
# BR2_PACKAGE_UBOOT_TOOLS is not set
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_UDEV_RULES_GEN=y
# BR2_PACKAGE_UDEV_ALL_EXTRAS is not set
# BR2_PACKAGE_UDISKS is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USB_MODESWITCH_DATA is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_ERLANG is not set
# BR2_PACKAGE_HASERL is not set

#
# jamvm requires a toolchain with IPV6 support
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_LUAJIT is not set
# BR2_PACKAGE_PERL is not set
BR2_PACKAGE_PHP=y

#
# Extensions
#
# BR2_PACKAGE_PHP_EXT_CALENDAR is not set
# BR2_PACKAGE_PHP_EXT_FILEINFO is not set
# BR2_PACKAGE_PHP_EXT_READLINE is not set
BR2_PACKAGE_PHP_EXT_SESSION=y

#
# Compression extensions
#
# BR2_PACKAGE_PHP_EXT_BZIP2 is not set
# BR2_PACKAGE_PHP_EXT_ZIP is not set
BR2_PACKAGE_PHP_EXT_ZLIB=y

#
# Cryptography extensions
#
# BR2_PACKAGE_PHP_EXT_HASH is not set
# BR2_PACKAGE_PHP_EXT_OPENSSL is not set

#
# Database extensions
#
# BR2_PACKAGE_PHP_EXT_DBA is not set
# BR2_PACKAGE_PHP_EXT_SQLITE is not set
# BR2_PACKAGE_PHP_EXT_PDO is not set

#
# Human language and character encoding support
#
# BR2_PACKAGE_PHP_EXT_GETTEXT is not set
# BR2_PACKAGE_PHP_EXT_ICONV is not set

#
# intl support requires a toolchain with C++ and WCHAR support
#

#
# Image processing
#
# BR2_PACKAGE_PHP_EXT_EXIF is not set

#
# Mathematical extensions
#
# BR2_PACKAGE_PHP_EXT_BCMATH is not set
# BR2_PACKAGE_PHP_EXT_GMP is not set

#
# Other basic extensions
#
# BR2_PACKAGE_PHP_EXT_JSON is not set
# BR2_PACKAGE_PHP_EXT_TOKENIZER is not set

#
# Other services
#
# BR2_PACKAGE_PHP_EXT_CURL is not set
# BR2_PACKAGE_PHP_EXT_FTP is not set
# BR2_PACKAGE_PHP_EXT_SNMP is not set
# BR2_PACKAGE_PHP_EXT_SOCKETS is not set

#
# Process Control
#
# BR2_PACKAGE_PHP_EXT_PCNTL is not set
BR2_PACKAGE_PHP_EXT_POSIX=y
# BR2_PACKAGE_PHP_EXT_SHMOP is not set
# BR2_PACKAGE_PHP_EXT_SYSVMSG is not set
# BR2_PACKAGE_PHP_EXT_SYSVSEM is not set
# BR2_PACKAGE_PHP_EXT_SYSVSHM is not set

#
# Variable and Type related
#
# BR2_PACKAGE_PHP_EXT_CTYPE is not set
# BR2_PACKAGE_PHP_EXT_FILTER is not set

#
# Web services
#
# BR2_PACKAGE_PHP_EXT_SOAP is not set
# BR2_PACKAGE_PHP_EXT_XMLRPC is not set

#
# XML manipulation
#
# BR2_PACKAGE_PHP_EXT_DOM is not set
# BR2_PACKAGE_PHP_EXT_LIBXML2 is not set
# BR2_PACKAGE_PHP_EXT_SIMPLEXML is not set
# BR2_PACKAGE_PHP_EXT_WDDX is not set
# BR2_PACKAGE_PHP_EXT_XML is not set
# BR2_PACKAGE_PHP_EXT_XMLREADER is not set
# BR2_PACKAGE_PHP_EXT_XMLWRITER is not set
# BR2_PACKAGE_PHP_EXT_XSL is not set
BR2_PACKAGE_PHP_CGI=y
BR2_PACKAGE_PHP_SAPI_CGI=y
# BR2_PACKAGE_PHP_SAPI_CLI is not set
# BR2_PACKAGE_PHP_SAPI_CLI_CGI is not set
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y
# BR2_PACKAGE_PYTHON_PYC_ONLY is not set
# BR2_PACKAGE_PYTHON_PY_PYC is not set

#
# core python modules
#

#
# The following modules are unusual or require extra libraries
#
BR2_PACKAGE_PYTHON_BZIP2=y
BR2_PACKAGE_PYTHON_BSDDB=y
# BR2_PACKAGE_PYTHON_CODECSCJK is not set
BR2_PACKAGE_PYTHON_CURSES=y
BR2_PACKAGE_PYTHON_PYEXPAT=y
BR2_PACKAGE_PYTHON_READLINE=y
BR2_PACKAGE_PYTHON_SSL=y
BR2_PACKAGE_PYTHON_UNICODEDATA=y
BR2_PACKAGE_PYTHON_SQLITE=y
BR2_PACKAGE_PYTHON_ZLIB=y
# BR2_PACKAGE_PYTHON3 is not set

#
# external python modules
#
# BR2_PACKAGE_PYTHON_BOTTLE is not set
BR2_PACKAGE_PYTHON_DPKT=y
# BR2_PACKAGE_PYTHON_ID3 is not set
# BR2_PACKAGE_PYTHON_MAD is not set
# BR2_PACKAGE_PYTHON_MELD3 is not set
BR2_PACKAGE_PYTHON_NETIFACES=y
# BR2_PACKAGE_PYTHON_NFC is not set
# BR2_PACKAGE_PYTHON_PROTOBUF is not set
# BR2_PACKAGE_PYTHON_PYGAME is not set
# BR2_PACKAGE_PYTHON_PYPARSING is not set
BR2_PACKAGE_PYTHON_SERIAL=y
BR2_PACKAGE_PYTHON_SETUPTOOLS=y
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set

#
# Libraries
#

#
# Audio/Sound
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# audiofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_CELT051 is not set
# BR2_PACKAGE_LIBAO is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBCUE is not set
# BR2_PACKAGE_LIBCUEFILE is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBLO is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_OPUS is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_SPEEX is not set

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_TREMOR is not set

#
# webrtc-audio-processing requires a toolchain with C++ support enabled
#

#
# Compression and decompression
#
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
BR2_PACKAGE_ZLIB=y

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_GNUTLS is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBMCRYPT is not set
# BR2_PACKAGE_LIBMHASH is not set
# BR2_PACKAGE_LIBNSS is not set
# BR2_PACKAGE_LIBSHA1 is not set
# BR2_PACKAGE_NETTLE is not set
# BR2_PACKAGE_OCF_LINUX is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENSSL_OCF is not set
# BR2_PACKAGE_POLARSSL is not set

#
# Database
#
BR2_PACKAGE_BERKELEYDB=y
# BR2_PACKAGE_BERKELEYDB_TOOLS is not set
# BR2_PACKAGE_GDBM is not set

#
# Mysql client requires a toolchain with C++ support enabled
#

#
# sqlcipher conflicts with sqlite
#
BR2_PACKAGE_SQLITE=y
# BR2_PACKAGE_SQLITE_READLINE is not set
# BR2_PACKAGE_SQLITE_STAT3 is not set
# BR2_PACKAGE_SQLITE_ENABLE_FTS3 is not set
# BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY is not set
# BR2_PACKAGE_SQLITE_SECURE_DELETE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
BR2_PACKAGE_FREETYPE=y
# BR2_PACKAGE_GD is not set
# BR2_PACKAGE_IMLIB2 is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBDMTX is not set
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set
# BR2_PACKAGE_GDK_PIXBUF is not set

#
# libgtk2 requires a toolchain with WCHAR and C++ support
#
# BR2_PACKAGE_LIBPNG is not set

#
# libraw requires a toolchain with C++ support enabled
#

#
# librsvg requires a toolchain with WCHAR and C++ support
#
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set

#
# opencv requires a toolchain with C++ and WCHAR support
#

#
# pango requires a toolchain with WCHAR and C++ support
#
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_TIFF is not set

#
# webkit requires C++, WCHAR in toolchain and libgtk2
#

#
# zxing requires a toolchain with C++ support
#

#
# Hardware handling
#
BR2_PACKAGE_CCID=y
# BR2_PACKAGE_IMX_LIB is not set

#
# lcdapi requires a toolchain with C++ and thread support enabled
#
BR2_PACKAGE_LIBAIO=y
# BR2_PACKAGE_LIBATASMART is not set
BR2_PACKAGE_LIBRAW1394=y
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_LIBFREEFARE is not set
BR2_PACKAGE_LIBFTDI=y
BR2_PACKAGE_LIBHID=y
# BR2_PACKAGE_LIBIQRF is not set
BR2_PACKAGE_LIBNFC=y
BR2_PACKAGE_LIBNFC_EXAMPLES=y
BR2_PACKAGE_LIBNFC_LLCP=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y
# BR2_PACKAGE_LIBV4L is not set
# BR2_PACKAGE_MTDEV is not set
# BR2_PACKAGE_NEARDAL is not set
BR2_PACKAGE_PCSC_LITE=y
# BR2_PACKAGE_PCSC_LITE_DEBUGATR is not set
# BR2_PACKAGE_PCSC_LITE_EMBEDDED is not set

#
# Javascript
#
# BR2_PACKAGE_EXPLORERCANVAS is not set
# BR2_PACKAGE_FLOT is not set
# BR2_PACKAGE_JQUERY is not set
# BR2_PACKAGE_JQUERY_SPARKLINE is not set
# BR2_PACKAGE_JQUERY_VALIDATION is not set
# BR2_PACKAGE_JSMIN is not set

#
# Multimedia
#
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set

#
# libebml requires a toolchain with C++ support
#
# BR2_PACKAGE_LIBFSLCODEC is not set
# BR2_PACKAGE_LIBFSLPARSER is not set
# BR2_PACKAGE_LIBFSLVPUWRAP is not set

#
# libmatroska requires a toolchain with C++ support
#
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPEG2 is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBPLAYER is not set
# BR2_PACKAGE_LIBTHEORA is not set

#
# Live555 needs C++ compiler
#

#
# mediastreamer requires a toolchain with threads and C++ support
#

#
# Networking
#
# BR2_PACKAGE_GLIB_NETWORKING is not set
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_CURL=y
# BR2_PACKAGE_LIBDNET is not set
BR2_PACKAGE_LIBESMTP=y
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBFCGI is not set
# BR2_PACKAGE_LIBGSASL is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBISCSI is not set
# BR2_PACKAGE_LIBOAUTH is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBMNL is not set
BR2_PACKAGE_LIBMODBUS=y
BR2_PACKAGE_LIBMBUS=y
# BR2_PACKAGE_LIBNETFILTER_ACCT is not set
# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
# BR2_PACKAGE_LIBNETFILTER_CTHELPER is not set
# BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT is not set
# BR2_PACKAGE_LIBNETFILTER_LOG is not set
# BR2_PACKAGE_LIBNFNETLINK is not set
# BR2_PACKAGE_LIBNL is not set

#
# liboping requires a toolchain with IPv6 support enabled
#
# BR2_PACKAGE_LIBPCAP is not set
BR2_PACKAGE_LIBOSIP2=y
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBTIRPC is not set

#
# libtorrent requires a toolchain with C++ and threads support enabled
#
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LIBVNCSERVER is not set
# BR2_PACKAGE_ORTP is not set
# BR2_PACKAGE_SLIRP is not set
# BR2_PACKAGE_USBREDIR is not set

#
# zeromq requires a toolchain with C++, LARGEFILE + WCHAR support
#

#
# Other
#
# BR2_PACKAGE_APR is not set
# BR2_PACKAGE_APR_UTIL is not set
# BR2_PACKAGE_LIBCOFI is not set

#
# classpath requires a toolchain with IPV6 support
#
BR2_PACKAGE_ELFUTILS=y
# BR2_PACKAGE_FFTW is not set
# BR2_PACKAGE_LIBARGTABLE2 is not set
BR2_PACKAGE_ARGP_STANDALONE=y

#
# boost requires a toolchain with C++, large file and thread support enabled
#
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBCAP_NG is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBEV is not set
BR2_PACKAGE_LIBFFI=y
# BR2_PACKAGE_GSL is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBICAL is not set
# BR2_PACKAGE_LIBNSPR is not set

#
# libsigc++ requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBTPL is not set
# BR2_PACKAGE_LIBURCU is not set

#
# linux-pam requires a toolchain with WCHAR and locale support
#
# BR2_PACKAGE_LTTNG_LIBUST is not set
# BR2_PACKAGE_MTDEV2TUIO is not set
# BR2_PACKAGE_ORC is not set

#
# poco requires a toolchain with WCHAR and C++ support
#

#
# protobuf requires a toolchain with C++ support enabled
#

#
# schifra requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set

#
# Text and terminal handling
#

#
# enchant requires a toolchain with C++ and WCHAR support enabled
#
# BR2_PACKAGE_LIBFRIBIDI is not set

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LINENOISE is not set
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_PANEL=y
BR2_PACKAGE_NCURSES_TARGET_FORM=y
BR2_PACKAGE_NCURSES_TARGET_MENU=y
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
BR2_PACKAGE_READLINE=y
# BR2_PACKAGE_SLANG is not set

#
# JSON/XML
#
BR2_PACKAGE_CJSON=y
BR2_PACKAGE_EXPAT=y
BR2_PACKAGE_EZXML=y
BR2_PACKAGE_JSON_C=y
# BR2_PACKAGE_LIBROXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set

#
# xerces-c++ requires a toolchain with C++ and WCHAR support enabled
#
# BR2_PACKAGE_YAJL is not set

#
# Miscellaneous
#
# BR2_PACKAGE_COLLECTD is not set
# BR2_PACKAGE_EMPTY is not set
# BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
# BR2_PACKAGE_MCRYPT is not set
# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_SNOWBALL_INIT is not set
# BR2_PACKAGE_SOUND_THEME_BOREALIS is not set
# BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_ARPTABLES is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BLUEZ_UTILS is not set
# BR2_PACKAGE_BOA is not set

#
# bmon requires a toolchain with IPv6 support
#
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_CAN_UTILS is not set

#
# connman needs a toolchain with IPv6, WCHAR, thread and resolver support
#

#
# ctorrent requires a toolchain with C++ support enabled
#

#
# conntrack-tools requires a toolchain with IPV6 and LARGEFILE support
#
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set

#
# ebtables requires a toolchain with IPv6 support
#
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_GESFTPSERVER is not set
# BR2_PACKAGE_HEIRLOOM_MAILX is not set
# BR2_PACKAGE_HIAWATHA is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_HTTPING is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iftop requires IPv6 and threads support in toolchain
#
# BR2_PACKAGE_IGH_ETHERCAT is not set
# BR2_PACKAGE_INADYN is not set

#
# iperf requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPSET is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set

#
# Kismet requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set

#
# linphone requires a toolchain with threads and C++ support enabled
#
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MACCHANGER is not set
# BR2_PACKAGE_MII_DIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MSMTP is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set

#
# ndisc6 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_NETCAT is not set

#
# netkitbase requires a toolchain with RPC support
#

#
# netkittelnet requires a toolchain with RPC support
#
# BR2_PACKAGE_NETATALK is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# NetworkManager requires a toolchain with IPV6, LARGEFILE, WCHAR and 
thread support
#
# BR2_PACKAGE_NFACCT is not set
# BR2_PACKAGE_NOIP is not set
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set

#
# olsr requires a toolchain with IPv6 and threads support
#
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
# BR2_PACKAGE_OPENSWAN is not set

#
# openvpn requires a toolchain with IPV6 support
#

#
# portmap requires a toolchain with RPC support
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_PROXYCHAINS_NG is not set
# BR2_PACKAGE_QUAGGA is not set

#
# radvd requires a toolchain with IPV6 support
#
# BR2_PACKAGE_RPCBIND is not set
# BR2_PACKAGE_RSH_REDONE is not set
BR2_PACKAGE_RSYNC=y

#
# rtorrent requires a toolchain with C++, threads and WCHAR support
#
# BR2_PACKAGE_SAMBA is not set

#
# sconeserver requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SOCKETCAND is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SPICE_PROTOCOL is not set

#
# Squid requires a toolchain with C++ and IPv6 support enabled
#
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set

#
# Transmission requires a toolchain with IPv6 and threads support
#

#
# tvheadend requires a toolchain with LARGEFILE and IPv6 support
#
# BR2_PACKAGE_UDPCAST is not set

#
# ulogd requires a toolchain with IPV6 and LARGEFILE support
#
# BR2_PACKAGE_USHARE is not set
# BR2_PACKAGE_VDE2 is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set
# BR2_PACKAGE_XINETD is not set
# BR2_PACKAGE_XL2TP is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
BR2_PACKAGE_OPKG=y

#
# rpm requires libneon with SSL, XML and ZLIB support
#

#
# Real-Time
#
# BR2_PACKAGE_XENOMAI is not set

#
# Shell and utilities
#
BR2_PACKAGE_AT=y
BR2_PACKAGE_BASH=y
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_DIALOG is not set
BR2_PACKAGE_FILE=y
# BR2_PACKAGE_GNUPG is not set
# BR2_PACKAGE_INOTIFY_TOOLS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LOGSURFER is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
BR2_PACKAGE_TIME=y
# BR2_PACKAGE_WHICH is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#
# BR2_PACKAGE_ACL is not set
# BR2_PACKAGE_ATTR is not set
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CPULOAD is not set
# BR2_PACKAGE_HTOP is not set
# BR2_PACKAGE_KEYUTILS is not set
BR2_PACKAGE_KMOD=y
BR2_PACKAGE_KMOD_TOOLS=y
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_MONIT is not set
# BR2_PACKAGE_NCDU is not set
# BR2_PACKAGE_POLKIT is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_QUOTA is not set
# BR2_PACKAGE_RSYSLOG is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_SUPERVISOR is not set

#
# systemd not available (depends on /dev management with udev and ipv6 
support, and thread support in toolchain)
#
BR2_PACKAGE_UTIL_LINUX=y
# BR2_PACKAGE_UTIL_LINUX_MOUNT is not set
# BR2_PACKAGE_UTIL_LINUX_FSCK is not set
# BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is not set
BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
# BR2_PACKAGE_UTIL_LINUX_UUIDD is not set
BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
# BR2_PACKAGE_UTIL_LINUX_AGETTY is not set
# BR2_PACKAGE_UTIL_LINUX_CRAMFS is not set
# BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT is not set
# BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT is not set
# BR2_PACKAGE_UTIL_LINUX_FALLOCATE is not set
# BR2_PACKAGE_UTIL_LINUX_UNSHARE is not set
# BR2_PACKAGE_UTIL_LINUX_RENAME is not set
# BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS is not set
# BR2_PACKAGE_UTIL_LINUX_WALL is not set
# BR2_PACKAGE_UTIL_LINUX_PARTX is not set
# BR2_PACKAGE_UTIL_LINUX_ARCH is not set
# BR2_PACKAGE_UTIL_LINUX_INIT is not set
BR2_PACKAGE_UTIL_LINUX_KILL=y
# BR2_PACKAGE_UTIL_LINUX_LAST is not set
# BR2_PACKAGE_UTIL_LINUX_MESG is not set
# BR2_PACKAGE_UTIL_LINUX_RAW is not set
# BR2_PACKAGE_UTIL_LINUX_RESET is not set
# BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS is not set
# BR2_PACKAGE_UTIL_LINUX_WRITE is not set

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
BR2_PACKAGE_LESS=y
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set
BR2_PACKAGE_VIM=y
BR2_PACKAGE_VIM_RUNTIME=y

#
# Host utilities
#
# BR2_PACKAGE_HOST_DFU_UTIL is not set
# BR2_PACKAGE_HOST_LPC3250LOADER is not set
# BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS is not set
# BR2_PACKAGE_HOST_OPENOCD is not set
# BR2_PACKAGE_HOST_SAM_BA is not set
# BR2_PACKAGE_HOST_UBOOT_TOOLS is not set

#
# Filesystem images
#
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_CPIO=y
# BR2_TARGET_ROOTFS_CPIO_NONE is not set
# BR2_TARGET_ROOTFS_CPIO_GZIP is not set
BR2_TARGET_ROOTFS_CPIO_BZIP2=y
# BR2_TARGET_ROOTFS_CPIO_LZMA is not set
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
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
BR2_TARGET_ROOTFS_JFFS2_PAD=y
BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x0
BR2_TARGET_ROOTFS_JFFS2_LE=y
# BR2_TARGET_ROOTFS_JFFS2_BE is not set
BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
# BR2_TARGET_ROOTFS_ROMFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
# BR2_TARGET_ROOTFS_TAR_NONE is not set
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
BR2_TARGET_ROOTFS_TAR_BZIP2=y
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
# BR2_TARGET_ROOTFS_UBIFS is not set

#
# Bootloaders
#
# BR2_TARGET_AT91BOOTSTRAP is not set
# BR2_TARGET_AT91BOOTSTRAP3 is not set
# BR2_TARGET_AT91DATAFLASHBOOT is not set
# BR2_TARGET_BAREBOX is not set
# BR2_TARGET_LPC32XXCDL is not set
# BR2_TARGET_MXS_BOOTLETS is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_7 is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.42"
BR2_LINUX_KERNEL_VERSION="3.2.42"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g20"
BR2_LINUX_KERNEL_UBOOT_IMAGE=y
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_APPENDED_UIMAGE is not set
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_APPENDED_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
# BR2_LINUX_KERNEL_INSTALL_TARGET is not set

#
# Linux Kernel Extensions
#
# BR2_LINUX_KERNEL_EXT_XENOMAI is not set
# BR2_LINUX_KERNEL_EXT_OCF_LINUX is not set
# BR2_LINUX_KERNEL_EXT_RTAI is not set

#
# Legacy config options
#
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_XSERVER_xorg is not set
# BR2_PACKAGE_XSERVER_tinyx is not set
# BR2_PACKAGE_PTHREAD_STUBS is not set
# BR2_PACKAGE_GETTEXT_STATIC is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_INPUT_TOOLS_EVTEST is not set
= = = = = = = = = = =
elfutils.mk file follows:
= = = = = = = = = = =
#############################################################
#
# elfutils
#
#############################################################
ELFUTILS_VERSION = 0.155
ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
ELFUTILS_SITE = 
https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
ELFUTILS_LICENSE = GPLv3 GPLv2 LGPLv3
ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3

# The tarball does not have a generated configure script
ELFUTILS_AUTORECONF = YES
ELFUTILS_CONF_OPT += --disable-werror
ELFUTILS_PATCH = \
     elfutils-portability.patch \
     elfutils-robustify.patch

ELFUTILS_INSTALL_STAGING = YES

ifeq ($(BR2_LARGEFILE),y)
# elfutils gets confused when lfs mode is forced, so don't
ELFUTILS_CONF_ENV += \
         CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
         CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
endif

ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)

# Unconditionnally requires gettext.
ifeq ($(BR2_NEEDS_GETTEXT),y)
ELFUTILS_DEPENDENCIES += gettext
ELFUTILS_LDFLAGS += -lintl
endif

ELFUTILS_CONF_ENV += \
     LDFLAGS="$(ELFUTILS_LDFLAGS)"

ifeq 
($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
  ELFUTILS_DEPENDENCIES += argp-standalone
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
  ELFUTILS_DEPENDENCIES += zlib
  ELFUTILS_CONF_OPT += --with-zlib
else
  ELFUTILS_CONF_OPT += --without-zlib
endif

ifeq ($(BR2_PACKAGE_BZIP2),y)
  ELFUTILS_DEPENDENCIES += bzip2
  ELFUTILS_CONF_OPT += --with-bzlib
else
  ELFUTILS_CONF_OPT += --without-bzlib
endif

ifeq ($(BR2_PACKAGE_XZ),y)
  ELFUTILS_DEPENDENCIES += xz
  ELFUTILS_CONF_OPT += --with-lzma
else
  ELFUTILS_CONF_OPT += --without-lzma
endif

ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
  ELFUTILS_CONF_OPT += --enable-progs
else
  ELFUTILS_CONF_OPT += --disable-progs
endif

$(eval $(autotools-package))
= = = = = = = = = = = = = = = = = = =

-- Rob Schottland
