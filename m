From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 30 Jun 2015 07:12:33 +0200
Subject: [Buildroot] [PATCH 4/4] configs/olimex_a20_olinuxino_micro: new
	board
In-Reply-To: <1435615523-21039-4-git-send-email-luca@lucaceresoli.net>
References: <1435615523-21039-1-git-send-email-luca@lucaceresoli.net>
 <1435615523-21039-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAB0FRssX3DheAt5K6GHq-jHr7=8FFw6SOirT59v5EcikjEDcZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-30 0:05 GMT+02:00 Luca Ceresoli <luca@lucaceresoli.net>:
> Add a defconfig for the Olimex A20-OLinuXino-Micro board, reusing most
> of the A20-OLinuXino-Lime files.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  board/olimex/a20_olinuxino/readme.txt        | 31 +++++++++++++------
>  configs/olimex_a20_olinuxino_micro_defconfig | 46 ++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 10 deletions(-)
>  create mode 100644 configs/olimex_a20_olinuxino_micro_defconfig
>
> diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
> index 6b8391484b92..101adcf6abbd 100644
> --- a/board/olimex/a20_olinuxino/readme.txt
> +++ b/board/olimex/a20_olinuxino/readme.txt
> @@ -1,10 +1,22 @@
> -A20-OLinuXino-LIME
> +A20-OLinuXino-LIME and A20-OLinuXino-MICRO
>
>  Intro
>  =====
>
> -This is a open hardware board,
> -see https://www.olimex.com/Products/OLinuXino/open-source-hardware
> +These are open hardware boards, both based an the AllWinners A20 SoC.
> +
> +for more details about the boards see the following pages:
> + - https://www.olimex.com/Products/OLinuXino/open-source-hardware
> + - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/
> + - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME/
> +
> +The following defconfigs are available:
> + - olimex_a20_olinuxino_micro_defconfig
> +   for the A20-OLinuXino-MICRO board using mainline kernel and U-Boot
> + - olimex_a20_olinuxino_lime_defconfig
> +   for the A20-OLinuXino-LIME board using mainline kernel and U-Boot
> + - olimex_a20_olinuxino_lime_mali_defconfig
> +   for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel and U-Boot
>

The reference to U-Boot seems useless.

Fran?ois

>  The legacy linux-sunxi kernels are based on the vendor code drops.
>  They are only useful when accelerated 3D graphics and multimedia support
> @@ -20,11 +32,9 @@ the users who do not need fancy 3D graphics or video playback acceleration.
>  How to build it
>  ===============
>
> -    $ make olimex_a20_olinuxino_lime_defconfig
> -
> -or
> +Configure Buildroot:
>
> -    $ make olimex_a20_olinuxino_lime_mali_defconfig
> +    $ make <board>_defconfig
>
>  Compile everything and build the rootfs image:
>
> @@ -38,8 +48,9 @@ After building, you should get a tree like this:
>      output/images/
>      +-- rootfs.ext2
>      +-- rootfs.ext4 -> rootfs.ext2
> -    +-- script.bin (mali)
> -    +-- sun7i-a20-olinuxino-lime.dtb (mainline)
> +    +-- script.bin (lime_mali)
> +    +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
> +    +-- sun7i-a20-olinuxino-micro.dtb (micro, mainline)
>      +-- u-boot.bin
>      +-- u-boot-sunxi-with-spl.bin
>      `-- zImage
> @@ -98,5 +109,5 @@ Copy images on the SD card
>  Finish
>  ======
>
> -Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
> +Eject the SD card, insert it in the A20-OLinuXino board, and power it up.
>
