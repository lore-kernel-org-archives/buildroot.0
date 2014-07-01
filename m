From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 13:22:01 +0200
Subject: [Buildroot] [PATCH v4] Add support for Congatec QMX6
In-Reply-To: <1404207479-2058-1-git-send-email-sho@relinux.de>
References: <1404207479-2058-1-git-send-email-sho@relinux.de>
Message-ID: <20140701132201.6d72f846@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Tue,  1 Jul 2014 11:37:59 +0200, Stephan Hoffmann wrote:

> diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
> new file mode 100644
> index 0000000..4a83b29
> --- /dev/null
> +++ b/configs/qmx6_defconfig
> @@ -0,0 +1,13 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/congatec/qmx6/post-build.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0_QMX6_R1.1.2"
> +BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_3=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

This looks pretty good to me, but we generally also build U-Boot (or
any other relevant bootloader) as part of the defconfig. Do you think
it's possible to do it for this platform?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
