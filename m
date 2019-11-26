From: Michael Walle <michael@walle.cc>
Date: Tue, 26 Nov 2019 10:29:18 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <VI1PR04MB513679F2B82773C7958DBA07FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <20191125231221.743cd7ed@windsurf>
 <VI1PR04MB513679F2B82773C7958DBA07FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <165d3a2c0b806e889efe738487d216bd@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[sorry for the second mail]

Am 2019-11-26 09:09, schrieb Jerry Huang:
> Best Regards
> Jerry Huang
> 
>> -----Original Message-----
>> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> Sent: Tuesday, November 26, 2019 6:12 AM
>> To: Jerry Huang <jerry.huang@nxp.com>
>> Cc: buildroot at busybox.net; michael at walle.cc; 
>> matthew.weber at collins.com;
>> geomatsi at gmail.com
>> Subject: [EXT] Re: [Buildroot] [PATCH v2 07/10]
>> package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
>> 
>> Caution: EXT Email
>> 
>> Hello,
>> 
>> On Thu, 21 Nov 2019 18:23:21 +0800
>> Changming Huang <jerry.huang@nxp.com> wrote:
>> 
>> > From: Jerry Huang <jerry.huang@nxp.com>
>> >
>> > This package provides the firmware for LS1028ARDB DP (display port).
>> >
>> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
>> 
>> Overall, looks pretty good. Rename to nxp-qoriq-... if you decide to 
>> use the nxp
>> branding.
> Sure, I will rename it.
> 
>> > diff --git a/DEVELOPERS b/DEVELOPERS
>> > index 9fbe229eb7..b15115f507 100644
>> > --- a/DEVELOPERS
>> > +++ b/DEVELOPERS
>> > @@ -2545,3 +2545,6 @@ F:      package/qjson/
>> >  F:   package/quazip/
>> >  F:   package/shapelib/
>> >  F:   package/tinc/
>> > +
>> > +N:   Changming Huang <jerry.huang@nxp.com>
>> 
>> Please sort your name at the right place in the DEVELOPERS file 
>> (alphabetic
>> ordering).
> sure
> 
>> > diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
>> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
>> > new file mode 100644
>> > index 0000000000..9259776750
>> > --- /dev/null
>> > +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
>> > @@ -0,0 +1,5 @@
>> > +config BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW
>> > +     bool "FSL QorIQ cadence DP firmware"
>> 
>> Just:
>> 
>>         bool "fsl-qorirq-cadence-dp-fw
> Sure,
> 
>> > +     help
>> > +       FSL QorIQ cadence DP firmware, a resident EL3 firmware.
>> > +       link:
>> > + https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww
>> >
>> + .nxp.com%2Flgfiles%2Fsdk%2Flsdk1909%2Ffirmware-cadence-lsdk1909.bin&
>> > +
>> amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Ce1898ecb342d4abee75c0
>> 8d77
>> > +
>> 1f48c4c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63710316744
>> 6779
>> > +
>> 441&amp;sdata=%2FM0R2H%2BoS5qxxyzQLATgP7ndtCyNkzyxkFxTHgNuk2o%3
>> D&amp
>> > + ;reserved=0
>> 
>> One empty line between the description and the upstream URL, and no
>> "link: " before the link. Also, pointing to the binary file itself is 
>> not useful, we
>> need an actual web page. If none exist, just don't provide an upstream 
>> URL.
> Remove this link
> 
>> > diff --git
>> > a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
>> > -fw.hash
>> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
>> > -fw.hash
>> > new file mode 100644
>> > index 0000000000..bee912bee1
>> > --- /dev/null
>> > +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadenc
>> > +++ e-dp-fw.hash
>> > @@ -0,0 +1,2 @@
>> > +# Locally calculated
>> > +sha256
>> >
>> +5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58
>> > +firmware-cadence-lsdk1909.bin
>> 
>> Hash of the license file is missing.
> Will add the hash in v3
> 
>> > diff --git
>> > a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
>> > -fw.mk
>> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
>> > -fw.mk
>> > new file mode 100644
>> > index 0000000000..d0d112e25f
>> > --- /dev/null
>> > +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadenc
>> > +++ e-dp-fw.mk
>> > @@ -0,0 +1,24 @@
>> >
>> +###############################################################
>> ######
>> > +###########
>> > +#
>> > +# fsl-qoriq-cadence-dp-fw
>> > +#
>> >
>> +###############################################################
>> ######
>> > +###########
>> > +
>> > +FSL_QORIQ_CADENCE_DP_FW_VERSION = lsdk1909
>> > +FSL_QORIQ_CADENCE_DP_FW_SITE =
>> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.
>> >
>> +nxp.com%2Flgfiles%2Fsdk%2Flsdk1909&amp;data=02%7C01%7Cjerry.huang%
>> 40n
>> >
>> +xp.com%7Ce1898ecb342d4abee75c08d771f48c4c%7C686ea1d3bc2b4c6fa92c
>> d99c5
>> >
>> +c301635%7C0%7C0%7C637103167446779441&amp;sdata=pVGrODu3jQDZKQ
>> cKs1zXSq
>> > +ihEBQUw7Rq6C%2FRm%2Bn8FKU%3D&amp;reserved=0
>> > +FSL_QORIQ_CADENCE_DP_FW_SOURCE =
>> > +firmware-cadence-$(FSL_QORIQ_CADENCE_DP_FW_VERSION).bin
>> > +FSL_QORIQ_CADENCE_DP_FW_LICENSE = NXP-Binary-EULA
>> > +FSL_QORIQ_CADENCE_DP_FW_LICENSE_FILES = COPYING
>> > +FSL_QORIQ_CADENCE_DP_FW_INSTALL_IMAGES = YES
>> > +FSL_QORIQ_CADENCE_DP_FW_INSTALL_TARGET = no
>> 
>> Should be "NO" (upper_case)
> Will correct it
> 
>> > +
>> > +define FSL_QORIQ_CADENCE_DP_FW_EXTRACT_CMDS
>> > +     cd $(@D); \
>> > +             sh
>> >
>> +$(FSL_QORIQ_CADENCE_DP_FW_DL_DIR)/$(FSL_QORIQ_CADENCE_DP_FW_S
>> OURCE)
>> > +--auto-accept;
>> 
>> Final semi-colon not needed.
> Will use below command in v3:
> define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
>         $(call
> NXP_QORIQ_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
> endef

please don't duplicate that piece of code.. it should really be
NXP_EXTRACT_HELPER. which leads to the cleanup of the freescale-imx
and nxp-qoriq directories. IMHO both should be named consistently.
Thomas? Matthew?

-michael
