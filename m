From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 3 Sep 2018 16:43:30 +0200
Subject: [Buildroot] [PATCH 4/4] configs: bpi-m64: bump linux, uboot
In-Reply-To: <1535963172-6664-4-git-send-email-jagan@amarulasolutions.com>
References: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
 <1535963172-6664-4-git-send-email-jagan@amarulasolutions.com>
Message-ID: <d1f2efbe-c686-a13e-6efb-788c8a859bab@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On 03/09/2018 10:26, Jagan Teki wrote:
> - Uboot to 2017.15
> - Linux to 4.17
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  configs/bananapi_m64_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
> index db39903..b071230 100644
> --- a/configs/bananapi_m64_defconfig
> +++ b/configs/bananapi_m64_defconfig
> @@ -2,8 +2,8 @@ BR2_aarch64=y
>  BR2_cortex_a53=y
>  BR2_ARM_FPU_VFPV4=y
>  
> -# Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +# Linux headers same as kernel, a 4.17 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
>  
>  # Firmware
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> @@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.15"

I don't think version 2017.15 really exists. I tested, just in case, and
got a 404.

Also, out of personal taste, I would put the whole defconfig name in the
patch subject, to be more grep-friendly:

- [PATCH 4/4] configs: bpi-m64: bump linux, uboot
+ [PATCH 4/4] configs: bananapi_m64: bump linux, uboot

Regards,
-- 
Luca
