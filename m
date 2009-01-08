From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 8 Jan 2009 18:50:39 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <d6cda7730901070601o1c98127cv2df22e32808718b0@mail.gmail.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901071319.00644.markus.heidelberg@web.de>
	<d6cda7730901070601o1c98127cv2df22e32808718b0@mail.gmail.com>
Message-ID: <200901081850.39916.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a, 07.01.2009:
> On Wed, Jan 7, 2009 at 10:19 AM, Markus Heidelberg
> <markus.heidelberg@web.de> wrote:
> > Peter Korsgaard, 07.01.2009:
> >> Markus Heidelberg writes:
> >
> >> Right now things are kind of a mess as avr32 is lacking from most
> >> upstream projects, so there's lots of big patches involved. As things
> >> are now, I don't see missing avr32 as a showstopper for a first
> >> release.
> >
> > Absolutely agreed. Especially given that there is this well-supported
> > AVR32 fork (which isn't really a fork I think, it rather sits on top of
> > uclibc-buildroot).
> >
> 
> This is not really true. The Atmel fork have numerous issues, and I
> can't do much about them, that's exactly why I looked up to this
> project. I didn't even knew what buildroot was before being introduced
> to Atmel's fork.
> John and Amaur, certainly had their issues with Atmel's fork as well,
> since they decided to contribute AVR32 specific changes here at some
> point. That probably could be said about most AVR32 user around.

Given that there are numerous issues, can you at least show me a few of
them? I'm interested. Everybody is calling for stable releases, HCE
offers such for AVR32, but nobody is using them!?

> I guess HCE and others from Atmel will only point users to Atmel's
> fork because of the quality issues we have here, and lack of release.
> It really doesn't look good for the company to point it's customers
> here and it sudenly doesn't even build today.

Agreed.

> Having our quality issues and releases sorted out, it's likely that
> their branch might just go away.

I don't know, but I don't necessarily think so. 

> On Wed, Jan 7, 2009 at 9:28 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >  Ulf> That is why other systems like OpenEmbedded allow having more
> >  Ulf> than one version of a package.
> >  Ulf> A system that only allows a single version is really not useful.
> >
> > Sorry, I disagree. Most packages only have a single version and that
> > works fine. Almost everything under packages builds just fine on any
> [cut]
> 
> I agree with Peter. We should strive to keep single versions only.
> There are cases like DirectFB and perhaps other libs that it's not
> possible, because the lib changes it's API. But in general, having
> several versions of the same package will add clutter and will be a
> maintenance nightmare.
> Ulf, I see your point. But suggesting to have versions for every
> package is too much. Perhaps we could have multiple versions for one
> very important package or another but every one doesn't make sense.

The point is, when you have to be stable for delivered products, you
won't update any package without a reason, let alone u-boot or the
toolchain. During development you can update whenever you want to. So if
you really need some new versions, you can cherry-pick them from the
latest buildroot into your stable-branch. No need for multiple version
inside buildroot itself.

Markus
