From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 23:10:24 +0100
Subject: [Buildroot] [PATCH 1/2] board: add support for ARC AXS101
 Software Development Platform
In-Reply-To: <1415290705-994-2-git-send-email-abrodkin@synopsys.com>
References: <1415290705-994-1-git-send-email-abrodkin@synopsys.com>
 <1415290705-994-2-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150114231024.407505b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu,  6 Nov 2014 19:18:24 +0300, Alexey Brodkin wrote:
> The AXS101 Platform consists of a DesignWare AXC001 CPU
> Card (with ARC 770D core) mounted on an
> ARC Software Development Platform Mainboard with DesignWare peripherals:
>  * SD/MMC contoller
>  * Gigabit network contoller
>  * Serial ports (8250-compatible)
>  * USB 2.0
>  * SPI
>  * I2C
> 
> It also houses HDMI output for extrenal monitor connection.

external

> diff --git a/configs/axs101_defconfig b/configs/axs101_defconfig
> new file mode 100644
> index 0000000..c1c537c
> --- /dev/null
> +++ b/configs/axs101_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arcle=y
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> +BR2_PTHREAD_DEBUG=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

We normally don't enable such features in defconfig files, and keep the
toolchain config minimal.

> +BR2_PACKAGE_HOST_GDB=y

Same.

> +BR2_TARGET_GENERIC_HOSTNAME="axs101"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to the AXS101 Software Development Platform"
> +BR2_INIT_SYSV=y

Ditto, please stick with Busybox.

> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS3"
> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set

Please stick to the default here as well.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/foss-for-synopsys-dwc-arc-processors/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="arc-3.15"

This is a branch name, which means the build is not reproducible.
Please using either a tag, or a full commit ID.

> +BR2_LINUX_KERNEL_DEFCONFIG="axs101"
> +BR2_PACKAGE_GDB=y
> +BR2_PACKAGE_I2C_TOOLS=y
> +BR2_PACKAGE_USBUTILS=y
> +BR2_PACKAGE_LIBUSB_COMPAT=y
> +BR2_PACKAGE_LMBENCH=y
> +BR2_PACKAGE_LTP_TESTSUITE=y

Please disable these tools, and keep the defconfig minimal, thanks!

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="axs101"

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
