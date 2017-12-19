From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 19 Dec 2017 23:36:43 +0300
Subject: [Buildroot] [PATCH v3] odroidc2: add support for mainline
 kernel and u-boot
In-Reply-To: <20171216135722.12562-1-daggs@gmx.com>
References: <20171216135722.12562-1-daggs@gmx.com>
Message-ID: <20171219203643.yaaec5u7vobq3ipf@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Changes v2 -> v3:
>  - board/hardkernel/odroidc2/odroidc2_mainline_defconfig is not needed because update_arm64_defconfig_with_meson_configs.patch is used.
> 
> Changes v1 -> v2:
>  - handle general mail patch rejects (Thomas)
>  - use BR2_TARGET_UBOOT_BOOT_SCRIPT and BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE instead of script's
>    boot.scr generation (Thomas)
>  - use defconfig in mainline kernel config (Thomas)
>  - add patch of mainline kernel diff instead of complete config and use arch default config (Arnout)
>  - move vendor's ATF handling to a separated patch (Thomas)
>  - add mainline config support for post image script (Thomas)
>  - fixed mainline defconfig rejects (Thomas)
>  - squashed all previous 2-8 patches into one patch (Thomas)

[...]

> +# Required tools to create the SD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MESON_TOOLS=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_ODROIDC2_ATF=y

I don't see neither meson-tools nor odroid2-atf packages in v3.
Am I missing something ?

Regards,
Sergey
