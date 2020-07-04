From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 4 Jul 2020 17:19:38 +0200
Subject: [Buildroot] [PATCH] arm_foundationv8_defconfig: use
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
In-Reply-To: <20200704140909.1584989-1-masahiroy@kernel.org>
References: <20200704140909.1584989-1-masahiroy@kernel.org>
Message-ID: <a40b7fcc-9829-5910-cacc-864c6c0e25cb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Masahiro,

Le 04/07/2020 ? 16:09, Masahiro Yamada a ?crit?:
> Commit 53ced1f6d3da ("linux: allow the selection of the architecture's
> default configuration") allows us to specify the Linux defconfig cleanly.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  configs/arm_foundationv8_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
> index d31f69d3ac..ea19f35502 100644
> --- a/configs/arm_foundationv8_defconfig
> +++ b/configs/arm_foundationv8_defconfig
> @@ -5,8 +5,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"

This kernel version is old, it would be great if it can be updated to the latest
LTS version (5.4.x).

> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(LINUX_DIR)/arch/arm64/configs/defconfig"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8"
>  BR2_TARGET_ROOTFS_EXT2=y
> 

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
