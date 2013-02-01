From: Yannick Kiekens <yannickkiekens@gmail.com>
Date: Fri, 1 Feb 2013 22:43:44 +0100
Subject: [Buildroot] crosstool-ng build failure
Message-ID: <CAEyFGJEsYb=iSsOOYQHzjUpgorGjQPSApF_iYksRj-UZhUiCnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following defconfig does not build with current git buildroot:

BR2_x86_pentiumpro=y
BR2_TOOLCHAIN_CTNG=y
BR2_TOOLCHAIN_CTNG_glibc=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.7.config"

This is the qemu defconfig, modified with crosstool-ng glibc, udev & systemd


Crosstool-ng appears to be in an infinite/recursive loop (configure like
output) for a while, then exits with:

[ERROR]
[ERROR]  >>
[ERROR]  >>  Build failed in step 'Installing C library headers & start
files'
[ERROR]  >>        called in step '(top-level)'
[ERROR]  >>
[ERROR]  >>  Error happened in: CT_DoExecLog[scripts/functions at 258]
[ERROR]  >>        called from:
do_libc_backend_once[scripts/build/libc/glibc-eglibc.sh-common at 351]
[ERROR]  >>        called from:
do_libc_backend[scripts/build/libc/glibc-eglibc.sh-common at 143]
[ERROR]  >>        called from:
do_libc_start_files[scripts/build/libc/glibc-eglibc.sh-common at 60]
[ERROR]  >>        called from: main[scripts/crosstool-NG.sh at 609]
[ERROR]  >>
[ERROR]  >>  For more info on this error, look at the file: 'build.log'
[ERROR]  >>  There is a list of known issues, some with workarounds, in:
[ERROR]  >>
 '/home/yannick/test-build/host/usr/share/doc/crosstool-ng/ct-ng.1.17.0/B -
Known issues.txt'
[ERROR]
[ERROR]  (elapsed: 34:05.86)


mvg
Yannick Kiekens
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130201/f4253ee7/attachment.html>
