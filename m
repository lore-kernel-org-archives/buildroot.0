From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 24 Feb 2016 18:41:56 +0100
Subject: [Buildroot] [PATCH 7/9] olimex_a20_olinuxino_lime: update to
	use genimage
In-Reply-To: <1456187073-2876-8-git-send-email-luca@lucaceresoli.net>
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
 <1456187073-2876-8-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAB0FRsuq96mSUG-GWOM4S59u9tBhMkSAoeoMA8KnKL4ip-xeDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-02-23 1:24 GMT+01:00 Luca Ceresoli <luca@lucaceresoli.net>:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Tested-by: Francois Perrad <fperrad@gmail.com>

> Cc: Francois Perrad <fperrad@gmail.com>
> ---
>  board/olimex/a20_olinuxino/readme.txt            | 2 +-
>  configs/olimex_a20_olinuxino_lime_defconfig      | 2 ++
>  configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
> index feba9daefc6f..18c069e1077e 100644
> --- a/board/olimex/a20_olinuxino/readme.txt
> +++ b/board/olimex/a20_olinuxino/readme.txt
> @@ -52,7 +52,7 @@ After building, you should get a tree like this:
>      +-- rootfs.ext2
>      +-- rootfs.ext4 -> rootfs.ext2
>      +-- script.bin (lime_mali)
> -    +-- sdcard.img (micro)
> +    +-- sdcard.img (micro, lime)
>      +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
>      +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
>      +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> index e6c33c82d907..b2127672d74a 100644
> --- a/configs/olimex_a20_olinuxino_lime_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -12,6 +12,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
>  BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
>
>  # Kernel
> @@ -41,4 +42,5 @@ BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>
>  # Additional tools
> +BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> index ca71b55bcff8..737c690930e1 100644
> --- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
> @@ -12,6 +12,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
>  BR2_TARGET_GENERIC_GETTY=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot-mali.cmd $(TARGET_DIR)/boot"
>
>  # Kernel
> @@ -45,4 +46,5 @@ BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>
>  # Additional tools
> +BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
