From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 17:19:56 +0200
Subject: [Buildroot] [PATCH v3 4/5]
 configs/orangepi_zero_plus2_defconfig: switch to mainline TF-A
In-Reply-To: <20210625193318.635449-5-geomatsi@gmail.com>
References: <20210625193318.635449-1-geomatsi@gmail.com>
 <20210625193318.635449-5-geomatsi@gmail.com>
Message-ID: <20210626151956.GL104638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-06-25 22:33 +0300, Sergey Matyukevich spake thusly:
> Switch to mainline TF-A that provides basic support for H5 and A64.
> Note that Allwinner platform layer in TF-A does not provide support
> for GCC stack protection, so make sure to disable this TF-A feature.

Actually, this was not needed at all, because the toolchain used by this
defconfig does not support SSP to begin with. So I dropped both this
part of the commit log, and the option (which was renamed anyway).

Applied to master, with the above changes, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  configs/orangepi_zero_plus2_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
> index aa4c5c9413..203d86e7fc 100644
> --- a/configs/orangepi_zero_plus2_defconfig
> +++ b/configs/orangepi_zero_plus2_defconfig
> @@ -8,10 +8,10 @@ BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
>  
>  # Firmware
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_NONE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>  
>  # Bootloader
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
