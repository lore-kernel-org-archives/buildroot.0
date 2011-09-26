From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2011 10:40:17 +0300
Subject: [Buildroot] [PATCH] toolchain: fix build with empty
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS
In-Reply-To: <20110926091730.3609c1fa@skate>
References: <6a4325eb6bbe6622b6a8b7d1bc3a7279866e6716.1317019552.git.baruch@tkos.co.il>
 <20110926091730.3609c1fa@skate>
Message-ID: <20110926074017.GC28996@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Sep 26, 2011 at 09:17:30AM +0200, Thomas Petazzoni wrote:
> Le Mon, 26 Sep 2011 09:46:43 +0300,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> >  # march/mtune/floating point mode needs to be passed to the external toolchain
> >  # to select the right multilib variant
> > -ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
> > +ifneq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),"")
> >  TOOLCHAIN_EXTERNAL_CFLAGS += $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
> >  TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
> >  endif
> 
> We typically use qstrip for this kind of things:
> 
> TOOLCHAIN_EXTERNAL_CUSTOM_ARGS = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_ARGS))
> ifneq ($(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS),)
> TOOLCHAIN_EXTERNAL_CFLAGS += $(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)
> TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_OPT='$(TOOLCHAIN_EXTERNAL_CUSTOM_ARGS)'
> endif

Thanks for the tip. I'll fix and resend.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
