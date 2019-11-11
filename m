From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:28:14 +0100
Subject: [Buildroot] [PATCH] configs/microchip: addition of the sama5d27
 wlsom1 ek board
In-Reply-To: <1573463816-7843-1-git-send-email-eugen.hristev@microchip.com>
References: <1573463816-7843-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191111162814.4429c59d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Mon, 11 Nov 2019 09:17:14 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add the new SAMA5D27 WLSOM1 Evaluation Kit with linux4sam_6.2 components.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg | 31 +++++++
>  ...ochip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 87 +++++++++++++++++++

Thanks for your contribution. However, we really want a minimal
defconfig next to the "dev" defconfig that you are contributing.

In addition, a new defconfig needs:

 - A readme.txt file in board/atmel/ that explains how to use the
   defconfig on the actual HW.

 - An update to the DEVELOPERS file to reference the newly added
   defconfig and board files.


> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="sama5"

[...]

> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"

You can use a custom tarball like for the kernel above.

> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
> +BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_wlsom1_eksd_uboot"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"

Same here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
