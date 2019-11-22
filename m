From: Jerry Huang <jerry.huang@nxp.com>
Date: Fri, 22 Nov 2019 09:24:18 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 05/10]
 boot/arm-trusted-firmware: Add option
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
In-Reply-To: <20191122091105.rndnuzqedkvylxnx@bars>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-6-jerry.huang@nxp.com>
 <20191122091105.rndnuzqedkvylxnx@bars>
Message-ID: <VI1PR04MB51369B7C5B5545BC692A87F6FE490@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Sergey Matyukevich <geomatsi@gmail.com>
> Sent: Friday, November 22, 2019 5:11 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; matthew.weber at collins.com; michael at walle.cc;
> thomas.petazzoni at bootlin.com
> Subject: [EXT] Re: [PATCH v2 05/10] boot/arm-trusted-firmware: Add option
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> 
> Caution: EXT Email
> 
> On Thu, Nov 21, 2019 at 06:23:19PM +0800, Changming Huang wrote:
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > Add option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> to define the U-Boot BIN.
> > The default setting is u-boot.bin, customer can change it to anything via
> defconfig.
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> > ---
> > changes since v1:
> > 1. add BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE for
> uboot
> > binary file 2. default of new option is u-boot.bin.
> > 3. use the new option for U-Boot BL33
> > ---
> >  boot/arm-trusted-firmware/Config.in               | 12 ++++++++++++
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk |  3 ++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/arm-trusted-firmware/Config.in
> > b/boot/arm-trusted-firmware/Config.in
> > index 78c03019d5..3e83590776 100644
> > --- a/boot/arm-trusted-firmware/Config.in
> > +++ b/boot/arm-trusted-firmware/Config.in
> > @@ -124,6 +124,18 @@ config
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> >         gets built before ATF, and that the appropriate BL33
> >         variable pointing to u-boot.bin is passed when building ATF.
> >
> > +if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> > +
> > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> > +     string "U-Boot BL33 Image for ATF"
> > +     default "u-boot.bin"
> > +     help
> > +       The U-Boot BL33 image for ATF, u-boot.bin is the default setting,
> > +       this setting can be changed to any U-Boot binary file that used,
> > +       for example, u-boot-dtb.bin.
> > +
> > +endif
> > +
> >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
> >       string "Additional ATF build variables"
> >       help
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index e528686aa1..2133d39e6d 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -70,7 +70,8 @@ endif
> >  endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
> >
> >  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
> > -ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> BL33=$(BINARIES_DIR)/u-boot.bin
> > +ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call
> > +qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> > +BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
> >  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot  endif
> 
> Hello Jerry,
> 
> Thanks for the update. This one looks good to me.
> 
> Reviewed-by: Sergey Matyukevich <geomatsi@mail.com>

Thanks a lot.

> Regards,
> Sergey
