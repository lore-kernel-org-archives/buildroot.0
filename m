From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 00:27:35 +0200
Subject: [Buildroot] [PATCH 3/3] configs/imx7dpico: Add Wifi support
In-Reply-To: <20190609145749.28766-3-offougajoris@gmail.com>
References: <20190609145749.28766-1-offougajoris@gmail.com>
 <20190609145749.28766-3-offougajoris@gmail.com>
Message-ID: <4edcf1af-da47-096a-3dc1-fe2866991d9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 16:57, Joris Offouga wrote:
> imx7dpico has a BCM4339 Wifi chip. Add Wifi support by default
> to allow a better customer experience.

 I wasn't sure if this one depended on the kernel bump to 5.1, so I haven't
applied yet. Also, minor nits below.

[snip]
> diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
> index cd12e282ef..6b1184f672 100644
> --- a/configs/imx7dpico_defconfig
> +++ b/configs/imx7dpico_defconfig
> @@ -28,6 +28,18 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  
> +

 Spurious empty line here.

> +# wifi firmware for brcm43439
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
> +
> +# For automatic firmware loading
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +
> +# wireless packages
> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y

 ... and a missing empty line here.

 With those two things fixed, you can add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Also, don't forget to keep Pierre-Jean's Tested-by tag.

 Regards,
 Arnout

>  # required tools to create the eMMC image
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> 
