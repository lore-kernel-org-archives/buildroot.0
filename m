From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 24 Feb 2010 22:49:20 +0000
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
 autotools infrastructure
In-Reply-To: <4B8589C4.5060206@gmail.com>
References: <20100223202924.D6947776A1@busybox.osuosl.org>	<4B844BFC.6030906@gmail.com>	<87aauzei61.fsf@macbook.be.48ers.dk>
	<4B8589C4.5060206@gmail.com>
Message-ID: <4B85ACF0.4000005@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/02/2010 20:19, Paulius Zaleckas wrote:
> On 02/23/2010 11:49 PM, Peter Korsgaard wrote:
>>>>>>> "Paulius" == Paulius Zaleckas<paulius.zaleckas@gmail.com>  writes:
>>
>> Hi,
>>
>> >>  -$(XFONT_FONT_UTIL_DIR)/.installed: $(XFONT_FONT_UTIL_DIR)/.compiled
>> >>  -    $(MAKE) DESTDIR=$(STAGING_DIR) -C $(XFONT_FONT_UTIL_DIR) 
>> install
>> >>  -    touch $@
>> >>  -
>>
>>   Paulius>  Shouldn't font-utils be installed to STAGING instead of 
>> TARGET?
>>   Paulius>  Originally it was installed to STAGING.
>>   Paulius>  I would suggest adding:
>>
>>   Paulius>  XFONT_FONT_UTIL_INSTALL_STAGING = YES
>>   Paulius>  XFONT_FONT_UTIL_INSTALL_TARGET = NO
>>
>> Why? Isn't xfont-utils a bunch of programs to run on the target? Staging
>> is normally for libs.
>>
>
> Well now we have:
>
> > XFONT_FONT_UTIL_VERSION = 1.1.1
> > XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
> > XFONT_FONT_UTIL_SITE = 
> http://xorg.freedesktop.org/releases/individual/font
> > XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
> >
> > define XFONT_FONT_UTIL_POST_INSTALL_FIXES
> >  $(@D)/post-install.sh $(STAGING_DIR)
> > endef
> >
> > XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += 
> XFONT_FONT_UTIL_POST_INSTALL_FIXES
>
> Why do we need POST_INSTALL_STAGING hook when we installed only to 
> TARGET?

I also have done a similar fix. I believe it is need in staging so that 
the pkgconfig info is correct, otherwise other things don't build

>
> > $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
>
> Actually I believe it was installed in to staging for some reason...
> I have ~200 patches (will post them soon :)) to update X.Org to 7.5 and I
> had to change post-install.sh script to new location for pkg-config
> or else it would fail building fonts... if I remember correctly.

I have also have patches to submit for X.Org 7.5, was just waiting for 
2.10 release before submitting.

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
