From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 19:48:01 +0200
Subject: [Buildroot] [PATCH] synopsys/hsdk: Boot log cleanup
In-Reply-To: <20180820173938.23761-1-Evgeniy.Didin@synopsys.com>
References: <20180820173938.23761-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180820194801.6cbb1bc8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 20:39:38 +0300, Evgeniy Didin wrote:
> Remove duplicate messages in boot log on HSDK board.
> Console ttyS3 is already set in Linux bootargs.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  board/synopsys/hsdk/uboot.env.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/synopsys/hsdk/uboot.env.txt b/board/synopsys/hsdk/uboot.env.txt
> index 6bcfb56a77..216f0c9043 100644
> --- a/board/synopsys/hsdk/uboot.env.txt
> +++ b/board/synopsys/hsdk/uboot.env.txt
> @@ -1,5 +1,5 @@
>  baudrate=115200
> -bootargs=console=ttyS3,115200n8 root=/dev/mmcblk0p2 rootwait
> +bootargs=root=/dev/mmcblk0p2 rootwait

Well, *these* are the Linux bootargs.

Do you mean that something else is re-adding "console=ttyS3" to the
bootargs ?

Could you clarify ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
