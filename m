From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 4 Dec 2017 09:55:53 +0530
Subject: [Buildroot] [PATCH 3/3] orangepi-pc-plus: enable WiFi support
In-Reply-To: <20171108194334.10031-4-geomatsi@gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
 <20171108194334.10031-4-geomatsi@gmail.com>
Message-ID: <CAMty3ZApVQOY6TbyD3-p=teHpB1TKZWzQymB4-B0owVEzwBD+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 9, 2017 at 1:13 AM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
> Make WiFi work out of the box on orangepi-pc-plus:
>   - add rtl8xx firmware
>   - add rtl8189fs driver
>   - add mdev for module autoloading
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  configs/orangepi_pc_plus_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
> index ec177286cc..b06b9b1005 100644
> --- a/configs/orangepi_pc_plus_defconfig
> +++ b/configs/orangepi_pc_plus_defconfig
> @@ -1,6 +1,7 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_VFPV4=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
>  BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
> @@ -29,6 +30,11 @@ BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>
> +# wireless driver and firmware
> +BR2_PACKAGE_RTL8189FS=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
> +

I'm trying to understand here about minimal defconfig vs custom
selection of packages, like adding qt5 on this patch[1]. Does wifi
here not considered as custom config? if ie true if should be
orangepi_pc_plus_wif_defconfig?

[1] https://patchwork.ozlabs.org/patch/839237/

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
