From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 11:12:59 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <165d3a2c0b806e889efe738487d216bd@walle.cc>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <20191125231221.743cd7ed@windsurf>
 <VI1PR04MB513679F2B82773C7958DBA07FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <165d3a2c0b806e889efe738487d216bd@walle.cc>
Message-ID: <20191126111259.3ae8feac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 10:29:18 +0100
Michael Walle <michael@walle.cc> wrote:

> >> Final semi-colon not needed.  
> > Will use below command in v3:
> > define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
> >         $(call
> > NXP_QORIQ_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
> > endef  
> 
> please don't duplicate that piece of code.. it should really be
> NXP_EXTRACT_HELPER. which leads to the cleanup of the freescale-imx
> and nxp-qoriq directories. IMHO both should be named consistently.
> Thomas? Matthew?

What are you suggesting? A single package/nxp/ folder, with everything
in there?

If we do package/nxp-imx/ and package/nxp-qoirq/, then there is still
the question of where to put this common NXP_EXTRACT_HELPER macro

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
