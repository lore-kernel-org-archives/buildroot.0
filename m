From: Jerry Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 11:09:52 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <bdf9c08ab88c1a965ec665023a52309d@walle.cc>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <bdf9c08ab88c1a965ec665023a52309d@walle.cc>
Message-ID: <VI1PR04MB5136970EECFB9FD42650EDEAFE4E0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Thursday, November 21, 2019 6:52 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; geomatsi at gmail.com;
> matthew.weber at collins.com; thomas.petazzoni at bootlin.com
> Subject: [EXT] Re: [PATCH v2 07/10]
> package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
> 
> Caution: EXT Email
> 
> Am 2019-11-21 11:23, schrieb Changming Huang:
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > This package provides the firmware for LS1028ARDB DP (display port).
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> > ---
> > changes since v1:
> > 1. rename the package to fsl-qoriq-cadence-dp-fw 2. update DEVELOPERS
> > 3. add the hash of package 4. modify the context fo config file to
> > package name 5. re-write the makefile according to rule of buildroot
> > 6. add the license message in makefile
> > ---
> >  DEVELOPERS                                    |  3 +++
> >  package/freescale-qoriq/Config.in             |  2 ++
> >  .../fsl-qoriq-cadence-dp-fw/Config.in         |  5 ++++
> >  .../fsl-qoriq-cadence-dp-fw.hash              |  2 ++
> >  .../fsl-qoriq-cadence-dp-fw.mk                | 24
> +++++++++++++++++++
> >  5 files changed, 36 insertions(+)
> >  create mode 100644
> > package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
> >  create mode 100644
> > package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-f
> > w.hash
> >  create mode 100644
> > package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-f
> > w.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 9fbe229eb7..b15115f507 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2545,3 +2545,6 @@ F:      package/qjson/
> >  F:   package/quazip/
> >  F:   package/shapelib/
> >  F:   package/tinc/
> > +
> > +N:   Changming Huang <jerry.huang@nxp.com>
> > +F:   package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/
> > diff --git a/package/freescale-qoriq/Config.in
> > b/package/freescale-qoriq/Config.in
> > index 51497c588e..89f575a344 100644
> > --- a/package/freescale-qoriq/Config.in
> > +++ b/package/freescale-qoriq/Config.in
> > @@ -1,4 +1,6 @@
> >  menu "Freescale QorIQ libraries"
> >       depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 ||
> > BR2_powerpc
> >
> > +source "package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in"
> > +
> >  endmenu
> > diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
> > new file mode 100644
> > index 0000000000..9259776750
> > --- /dev/null
> > +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW
> > +     bool "FSL QorIQ cadence DP firmware"
> > +     help
> > +       FSL QorIQ cadence DP firmware, a resident EL3 firmware.
> > +       link:
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.n
> >
> xp.com%2Flgfiles%2Fsdk%2Flsdk1909%2Ffirmware-cadence-lsdk1909.bin&amp;
> >
> data=02%7C01%7Cjerry.huang%40nxp.com%7C8af29f72a8524b1f700608d76e7
> 0ce5
> >
> c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6370993030840248
> 67&amp;
> >
> sdata=uSC8EhBphE5cLuUGjHWvGyRgNCs3kdPKUe3xBgAna3U%3D&amp;reserv
> ed=0
> > diff --git
> > a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
> > -fw.hash
> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
> > -fw.hash
> > new file mode 100644
> > index 0000000000..bee912bee1
> > --- /dev/null
> > +++
> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
> > -fw.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256
> > 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58
> > firmware-cadence-lsdk1909.bin
> > diff --git
> > a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
> > -fw.mk
> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
> > -fw.mk
> > new file mode 100644
> > index 0000000000..d0d112e25f
> > --- /dev/null
> > +++
> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp
> > -fw.mk
> > @@ -0,0 +1,24 @@
> >
> +###############################################################
> ######
> > +###########
> > +#
> > +# fsl-qoriq-cadence-dp-fw
> > +#
> >
> +###############################################################
> ######
> > +###########
> > +
> > +FSL_QORIQ_CADENCE_DP_FW_VERSION = lsdk1909
> > +FSL_QORIQ_CADENCE_DP_FW_SITE =
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.
> >
> +nxp.com%2Flgfiles%2Fsdk%2Flsdk1909&amp;data=02%7C01%7Cjerry.huang%
> 40n
> >
> +xp.com%7C8af29f72a8524b1f700608d76e70ce5c%7C686ea1d3bc2b4c6fa92c
> d99c5
> >
> +c301635%7C0%7C0%7C637099303084024867&amp;sdata=efvW3VQKOjQPq5
> 5%2BMpeu
> > +uARsbNMl0NV99IwR1ylN9vs%3D&amp;reserved=0
> > +FSL_QORIQ_CADENCE_DP_FW_SOURCE =
> > firmware-cadence-$(FSL_QORIQ_CADENCE_DP_FW_VERSION).bin
> > +FSL_QORIQ_CADENCE_DP_FW_LICENSE = NXP-Binary-EULA
> > +FSL_QORIQ_CADENCE_DP_FW_LICENSE_FILES = COPYING
> > +FSL_QORIQ_CADENCE_DP_FW_INSTALL_IMAGES = YES
> > +FSL_QORIQ_CADENCE_DP_FW_INSTALL_TARGET = no
> > +
> > +define FSL_QORIQ_CADENCE_DP_FW_EXTRACT_CMDS
> > +     cd $(@D); \
> > +             sh
> >
> $(FSL_QORIQ_CADENCE_DP_FW_DL_DIR)/$(FSL_QORIQ_CADENCE_DP_FW_SO
> URCE)
> > --auto-accept;
> > +endef
> 
> There is already an FREESCALE_IMX_EXTRACT_HELPER macro. I guess that
> should be renamed and used here.
It is ok for me.

Hi, Thomas,
How do you think about it?

> -michael
