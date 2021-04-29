From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Thu, 29 Apr 2021 08:20:29 +0000
Subject: [Buildroot] [PATCH 1/1] package/imx-seco: use the c0 revision
 for the imx8qxp ahab image
In-Reply-To: <20210428034036.15461-1-charles.hardin@chargepoint.com>
References: <20210428034036.15461-1-charles.hardin@chargepoint.com>
Message-ID: <AM0PR04MB69469D00A286B8447B4D49DFA75F9@AM0PR04MB6946.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>The silicon revision for the imx8 is C0 and this is the release
>candidate for the new update images. It also seems to work on
>some B0 early silicon in addition, so change the ahab container
>to use mx8qxc0-ahab-container.img

The C0 firmware cannot be executed along with the B0 ROM for a couple
of reasons (different function address map and lacking features).

Warning:
Once we make the switch to mx8qxc0-ahab-container, all boards based
on a B0 silicon version won't boot anymore!

>
>Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>

[Stephane: tested on i.MX8 QXP EVK Rev C]
Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>

BR,
Stephane.

>---
> package/freescale-imx/imx-seco/imx-seco.mk | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
>index 245c3e3311..711315ea93 100644
>--- a/package/freescale-imx/imx-seco/imx-seco.mk
>+++ b/package/freescale-imx/imx-seco/imx-seco.mk
>@@ -22,7 +22,7 @@ IMX_SECO_INSTALL_IMAGES = YES
> # is done in post-image script.
> ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
> define IMX_SECO_INSTALL_IMAGES_CMDS
>-       cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
>+       cp $(@D)/firmware/seco/mx8qxc0-ahab-container.img \
>                 $(BINARIES_DIR)/ahab-container.img
> endef
> else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
>--
>2.21.1 (Apple Git-122.3)
>
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
>
>
