From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 03:25:55 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 02/10]
 package/freescale-qoriq/fsl-qoriq-rcw: move rcw into freescale-qoriq and
 rename it
In-Reply-To: <20191125221531.0ce79006@windsurf>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-3-jerry.huang@nxp.com>
 <20191125221531.0ce79006@windsurf>
Message-ID: <VI1PR04MB513630F94ED160435A1FFF13FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot for your comment, Thomas.

Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 26, 2019 5:16 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; michael at walle.cc; matthew.weber at collins.com;
> geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] [PATCH v2 02/10]
> package/freescale-qoriq/fsl-qoriq-rcw: move rcw into freescale-qoriq and
> rename it
> 
> Caution: EXT Email
> 
> On Thu, 21 Nov 2019 18:23:16 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > Move package/rcw into package/freescale-qoriq, and rename it to
> > fsl-qoriq-rcw.
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> 
> Then, this package should be named nxp-qoriq-rcw, if you decide to name the
> directory nxp-qoriq/.
I renamed this package to qoriq-rcw, is it ok?
Because there are similar naming in freescale-imx.

> > ---
> > changes since v1:
> > 1. new patch
> > 2. move rcw to sub-directory freescale-qoriq 3. rename to
> > fsl-qoriq-rcw
> > ---
> >  DEVELOPERS                                    |  2 +-
> >  package/Config.in.host                        |  2 +-
> 
> You need Config.in.legacy handling due to the renaming of the option.
Sure, I will do it.

> 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 19ea83df3b..9fbe229eb7 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1603,7 +1603,7 @@ F:      package/python-pyrex/
> >  F:   package/python-tinyrpc/
> >  F:   package/python-txdbus/
> >  F:   package/raptor/
> > -F:   package/rcw/
> > +F:   package/freescale-qoriq/fsl-qoriq-rcw/
> 
> Please preserve alphabetic ordering.
Sure

> 
> >  F:   package/rng-tools/
> >  F:   package/rsyslog/
> >  F:   package/setools/
> > diff --git a/package/Config.in.host b/package/Config.in.host index
> > 758c268e00..e4840080ad 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -62,7 +62,7 @@ menu "Host utilities"
> >       source "package/qemu/Config.in.host"
> >       source "package/raspberrypi-usbboot/Config.in.host"
> >       source "package/rauc/Config.in.host"
> > -     source "package/rcw/Config.in.host"
> > +     source "package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host"
> 
> Ditto: alphabetic ordering.
sure

> 
> > -RCW_VERSION = LSDK-18.12
> > -RCW_SITE =
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsour
> >
> ce.codeaurora.org%2Fexternal%2Fqoriq%2Fqoriq-components%2Frcw&amp;da
> ta
> >
> =02%7C01%7Cjerry.huang%40nxp.com%7C440c1c4d06f845dca04908d771ec9b
> da%7C
> >
> 686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637103133347439348&a
> mp;sdat
> >
> a=stm4A4DGFRjWmRHcqo%2FLchoIgp4GjrpRk6JvryEf6zc%3D&amp;reserved=0
> > -RCW_SITE_METHOD = git
> > -RCW_LICENSE = BSD-3-Clause
> > -RCW_LICENSE_FILES = LICENSE
> > +FSL_QORIQ_RCW_VERSION = LSDK-18.12
> > +FSL_QORIQ_RCW_SITE =
> > +https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsou
> >
> +rce.codeaurora.org%2Fexternal%2Fqoriq%2Fqoriq-components%2Frcw&amp;
> da
> >
> +ta=02%7C01%7Cjerry.huang%40nxp.com%7C440c1c4d06f845dca04908d771e
> c9bda
> >
> +%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371031333474393
> 48&amp;
> >
> +sdata=stm4A4DGFRjWmRHcqo%2FLchoIgp4GjrpRk6JvryEf6zc%3D&amp;reser
> ved=0
> > +FSL_QORIQ_RCW_SITE_METHOD = git
> > +FSL_QORIQ_RCW_LICENSE = BSD-3-Clause
> > +FSL_QORIQ_RCW_LICENSE_FILES = LICENSE
> >
> >  RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
> 
> How come the BR2_PACKAGE_HOST_RCW_CUSTOM_PATH option is not
> renamed ?
> 
> Also RCW_FILES should become NXP_QORIQ_RCW_FILES. All variables in the .mk
> file should be renamed.
I will rename all optioins.

> > -define HOST_RCW_ADD_CUSTOM_RCW_FILES
> > +define HOST_FSL_QORIQ_RCW_ADD_CUSTOM_RCW_FILES
> >       mkdir -p $(@D)/custom_board/rcw
> >       cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
> >       cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw  endef
> > HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
> 
> If you don't change the hook registration, the hook will never be called. Please
> check globally in this patch.
Ok, will do it.

> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C440c1c4d06f845dca0
> 4908d771ec9bda%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 103133347439348&amp;sdata=Efi59wYwQ4QCZ7KLiyj6acpsadH5BuGJk%2FFyY
> dMDnBc%3D&amp;reserved=0
