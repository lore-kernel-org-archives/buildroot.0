From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 08 Sep 2010 11:40:09 +0100
Subject: [Buildroot] make source: missing dir and incorrect dependency
 with external toolchain
In-Reply-To: <1283334338.5097.14.camel@dubciaranr1.verifone.com>
References: <1281631732.14333.88.camel@cabbage.rehill.info>
	<1283330943.5097.6.camel@dubciaranr1.verifone.com>
	<20100901085720.GE11476@bulix.org>
	<201009011117.12920.yann.morin.1998@anciens.enib.fr>
	<1283334338.5097.14.camel@dubciaranr1.verifone.com>
Message-ID: <1283942409.11196.11.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ar C?ad, 2010-09-01 ag 11:17 +0200, scr?obh Yann E. MORIN:
> > Quotient, Maxime, All,
> > 
> > In fact, that .mk can be used even for external toolchain, as it is also
> > responsible for building the native toolchain that runs on the target,
> > if you selected it.
> > 
> > The issue is in this case:
> > - external toolchain used
> >   --> verion selection for gcc, binutils... is not available
> > - native toolchain on target is selected
> >   --> wants to download gcc
> > 
> > Quotient, is that your situation?
> 
> No, I'm not building a native toolchain.
> From .config:
> 
> 	# BR2_HAVE_DEVFILES is not set
> 
> Therefore I cannot (and do not want to) select BR2_PACKAGE_GCC_TARGET.
> 
> > The proper way to fix it would be to show gcc/binutils/... version
> > selection in this case.
> > 
> > > I'm not sure how to make it not use it when using an external toolchain
> > > though, a big if/endif on the whole file seems dirty-ish, at best.
> > 
> > Nope, that's not possible, as explained above. We have to be smarter! ;-)

Yann, or anyone else, did you get a chance to think any further about
this?
