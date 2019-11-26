From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 12:10:51 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <55032876afb2531b2cd313343d39c817@walle.cc>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <20191125231221.743cd7ed@windsurf>
 <VI1PR04MB513679F2B82773C7958DBA07FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <165d3a2c0b806e889efe738487d216bd@walle.cc>
 <20191126111259.3ae8feac@windsurf>
 <55032876afb2531b2cd313343d39c817@walle.cc>
Message-ID: <VI1PR04MB5136D02E4C8E0CA4FF044FFEFE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Tuesday, November 26, 2019 6:31 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jerry Huang <jerry.huang@nxp.com>; buildroot at busybox.net;
> matthew.weber at collins.com; geomatsi at gmail.com
> Subject: Re: [EXT] Re: [Buildroot] [PATCH v2 07/10]
> package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
> 
> Caution: EXT Email
> 
> Am 2019-11-26 11:12, schrieb Thomas Petazzoni:
> > On Tue, 26 Nov 2019 10:29:18 +0100
> > Michael Walle <michael@walle.cc> wrote:
> >
> >> >> Final semi-colon not needed.
> >> > Will use below command in v3:
> >> > define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
> >> >         $(call
> >> >
> NXP_QORIQ_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/
> $(QORI
> >> > Q_CADENCE_DP_FIRMWARE_SOURCE))
> >> > endef
> >>
> >> please don't duplicate that piece of code.. it should really be
> >> NXP_EXTRACT_HELPER. which leads to the cleanup of the freescale-imx
> >> and nxp-qoriq directories. IMHO both should be named consistently.
> >> Thomas? Matthew?
> >
> > What are you suggesting? A single package/nxp/ folder, with everything
> > in there?
> 
> correct. that would also solve the NXP_EXTRACT_HELPER thing. which would
> end up in package/nxp/helper.mk or something like that.
So, first, create directory "package/nxp" and push all ls1028ardb codes (including qoriq-rcw, qoriq-cadence-dp-firmware).
Then, move all packages under package/freescale-imx into package/nxp in One separate patch?

> > If we do package/nxp-imx/ and package/nxp-qoirq/, then there is still
> > the question of where to put this common NXP_EXTRACT_HELPER macro
> 
> yes. see above.
> 
> -michael
