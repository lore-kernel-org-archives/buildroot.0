From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 09:34:13 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 7/9] package/rcw: Enable IIC5_PMUX
 and CLK_OUT_PMUX for GPIO
In-Reply-To: <20191120101451.34bd8120@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-8-jerry.huang@nxp.com>
 <20191120101451.34bd8120@windsurf.home>
Message-ID: <VI1PR04MB5136E760A49DE331036F9F8DFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas,

Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, November 20, 2019 5:15 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net
> Subject: [EXT] Re: [Buildroot] [PATCH 7/9] package/rcw: Enable IIC5_PMUX and
> CLK_OUT_PMUX for GPIO
> 
> Caution: EXT Email
> 
> On Wed, 20 Nov 2019 12:07:23 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > Because GPIO is used as interrupt for eNETC PHY and Micro-bus,
> > IIC5_PMUX and CLK_OUT_PMUX are enabled for GPIO.
> >
> > Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> > ---
> >  ...5_PMUX-for-GPIO-function.patch.conditional | 42
> > +++++++++++++++++++  ...T_PMUX-for-GPIO-function.patch.conditional | 40
> ++++++++++++++++++
> >  package/rcw/rcw.mk                            |  7 ++++
> >  3 files changed, 89 insertions(+)
> >  create mode 100644
> > package/rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch.c
> > onditional  create mode 100644
> >
> package/rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patc
> > h.conditional
> 
> Sorry, but we really want to avoid conditional patches. Is there a better solution
> than this ?
> 
> The patches modify only files in ls1028ardb/, and you apply them when the
> board name is ls1028ardb, so basically, you could just as well apply the patches
> unconditionally, no ?
I can change it to apply the patch unconfitionally.

> > +ifeq ($(findstring ls1028ardb, $(BR2_TARGET_UBOOT_BOARDNAME)),
> > +ls1028ardb)
> 
> We really don't want to look at BR2_TARGET_UBOOT_BOARDNAME from
> package/rcw/.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C219d7748f90148ab5c
> d708d76d9a1a83%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 098380943442208&amp;sdata=C7gIJmLs7J8o6A2%2BlYs5HiKzQzSBMqUBWPET
> TiW1iWY%3D&amp;reserved=0
