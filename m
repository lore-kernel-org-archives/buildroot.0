From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:54:35 +0200
Subject: [Buildroot] [PATCH] configs: add Armadeus Systems APF6 SOM
 basic support
In-Reply-To: <1460641197-12610-1-git-send-email-julien.boibessot@free.fr>
References: <1460641197-12610-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20160415095435.7ac98177@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Apr 2016 15:39:57 +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> APF6 is an i.MX6 based SOM with an optional Cyclone 5 GX FPGA.
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  configs/armadeus_apf6_defconfig | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 configs/armadeus_apf6_defconfig
> 
> diff --git a/configs/armadeus_apf6_defconfig b/configs/armadeus_apf6_defconfig
> new file mode 100644
> index 0000000..a51dd5f
> --- /dev/null
> +++ b/configs/armadeus_apf6_defconfig
> @@ -0,0 +1,27 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_VFPV3=y
> +
> +# Linux headers same as kernel, a 3.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="apf6"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.8"
> +BR2_LINUX_KERNEL_PATCH="http://sourceforge.net/projects/armadeus/files/armadeus/armadeus-6.0/patches/linux-3.19-armadeus.patch.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apf6dev imx6dl-apf6dev"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y

Is it expected that you're not building any bootloader here?

Also, this needs a readme.txt to explain how to use this defconfig. If
you're putting off SD card, then please use genimage to generate a
complete SD card image. If you're booting out of NAND, please include
instructions on how to flash the resulting system.

But does it make sense to have a defconfig for a SOM ? A SOM as-is
generally can't be booted, it needs to be put on some base-board,
right ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
