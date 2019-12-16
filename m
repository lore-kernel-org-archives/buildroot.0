From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 10:47:01 +0100
Subject: [Buildroot] [PATCH v3] configs/atmel: update u-boot-at91 and
 bootstrap to tarballs
In-Reply-To: <1575459437-7302-1-git-send-email-eugen.hristev@microchip.com>
References: <1575459437-7302-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191216104701.0f3af055@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Wed, 4 Dec 2019 11:37:47 +0000
<Eugen.Hristev@microchip.com> wrote:

> diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> index 1d16708..0653ae8 100644
> --- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> @@ -70,15 +70,13 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  BR2_TARGET_AT91BOOTSTRAP3=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="(call github,linux4sam,at91bootstrap,v3.9.0)/at91bootstrap-v3.9.0.tar.gz"

In fact, there is no option BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL,
so this simply doesn't work.

I see two options:

 (1) Revert back to downloading from Git

 (2) Add support for the custom tarball option in
     at91bootstrap3/Config.in and at91bootstrap3/at91bootstrap3.mk.

I think option (2) is the most appropriate, since we have this custom
tarball option for Linux, U-Boot, etc. already.

Could you take care of implementing this option, or should we do it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
