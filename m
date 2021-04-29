From: Charles Hardin <ckhardin@gmail.com>
Date: Thu, 29 Apr 2021 08:05:57 -0700
Subject: [Buildroot] [PATCH 1/1] package/imx-seco: use the c0 revision
 for the imx8qxp ahab image
In-Reply-To: <AM0PR04MB69469D00A286B8447B4D49DFA75F9@AM0PR04MB6946.eurprd04.prod.outlook.com>
References: <20210428034036.15461-1-charles.hardin@chargepoint.com>
 <AM0PR04MB69469D00A286B8447B4D49DFA75F9@AM0PR04MB6946.eurprd04.prod.outlook.com>
Message-ID: <CAN=fXj2O14E_PGo++gDjMW=7NWtEf_dxSqZq-n62Nx09kPwrjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 1:20 AM Stephane Viau (OSS) <
stephane.viau@oss.nxp.com> wrote:

> >
> >The silicon revision for the imx8 is C0 and this is the release
> >candidate for the new update images. It also seems to work on
> >some B0 early silicon in addition, so change the ahab container
> >to use mx8qxc0-ahab-container.img
>
> The C0 firmware cannot be executed along with the B0 ROM for a couple
> of reasons (different function address map and lacking features).
>
> Warning:
> Once we make the switch to mx8qxc0-ahab-container, all boards based
> on a B0 silicon version won't boot anymore!
>
>
That's how I found this - I had a C0 ROM and that doesn't boot with the b0
ahab,
so it needs to be setup to go one way or the other. I think C0 is the
production
GA release from NXP, so this is out there for people as needed that have
that
problem.

This was from the u-boot


    CPU:   Freescale i.MX8QXP revC A35 at 1200 MHz at 34C


> >
> >Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>
>
> [Stephane: tested on i.MX8 QXP EVK Rev C]
> Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
>
> BR,
> Stephane.
>
> >---
> > package/freescale-imx/imx-seco/imx-seco.mk | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/package/freescale-imx/imx-seco/imx-seco.mk
> b/package/freescale-imx/imx-seco/imx-seco.mk
> >index 245c3e3311..711315ea93 100644
> >--- a/package/freescale-imx/imx-seco/imx-seco.mk
> >+++ b/package/freescale-imx/imx-seco/imx-seco.mk
> >@@ -22,7 +22,7 @@ IMX_SECO_INSTALL_IMAGES = YES
> > # is done in post-image script.
> > ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
> > define IMX_SECO_INSTALL_IMAGES_CMDS
> >-       cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
> >+       cp $(@D)/firmware/seco/mx8qxc0-ahab-container.img \
> >                 $(BINARIES_DIR)/ahab-container.img
> > endef
> > else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
> >--
> >2.21.1 (Apple Git-122.3)
> >
> >_______________________________________________
> >buildroot mailing list
> >buildroot at busybox.net
> >http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210429/52024a6d/attachment.html>
