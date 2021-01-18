From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 18 Jan 2021 09:00:03 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: remove imx sdma
 firmware
In-Reply-To: <20210117133119.73546-1-romain.naour@gmail.com>
References: <20210117133119.73546-1-romain.naour@gmail.com>
Message-ID: <YAVAA4aR93t80jKJ@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, Jan 17, 2021 at 02:31:19PM +0100, Romain Naour wrote:
> As reported on the mailing list [1], the imx sdma firmwares for
> imx[6,7,8] are provided by two packages: firmware-imx and
> linux-firmware
> 
> $ sha256sum ./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin
> 7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
> ./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin
> 
> $ sha256sum  ./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin
> 7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
> ./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin
> 
> Keep firmware-imx as the only imx sdma firmware provider.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-January/300938.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stephane Viau <stephane.viau@oss.nxp.com>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  Config.in.legacy                         | 8 ++++++++
>  package/linux-firmware/Config.in         | 9 ---------
>  package/linux-firmware/linux-firmware.mk | 6 ------
>  3 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3c022d21d7..a322d18cb3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>  
>  comment "Legacy options removed in 2021.02"
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
> +	bool "imx sdma firmware is provided by firmware-imx"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_FIRMWARE_IMX

I know it's too late as Yann already merged that commit, but I believe
the above is wrong. You can't select this option unless
BR2_PACKAGE_FREESCALE_IMX is also defined.

Regards,
Gary
