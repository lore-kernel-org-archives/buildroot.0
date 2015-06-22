From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Jun 2015 18:10:48 +0200
Subject: [Buildroot] [V3 1/2] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <1434983952-7662-2-git-send-email-francois.perrad@gadz.org>
References: <1434983952-7662-1-git-send-email-francois.perrad@gadz.org>
 <1434983952-7662-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <55883388.8070604@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois,

Francois Perrad wrote:
> config device tree / mainline (4.0.5)
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   board/olimex/a20_olinuxino_lime/boot.cmd      |  5 ++
>   board/olimex/a20_olinuxino_lime/post-build.sh |  8 +++
>   board/olimex/a20_olinuxino_lime/readme.txt    | 86 +++++++++++++++++++++++++++
>   configs/olimex_a20_olinuxino_lime_defconfig   | 42 +++++++++++++
>   4 files changed, 141 insertions(+)
>   create mode 100644 board/olimex/a20_olinuxino_lime/boot.cmd
>   create mode 100755 board/olimex/a20_olinuxino_lime/post-build.sh
>   create mode 100644 board/olimex/a20_olinuxino_lime/readme.txt
>   create mode 100644 configs/olimex_a20_olinuxino_lime_defconfig
>
> diff --git a/board/olimex/a20_olinuxino_lime/boot.cmd b/board/olimex/a20_olinuxino_lime/boot.cmd
> new file mode 100644
> index 0000000..1714f20
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/boot.cmd
> @@ -0,0 +1,5 @@
> +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
> +ext4load mmc 0 0x49000000 /boot/sun7i-a20-olinuxino-lime.dtb
> +ext4load mmc 0 0x46000000 /boot/zImage
> +env set fdt_high ffffffff
> +bootz 0x46000000 - 0x49000000
> diff --git a/board/olimex/a20_olinuxino_lime/post-build.sh b/board/olimex/a20_olinuxino_lime/post-build.sh
> new file mode 100755
> index 0000000..4e6fbec
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/post-build.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +# args from BR2_ROOTFS_POST_SCRIPT_ARGS
> +# $2    path of boot.cmd
> +# $3    output directory for boot.scr
> +
> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
> +
> +$MKIMAGE -A arm -O linux -T script -C none -d $2 $3/boot.scr
> diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
> new file mode 100644
> index 0000000..3fc9c02
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/readme.txt
> @@ -0,0 +1,86 @@
> +A20-OLinuXino-LIME
> +
> +Intro
> +=====
> +
> +This is a open hardware board,
> +see https://www.olimex.com/Products/OLinuXino/open-source-hardware

No comment about the suggestion I made in the v2 review? Here it is
again:

| Why not a link to the board page itself as well?
| It's https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME/

For the rest it looks good. I hope to grab a Lime board in a few days
to run-time test it... but for the time being:

[Build test only]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
