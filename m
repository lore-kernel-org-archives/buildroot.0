From: Michael Walle <michael@walle.cc>
Date: Fri, 22 Nov 2019 12:00:27 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <VI1PR04MB51367BB9692EC714A7667E70FE490@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <bdf9c08ab88c1a965ec665023a52309d@walle.cc>
 <VI1PR04MB51367BB9692EC714A7667E70FE490@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <be3bd51212032b8fad3e3741433a7b4f@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
>> > +define FSL_QORIQ_CADENCE_DP_FW_EXTRACT_CMDS
>> > +     cd $(@D); \
>> > +             sh
>> >
>> $(FSL_QORIQ_CADENCE_DP_FW_DL_DIR)/$(FSL_QORIQ_CADENCE_DP_FW_SO
>> URCE)
>> > --auto-accept;
>> > +endef
>> 
>> There is already an FREESCALE_IMX_EXTRACT_HELPER macro. I guess that
>> should be renamed and used here.
> 
> I changed this codes accordance with freescale-imx, create new option
> FREESCALE_QORIQ_EXTRACT_HELPER

why FREESCALE_QORIQ_EXTRACT_HELPER? are there two different ones now?
Shouldn't it be just FREESCALE_EXTRACT_HELPER? and the definition of the 
macro should be moved out of the freescale-imx.mk?

or of course, there might be another subdirectory structure like:
packages/freescale/imx
packages/freescale/qoriq
pacakges/freescale/helper.mk

Or..

packages/freescale/fsl-imx-<package>
packages/freescale/fsl-qoriq-<package>
pacakges/freescale/helper.mk

And the macro might end up in the pacakges/freescale/helper.mk file.

TBH. I guess there have to be a cleanup before adding the qoriq stuff. 
Thomas? Matthew?

-michael
