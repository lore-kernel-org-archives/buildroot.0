From: brianclements <brian@brianclements.net>
Date: Thu, 1 May 2014 23:14:11 -0700 (PDT)
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <CAAXf6LWEukHG4+BX7WzsxbXYjUahxNW8A2rNk37agJBgyNS0MQ@mail.gmail.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
 <1396897179003-67022.post@n4.nabble.com>
 <CAAXf6LUM+sLYvcGFEBEaXXfpHRDVaED1W1cM87pg3De6ynLWTw@mail.gmail.com>
 <1398968712814-68658.post@n4.nabble.com>
 <3e06667e-ebb4-4571-9f34-dd559a37fb0e@email.android.com>
 <1398975999806-68677.post@n4.nabble.com>
 <CAAXf6LWEukHG4+BX7WzsxbXYjUahxNW8A2rNk37agJBgyNS0MQ@mail.gmail.com>
Message-ID: <1399011251516-68708.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 1, 2014 at 10:26 PM, brianclements &lt;brian@&gt; wrote:
[..]
>
>>In the menuconfig, in the toolchain menu, you can specify the toolchain
>> type. It is set to 'Buildroot' by >default, but you can specify
>> 'external'
>> here. I then used the default proposed toolchain (Sourcery)
>>
>> So I've found the fix. Selecting the external toolchain "Sourcery" (and
>> WOW
>> is it much faster) with my other selections same as before of x86_64 and
>> git, was all I needed to get git to work. So I know what I need to do now
>> to
>> get it to work for my uses. But I'm sure that still means there is a bug
>> somewhere in the buildroot toolchain. I'm not sure how to go about
>> finding
>> it for you, but I'd be more then happy to test and reproduce things along
>> the way for you if you desire. Let me know,

>Could you send me the buildroot config you were using before?
>I will build the exact same config this time and see if I can reproduce on
qemu.

I wasn't sure which you wanted, so I included both. Both were created with
the command `make menuconfig` and this is with comments and whitespace
removed.

First the old config that broke git which I think is what you meant:

BR2_HAVE_DOT_CONFIG=y
BR2_ARCH_IS_64=y
BR2_x86_64=y
BR2_ARCH="x86_64"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="generic"
BR2_x86_generic=y
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
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=0
BR2_STRIP_strip=y
BR2_STRIP_EXCLUDE_FILES=""
BR2_STRIP_EXCLUDE_DIRS=""
BR2_OPTIMIZE_S=y
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"
BR2_GLOBAL_PATCH_DIR=""
BR2_TOOLCHAIN_USES_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_KERNEL_HEADERS_3_10=y
BR2_DEFAULT_KERNEL_HEADERS="3.10.10"
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
BR2_UCLIBC_VERSION_0_9_33=y
BR2_UCLIBC_VERSION_STRING="0.9.33.2"
BR2_UCLIBC_CONFIG="package/uclibc/uClibc-0.9.33.config"
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS_NATIVE=y
BR2_UCLIBC_INSTALL_UTILS=y
BR2_UCLIBC_TARGET_ARCH="x86_64"
BR2_BINUTILS_VERSION_2_21_1=y
BR2_BINUTILS_VERSION="2.21.1"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
BR2_GCC_NEEDS_MPC=y
BR2_GCC_VERSION_4_7_X=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.7.3"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_ENABLE_TLS=y
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_USE_WCHAR=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_GENERATE_LOCALE=""
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
BR2_TARGET_GENERIC_PASSWD_MD5=y
BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
BR2_ROOTFS_DEVICE_CREATION_STATIC=y
BR2_INIT_BUSYBOX=y
BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="system/device_table_dev.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_GENERIC_ROOT_PASSWD=""
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_GETTY_TERM="vt100"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_OVERLAY=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_POST_IMAGE_SCRIPT=""
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_21_X=y
BR2_BUSYBOX_VERSION="1.21.1"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.21.x.config"
BR2_PACKAGE_GIT=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_LIBICONV=y
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
BR2_TARGET_ROOTFS_TAR_OPTIONS=""


And my new and working config (note: on ubuntu, I needed to install the
32bits glibc package, "libc6-i386" before building)

BR2_HAVE_DOT_CONFIG=y
BR2_HOSTARCH_NEEDS_IA32_LIBS=y
BR2_ARCH_IS_64=y
BR2_x86_64=y
BR2_ARCH="x86_64"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="generic"
BR2_x86_generic=y
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
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=0
BR2_STRIP_strip=y
BR2_STRIP_EXCLUDE_FILES=""
BR2_STRIP_EXCLUDE_DIRS=""
BR2_OPTIMIZE_S=y
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"
BR2_GLOBAL_PATCH_DIR=""
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_PREFIX="i686-pc-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_TOOLCHAIN_HAS_NATIVE_RPC=y
BR2_USE_WCHAR=y
BR2_ENABLE_LOCALE=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_GENERATE_LOCALE=""
BR2_USE_MMU=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
BR2_TARGET_GENERIC_PASSWD_MD5=y
BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
BR2_ROOTFS_DEVICE_CREATION_STATIC=y
BR2_INIT_BUSYBOX=y
BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="system/device_table_dev.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_GENERIC_ROOT_PASSWD=""
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_GETTY_TERM="vt100"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_OVERLAY=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_POST_IMAGE_SCRIPT=""
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_21_X=y
BR2_BUSYBOX_VERSION="1.21.1"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.21.x.config"
BR2_PACKAGE_GIT=y
BR2_PACKAGE_ZLIB=y
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
BR2_TARGET_ROOTFS_TAR_OPTIONS=""


_______________________________________________
buildroot mailing list
buildroot@
http://lists.busybox.net/mailman/listinfo/buildroot





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-7016-New-Git-issues-in-resulting-buildroot-tar-tp66457p68708.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
