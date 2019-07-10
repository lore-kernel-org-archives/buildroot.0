From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jul 2019 22:23:15 +0200
Subject: [Buildroot] [PATCH] board/freescale: Fix wrong config for
 u-boot.img
In-Reply-To: <20190710051702.9481-1-offougajoris@gmail.com>
References: <20190710051702.9481-1-offougajoris@gmail.com>
Message-ID: <f9d3f91e-6743-b24b-4778-f0c8a1ce64b9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2019 07:17, Joris Offouga wrote:
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>  board/freescale/common/imx/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
> index ab51dc2098..19d8fffb63 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -68,7 +68,7 @@ uboot_image()
>  		echo "u-boot.imx"
>  	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
>  	    echo "u-boot-dtb.img"
> -	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
> +	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" ${BR2_CONFIG}; then

 Gah, I had made exactly this fix before applying to master, I had even updated
the commit message, but somehow the fix got lost...

 Thanks for handling it!

 Applied to master, thanks.

 Regards,
 Arnout


>  	    echo "u-boot.img"
>  	fi
>  }
> 
