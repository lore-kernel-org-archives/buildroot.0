From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 08:45:52 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 4/9] boot/arm-trusted-firmware:
 Add RCW support
In-Reply-To: <20191120075002.rgn3ymmedtux5dg4@bars>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-5-jerry.huang@nxp.com>
 <20191120075002.rgn3ymmedtux5dg4@bars>
Message-ID: <VI1PR04MB5136CEAD089D41B590E8A97EFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot for your reply.
My comment in lines.

Best Regards
Jerry Huang

> -----Original Message-----
> From: Sergey Matyukevich <geomatsi@gmail.com>
> Sent: Wednesday, November 20, 2019 3:50 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net
> Subject: [EXT] Re: [Buildroot] [PATCH 4/9] boot/arm-trusted-firmware: Add RCW
> support
> 
> Caution: EXT Email
> 
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index 70d36fff73..6896d9a7aa 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -95,6 +95,15 @@ endif
> >
> >  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
> >
> > +RCW_BOOT_MODE = $(call
> qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
> > +ifneq ($(RCW_BOOT_MODE),)
> > +RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> > +RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> BOOT_MODE=$(RCW_BOOT_MODE)
> > +RCW=$(BINARIES_DIR)/$(RCW_FILE)
> ARM_TRUSTED_FIRMWARE_MAKE_TARGETS +=
> > +pbl ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-rcw endif
> > +
> >  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
> >  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
> > ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
> 
> Hi Jerry and all,
> 
> Here arm-trusted-firmware build is modified when some host package with
> specific configuration is enabled in board config.
> 
> Shouldn't it be the other way around ? To be more specific: another Config.in
> option for arm-trusted-firmware which pulls required build time dependencies,
> e.g. see Marvell DDR options or FIP options.
1. If use another Config.in option for arm-trusted-firmware like Marvell DDR , need to mv package/rcw to boot/ directory.
2. Refer to FIP, add option like this BR2_PACKAGE_HOST_RCW_ATF in package/rcw/Config.in.host.
How do you think about the second way?

> Regards,
> Sergey
