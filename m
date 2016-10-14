From: Adam Baxter <voltagex@voltagex.org>
Date: Fri, 14 Oct 2016 14:24:58 +1100
Subject: [Buildroot] GDB is not built for target,
	even with BR2_PACKAGE_GDB_DEBUGGER=y set
Message-ID: <CAChFQ9RYSsBMyHoqmw5m7zhQ8kHN_JDhnsbthuLOG+er9joHrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
gdb is not being built for my target. The following defconfig was created
by doing the following:

make qemu_x86_64_defconfig
make menuconfig
*enabled all required options for gdb*
make savedefconfig BR2_DEFCONFIG=test_defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_SYSTEM_DHCP="eth0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_GDB_TUI=y
BR2_TARGET_ROOTFS_CPIO_GZIP=y
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_MKE2IMG=y

The image builds correctly and runs in qemu, but there's no sign of gdb
anywhere.

Thanks,
Adam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161014/ad23c688/attachment.html>
