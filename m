From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 28 Oct 2012 18:16:36 +0100
Subject: [Buildroot] Load Address and EntryPoint for Kernel
In-Reply-To: <20121028174310.34c4f029@skate>
References: <508D5B55.1070401@googlemail.com> <20121028174310.34c4f029@skate>
Message-ID: <508D6874.609@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 28.10.2012 17:43, schrieb Thomas Petazzoni:
> Most likely your kernel configuration is wrong.

Hopefully I have taken the complete one from the original ... :/
This complete git repo can be found here.
http://git.coolstreamtech.de/?p=cst-public-linux-kernel.git;a=shortlog;h=refs/heads/2.6.34.13-cnxt

The related kernel patches I placed under
board/coolstream/hdx/kernel-2.6.34-patches
The config right in board/coolstream/hdx/kernel2.6.34.13.config

> Please post your Buildroot .config and kernel .config file and more
> details about what your hardware platform is.

The platform is a ARMv6 based Settopbox with a SoC from Nexperia
(cx2450). There are closed kernel modules that have to be used, so most
parts of the kernel config depended on this, but some options are
configurable without to recompile this closed source parts.

I configured BR to build a GCC 4.7.1 with crosstool-ng, after some fine
tuning this works.

My BR config looks like this.
> carsten at wheezy:~/gitprojects/buildroot [arm] $ cat configs/cst_hdx_2.6.34.13_defconfig 
> BR2_arm=y
> BR2_CCACHE=y
> BR2_TOOLCHAIN_CTNG=y
> BR2_TOOLCHAIN_CTNG_eglibc=y
> BR2_TOOLCHAIN_CTNG_CONFIG="board/coolstream/hdx/ct_ng_config"
> BR2_TOOLCHAIN_CTNG_CXX=y
> BR2_PACKAGE_BUSYBOX_CONFIG="board/coolstream/hdx/busybox-1.20.2.config"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_AUTOMAKE=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BOARDNAME="coolstream_hdx"
> BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://ftp.denx.de/pub/u-boot/u-boot-2009.03.tar.bz2"
> BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/coolstream/hdx/u-boot"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://www.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.34/linux-2.6.34.13.tar.bz2"
> BR2_LINUX_KERNEL_PATCH="board/coolstream/hdx/linux-2.6.34-patches"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/coolstream/hdx/kernel-2.6.34.13.config"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y

The kernel config is appended.

If something is missing then just let me know.

Thanks in advice!

Carsten
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-2.6.34.13.config.gz
Type: application/x-gzip
Size: 10764 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121028/cbca394a/attachment-0001.bin>
