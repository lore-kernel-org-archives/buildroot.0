From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 14 Dec 2020 23:28:24 +0100
Subject: [Buildroot] [PATCH v4 5/8] board/freescale/common/imx: Add
 Support for uboot 'flash.bin' image
In-Reply-To: <20201125183017.15585-6-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-6-xroumegue@gmail.com>
Message-ID: <CAEyMn7YjnYAGP9URaQRKbgDiqSA0BsoF2mgE08SogGRboG3tBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

Am Mi., 25. Nov. 2020 um 19:32 Uhr schrieb Xavier Roumegue
<xroumegue@gmail.com>:
>
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  board/freescale/common/imx/post-image.sh | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
> index 06ccaac3a4..1cca1849be 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -70,6 +70,8 @@ uboot_image()
>                 echo "u-boot-dtb.imx"
>         elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
>                 echo "u-boot.imx"
> +       elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX_FIT=y$" ${BR2_CONFIG}; then
> +               echo "flash.bin"
>         elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
>             echo "u-boot-dtb.img"
>         elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" ${BR2_CONFIG}; then

-- 
Heiko
