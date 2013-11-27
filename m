From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Wed, 27 Nov 2013 15:28:12 +0000
Subject: [Buildroot] libglib2 (or maybe libffi) build failure
Message-ID: <52960F8C.5040003@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the latest git top-of-tree, libglib2 fails to compile as follows:-

$ git pull
Already up-to-date.
$ make
...
>>> libffi 3.0.13 Extracting
...
>>> libffi 3.0.13 Patching
...
>>> libffi 3.0.13 Updating config.sub and config.guess
...
>>> libffi 3.0.13 Patching libtool
>>> libffi 3.0.13 Autoreconfiguring
...
>>> libffi 3.0.13 Configuring
...
>>> libffi 3.0.13 Building
...
>>> libffi 3.0.13 Installing to staging directory
...
>>> libffi 3.0.13 Installing to target
...
>>> libglib2 2.36.3 Autoreconfiguring
...
>>> libglib2 2.36.3 Configuring
...
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for LIBFFI... no
configure: error: Package requirements (libffi >= 3.0.0) were not met:

Package libffi was not found in the pkg-config search path.
Perhaps you should add the directory containing `libffi.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libffi' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables LIBFFI_CFLAGS
and LIBFFI_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: *** [/home/mpfj/buildroot-bt/output/build/libglib2-2.36.3/.stamp_configured] Error 1
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for LIBFFI... no
configure: error: Package requirements (libffi >= 3.0.0) were not met:

Package libffi was not found in the pkg-config search path.
Perhaps you should add the directory containing `libffi.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libffi' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables LIBFFI_CFLAGS
and LIBFFI_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: *** [/home/mpfj/buildroot-bt/output/build/libglib2-2.36.3/.stamp_configured] Error 1

Any clues ?

Below is my "defconfig" as created by 'make savedefconfig'.

Cheers
Mark J.
---
BR2_arm=y
BR2_cortex_a8=y
BR2_JLEVEL=8
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_BINUTILS_VERSION_2_23_2=y
BR2_GCC_VERSION_4_8_X=y
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-fpu=vfpv3 --with-float=hard"
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="nanobone"
BR2_TARGET_GENERIC_ROOT_PASSWD="rmfMPVaGP3nnjWUV"
BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
BR2_ROOTFS_OVERLAY="board/newflow/nanobone/skeleton"
BR2_PACKAGE_BUSYBOX_CONFIG="board/newflow/nanobone/busybox-1.21.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_BIN=y
BR2_PACKAGE_LIBESMTP=y
BR2_PACKAGE_LIBFCGI=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_BLUEZ_UTILS=y
BR2_PACKAGE_BLUEZ_UTILS_COMPAT=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS=y
BR2_PACKAGE_IW=y
BR2_PACKAGE_LIGHTTPD=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_SNTP=y
# BR2_PACKAGE_NTP_NTPD is not set
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1ff80
BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=464
BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
