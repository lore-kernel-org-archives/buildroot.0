From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 10:19:10 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <20170407080909.GB12962@panicking>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
 <CAOf5uwkL9FX3Fq2Dou1jnixat2CWxtWSbXG+Q=RQ=y3pSyjRzA@mail.gmail.com>
 <20170406183218.66cab07e@free-electrons.com>
 <20170406185739.3caf46f6@free-electrons.com>
 <20170407075444.GA12962@panicking>
 <20170407100654.32f1da84@free-electrons.com>
 <20170407080909.GB12962@panicking>
Message-ID: <20170407101910.57e2a19d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 10:09:11 +0200, Michael Trimarchi wrote:

> > > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > > index 1d464d967..edfc27fa7 100644
> > > --- a/boot/uboot/uboot.mk
> > > +++ b/boot/uboot/uboot.mk
> > > @@ -195,8 +195,9 @@ endef
> > >  endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
> > >  
> > >  define UBOOT_BUILD_CMDS
> > > -	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
> > > -		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
> > > +	UBOOT_CUSTOM_DTS_PATH=$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
> > > +	$(if $(UBOOT_CUSTOM_DTS_PATH),
> > > +		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
> > >  	)  
> 
> My error was cp -f with just one parameter. Test pass and cp -f fail

Ah, yes, obviously. Though it would be nicer to define
UBOOT_CUSTOM_DTS_PATH outside of UBOOT_BUILD_CMDS.

Could you send a separate patch, fixing just that?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
