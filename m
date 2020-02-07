From: Jerry Huang <jerry.huang@nxp.com>
Date: Fri, 7 Feb 2020 01:26:57 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v4 6/9]
 package/qoriq-cadence-dp-firmware: new package
In-Reply-To: <f806a25e2111a02a4c3048d2f91b9d34@walle.cc>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <20200205105227.13698-6-jerry.huang@nxp.com>
 <f806a25e2111a02a4c3048d2f91b9d34@walle.cc>
Message-ID: <VI1PR04MB5136AEACA1DAF944960828FCFE1C0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Wednesday, February 5, 2020 9:48 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; thomas.petazzoni at bootlin.com;
> matthew.weber at collins.com; geomatsi at gmail.com; olteanv at gmail.com
> Subject: [EXT] Re: [PATCH v4 6/9] package/qoriq-cadence-dp-firmware: new
> package
> 
> Caution: EXT Email
> 
> Am 2020-02-05 11:52, schrieb Changming Huang:
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > This package provides the firmware for LS1028ARDB DP (display port).
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> > ---
> > changes since v3:
> > no changes.
> >
> > changes since v2:
> > 1. change the package name to qoriq-cadence-dp-firmware.
> > 2. add the hash of COPYING.
> > 3. modify makefile with new option.
> > 4. update DEVELOPERS with alphabetic ordering
> >
> > changes since v1:
> > 1. rename the package to fsl-qoriq-cadence-dp-fw.
> > 2. update DEVELOPERS.
> > 3. add the hash of package.
> > 4. modify the context fo config file to package name.
> > 5. re-write the makefile according to rule of buildroot.
> > 6. add the license message in makefile.
> > ---
> >  DEVELOPERS                                    |  3 +++
> >  package/nxp/Config.in                         |  2 ++
> >  package/nxp/helper.mk                         |  2 ++
> >  .../nxp/qoriq-cadence-dp-firmware/Config.in   |  4 ++++
> >  .../qoriq-cadence-dp-firmware.hash            |  3 +++
> >  .../qoriq-cadence-dp-firmware.mk              | 23
> +++++++++++++++++++
> >  6 files changed, 37 insertions(+)
> >  create mode 100644 package/nxp/qoriq-cadence-dp-firmware/Config.in
> >  create mode 100644
> > package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> >  create mode 100644
> > package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 9303841c47..0e131b0668 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -513,6 +513,9 @@ F:        configs/nanopi_m1_plus_defconfig
> >  F:   configs/olimex_a13_olinuxino_defconfig
> >  F:   configs/orangepi_plus_defconfig
> >
> > +N:   Changming Huang <jerry.huang@nxp.com>
> > +F:   package/nxp/qoriq-cadence-dp-firmware/
> > +
> >  N:   Chris Packham <judge.packham@gmail.com>
> >  F:   package/gstreamer1/gst1-shark/
> >  F:   package/micropython/
> > diff --git a/package/nxp/Config.in b/package/nxp/Config.in index
> > 575542c7ab..855d62700b 100644
> > --- a/package/nxp/Config.in
> > +++ b/package/nxp/Config.in
> > @@ -1,4 +1,6 @@
> >  menu "NXP QorIQ libraries"
> >       depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 ||
> > BR2_powerpc
> >
> > +source "package/nxp/qoriq-cadence-dp-firmware/Config.in"
> > +
> >  endmenu
> > diff --git a/package/nxp/helper.mk b/package/nxp/helper.mk index
> > 79e4236249..2eee2227af 100644
> > --- a/package/nxp/helper.mk
> > +++ b/package/nxp/helper.mk
> > @@ -4,6 +4,8 @@
> >  #
> >
> >
> ################################################################
> ######
> > ##########
> >
> > +NXP_QORIQ_SITE =
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.
> >
> +nxp.com%2Flgfiles%2Fsdk%2Flsdk1909&amp;data=02%7C01%7Cjerry.huang%
> 40n
> >
> +xp.com%7Ce570360260aa4b23ad6708d7aa42085b%7C686ea1d3bc2b4c6fa92
> cd99c5
> >
> +c301635%7C0%7C0%7C637165072894599859&amp;sdata=y0oeGsbp%2FvxW
> GdocRx4W
> > +Z1sPhepE3gFFfIdSTev%2F%2BU4%3D&amp;reserved=0
> > +
> 
> I'm not sure if that NXP_QORIQ_SITE should go in here. But the specifc version
> "lsdk1909" is for sure not correct.
Will remove NXP_QORIQ_SITE from next version.

> >  # Helper for self-extracting binaries distributed by NXP.
> >  #
> >  # The --force option makes sure it doesn't fail if the source diff
> > --git a/package/nxp/qoriq-cadence-dp-firmware/Config.in
> > b/package/nxp/qoriq-cadence-dp-firmware/Config.in
> > new file mode 100644
> > index 0000000000..3f494bd3a3
> > --- /dev/null
> > +++ b/package/nxp/qoriq-cadence-dp-firmware/Config.in
> > @@ -0,0 +1,4 @@
> > +config BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE
> > +     bool "qoriq-cadence-dp-firmware"
> > +     help
> > +       NXP QorIQ cadence DP firmware, a resident EL3 firmware.
> > diff --git
> > a/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> > b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> > new file mode 100644
> > index 0000000000..89aaf1d71b
> > --- /dev/null
> > +++
> > b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256
> > 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58
> > firmware-cadence-lsdk1909.bin
> > +sha256
> > d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561
> > COPYING
> > diff --git
> > a/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> > b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> > new file mode 100644
> > index 0000000000..239f4b9d75
> > --- /dev/null
> > +++
> > b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> > @@ -0,0 +1,23 @@
> >
> +###############################################################
> ######
> > +###########
> > +#
> > +# qoriq-cadence-dp-firmware
> > +#
> >
> +###############################################################
> ######
> > +###########
> > +
> > +QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
> > +QORIQ_CADENCE_DP_FIRMWARE_SITE = $(NXP_QORIQ_SITE)
> 
> why don't you just use
> QORIQ_CADENCE_DP_FIRMWARE_SITE =
> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.nxp.
> com%2Flgfiles%2Fsdk%2F%24(QORIQ_CADENCE_DP_FIRMWARE_VERSION&a
> mp;data=02%7C01%7Cjerry.huang%40nxp.com%7Ce570360260aa4b23ad6708
> d7aa42085b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371650
> 72894609853&amp;sdata=4nh9qImzs1JjE1CPLEKU3Hx%2BP7lkLudTNfd41TZ7K
> %2Fc%3D&amp;reserved=0)
will use the url directly next version.

> > +QORIQ_CADENCE_DP_FIRMWARE_SOURCE =
> > firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
> > +QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
> > +QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
> > +QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
> > +QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
> > +
> > +define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
> > +     $(call
> >
> NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORI
> Q_CADENCE
> > _DP_FIRMWARE_SOURCE))
> > +endef
> > +
> > +define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
> > +     $(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin
> > $(BINARIES_DIR)/ls1028a-dp-fw.bin
> > +endef
> 
> Installing the firmware into the target filesystem is missing. As pointed out by
> me - and also Vladimir - the DisplayPort driver should rather load the firmare by
> its on and should not depend on the bootloader to load it.
We don't install this firmware into target filesystem, because we need to load it to hardware before mounting target filesystem.

> > +
> > +$(eval $(generic-package))
