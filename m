From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2020 21:25:47 +0200
Subject: [Buildroot] [PATCH 1/2] defconfigs: use
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_
In-Reply-To: <20201007132052.29560-1-matthew.weber@rockwellcollins.com>
References: <20201007132052.29560-1-matthew.weber@rockwellcollins.com>
Message-ID: <fa555322-e273-94ff-0f36-b22e579eaeb1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2020 15:20, Matt Weber wrote:
> --- a/configs/bananapi_m1_defconfig
> +++ b/configs/bananapi_m1_defconfig
> @@ -21,8 +21,9 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> -BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

 Just appending it at the end is not so nice (especially for the defconfigs that
are manually formatted). So I've moved it to just before the existing location,
with a few exceptions. This is the addition to the commit message:

    Add BR2_PACKAGE_HOST_UBOOT_TOOLS=y just before the existing
    BR2_TARGET_UBOOT_BOOT_SCRIPT option. Note that for the defconfigs that
    are not manually formatted (i.e. just the result of 'make
    savedefconfig'), this puts them in the wrong place. However, it's easier
    this way, and it's more consistent in general to have the definition of
    the script close to BR2_TARGET_UBOOT itself.

    Special cases:
    - nanopi_* had the definition of the _SCRIPT variable in a weird place.
      These are moved to close to BR2_TARGET_UBOOT.
    - Same for orangepi_plus.
    - orangpi_pc_* already had BR2_PACKAGE_HOST_UBOOT_TOOLS=y so it's not
      added there.

 Applied with those changes, thanks.

 Regards,
 Arnout
