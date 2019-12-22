From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:06:09 +0100
Subject: [Buildroot] [PATCH 1/2] firmware-imx: Fix the ahab-container
 name
In-Reply-To: <20191217181855.3508-1-festevam@gmail.com>
References: <20191217181855.3508-1-festevam@gmail.com>
Message-ID: <20191222140609.2a163cdd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Dec 2019 15:18:54 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> After the firmware-imx bump to version 8.1.1 the following
> error is observed when building freescale_imx8qxpmek_defconfig:
> 
> >> firmware-imx 8.1.1 Installing to images directory  
> # SECO firmware is needed when generating imx8-boot-sd.bin which
> # is done in post-image script.
> cp /home/fabio/buildroot/output/build/firmware-imx-8.1.1/firmware/seco/ahab-container.img
> /home/fabio/buildroot/output/images/ahab-container.img
> cp: cannot stat
> '/home/fabio/buildroot/output/build/firmware-imx-8.1.1/firmware/seco/ahab-container.img':
> No such file or directory
> 
> In the firmware-imx-8.1.1 (and newer) the i.MX8QXP container image was
> renamed to mx8qx-ahab-container.img, so fix it accordingly.
> 
> Fixes: 3ec818769d51 ("package/freescale-imx/firmware-imx: bump version to 8.1.1")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
