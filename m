From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 19 Feb 2018 11:12:39 +0100
Subject: [Buildroot] [PATCH 3/3] add support for iMX8MQ-evk board
In-Reply-To: <1518960511-4823-4-git-send-email-karl.erik.larsson@gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-4-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180219101239.GC10694@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 18, 2018 at 02:28:31PM +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Ask Christopher if he want to be stated here as well.

> ---
> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
> index b239743..e3082a3 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -7,10 +7,10 @@
>  #
>  dtb_list()
>  {
> -	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
> +	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"

Just a thought.. is ${BR2_LINUX_KERNEL_INTREE_DTS_NAME} available in
postscripts?
It would be nice if we could avoid this sed magic.

I'm not in an environment that I can check this by myself.

>  
>  	for dt in $DTB_LIST; do
> -		echo -n "\"$dt.dtb\", "
> +		echo -n "\"`basename $dt`.dtb\", "
>  	done
>  }

Best regards
Marcus Folkesson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/4d67c64f/attachment.asc>
