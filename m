From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:34:07 +0200
Subject: [Buildroot] [PATCH] support/check-bin-arch: ignore /usr/lib/grub
In-Reply-To: <20190507124345.6424-1-alex_y_xu@yahoo.ca>
References: <20190507124345.6424-1-alex_y_xu@yahoo.ca>
Message-ID: <20190520223407.7a50763f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

Thanks for your contribution!

On Tue,  7 May 2019 08:43:45 -0400
"Alex Xu (Hello71)" <alex_y_xu@yahoo.ca> wrote:

> /lib/grub is already ignored, so add /usr/lib/grub to support
> BR2_ROOTFS_MERGED_USR.
> 
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
> ---
>  support/scripts/check-bin-arch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> index 66b8d89932..0c6ce83b4f 100755
> --- a/support/scripts/check-bin-arch
> +++ b/support/scripts/check-bin-arch
> @@ -24,6 +24,7 @@ declare -a IGNORES=(
>  	# Skip files in /lib/grub, since it is possible to have it
>  	# for a different architecture (e.g. i386 grub on x86_64).
>  	"/lib/grub"
> +	"/usr/lib/grub"

I have updated the comment right above, and applied your patch to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
