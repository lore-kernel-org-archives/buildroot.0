From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Oct 2011 10:49:37 +0200
Subject: [Buildroot] [PATCH] package: add the duma memory debugging
 library
In-Reply-To: <20111006101634.601b9e9f@skate>
References: <b290fe079ce824d7574c1ad5f41987e21becc92e.1317795453.git.baruch@tkos.co.il>
 <201110051935.41682.yann.morin.1998@anciens.enib.fr>
 <20111006101634.601b9e9f@skate>
Message-ID: <20111006084936.GB1494@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

On Thu, Oct 06, 2011 at 10:16:34AM +0200, Thomas Petazzoni wrote:
> Le Wed, 5 Oct 2011 19:35:41 +0200,
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :
> 
> > > +	$(MAKE1) CC=$(TARGET_CC) CXX=$(TARGET_CXX) AR=$(TARGET_AR) \
> > > +		RANLIB=$(TARGET_RANLIB) DUMA_OPTIONS=$(strip $(DUMA_OPTIONS)) \
> > > +		$(DUMA_CPP) -C $(@D)
> > 
> > You forgot to pass HOSTCC, introduced in duma-2_5_15-cross-compile.patch

Well, HOSTCC is set in the top Makefile.

> Probably something like:
> 
> 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) DUMA_OPTIONS=... -C $(@D)
> 
> would be even better. But then, the duma-2_5_15-cross-compile.patch
> would have to use CC_FOR_BUILD instead of HOSTCC to find the location
> of the native host compiler.

Looks better. I'll update the patch. Thanks.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
