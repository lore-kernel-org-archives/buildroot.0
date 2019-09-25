From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 23:17:06 +0200
Subject: [Buildroot] [PATCH 1/1] configs/imx6ullevk: add imx6ullevk
 support
In-Reply-To: <20190521204534.27569-1-jeffrey.kinross@i3pd.com>
References: <20190521204534.27569-1-jeffrey.kinross@i3pd.com>
Message-ID: <20190925231706.4a9e92eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeffrey,

Thanks for your contribution, and sorry for the slow feedback. Gilles
already commented that the DEVELOPERS file needs to be updated. But
there is another issue that I can't fix myself. See below.

On Tue, 21 May 2019 15:45:34 -0500
jeffrey.kinross at i3pd.com wrote:

> +# bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx6ullevk"

This option does not exist when BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y.

> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_USE_DEFCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6ull_14x14_evk"
> +BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_NEEDS_DTC=y

But more importantly, we need to have a specific U-Boot version
selected, not just what happens to be the default. Indeed, just like
for the Linux kernel, we want to be sure to rebuild always the same
U-Boot version.

Could you adjust this, and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
