From: Jerry Huang <jerry.huang@nxp.com>
Date: Mon, 25 Nov 2019 02:40:10 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <be3bd51212032b8fad3e3741433a7b4f@walle.cc>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <bdf9c08ab88c1a965ec665023a52309d@walle.cc>
 <VI1PR04MB51367BB9692EC714A7667E70FE490@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <be3bd51212032b8fad3e3741433a7b4f@walle.cc>
Message-ID: <VI1PR04MB5136E63116B6AFD4EBD9344FFE4A0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Friday, November 22, 2019 7:00 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; geomatsi at gmail.com;
> matthew.weber at collins.com; thomas.petazzoni at bootlin.com
> Subject: Re: [EXT] Re: [PATCH v2 07/10]
> package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
> 
> Caution: EXT Email
> 
> Hi,
> >> > +define FSL_QORIQ_CADENCE_DP_FW_EXTRACT_CMDS
> >> > +     cd $(@D); \
> >> > +             sh
> >> >
> >>
> $(FSL_QORIQ_CADENCE_DP_FW_DL_DIR)/$(FSL_QORIQ_CADENCE_DP_FW_SO
> >> URCE)
> >> > --auto-accept;
> >> > +endef
> >>
> >> There is already an FREESCALE_IMX_EXTRACT_HELPER macro. I guess that
> >> should be renamed and used here.
> >
> > I changed this codes accordance with freescale-imx, create new option
> > FREESCALE_QORIQ_EXTRACT_HELPER
> 
> why FREESCALE_QORIQ_EXTRACT_HELPER? are there two different ones now?
> Shouldn't it be just FREESCALE_EXTRACT_HELPER? and the definition of the
> macro should be moved out of the freescale-imx.mk?
> 
> or of course, there might be another subdirectory structure like:
> packages/freescale/imx
> packages/freescale/qoriq
> pacakges/freescale/helper.mk
I think it makes sense to create another subdirectory like this.

> Or..
> 
> packages/freescale/fsl-imx-<package>
> packages/freescale/fsl-qoriq-<package>
> pacakges/freescale/helper.mk
> 
> And the macro might end up in the pacakges/freescale/helper.mk file.
> 
> TBH. I guess there have to be a cleanup before adding the qoriq stuff.
> Thomas? Matthew?
> 
> -michael
