From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 8 Jan 2009 19:29:30 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901071319.00644.markus.heidelberg@web.de>
	<d6cda7730901070601o1c98127cv2df22e32808718b0@mail.gmail.com>
	<200901081850.39916.markus.heidelberg@web.de>
Message-ID: <007901c971bf$6b6e9030$dfc4af0a@Glamdring>
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

Yes, HCE regularily downloads the svn, adds his stuff on top.
and tests with one or more rc versions before release.

Therefore it makes sense to propagate any fixes to mainstream
because then the diff will be smaller and his job easier
and it contributes to mainstream with both generic
and AVR32 stuff.

>
> This is not really true. The Atmel fork have numerous issues, and I
> can't do much about them, that's exactly why I looked up to this
> project. I didn't even knew what buildroot was before being introduced
> to Atmel's fork.
> John and Amaur, certainly had their issues with Atmel's fork as well,
> since they decided to contribute AVR32 specific changes here at some
> point. That probably could be said about most AVR32 user around.

One of the key issues for an AVR32 developer is that they cannot
commit additions to the Atmel version, so every time
a new version is released, they have to port their stuff to the
Atmel version.

> Given that there are numerous issues, can you at least show me a few of
> them? I'm interested. Everybody is calling for stable releases, HCE
> offers such for AVR32, but nobody is using them!?

Why do you think that noone is using them, there are thousands
of AVR32 boards sold every year, and if the Atmel buildroot
is the recommended way of providing the Linux, that is the route
many will follow.

> I guess HCE and others from Atmel will only point users to Atmel's
> fork because of the quality issues we have here, and lack of release.
> It really doesn't look good for the company to point it's customers
> here and it sudenly doesn't even build today.

> Agreed.

> Having our quality issues and releases sorted out, it's likely that
> their branch might just go away.

> I don't know, but I don't necessarily think so.

It really does not matter. The Atmel branch fills one need,
and the AVR32 support in the main trunk fills another need.
The Atmel branch would have been much less useful
for AVR32 developers if people like John Voltz, Thiego & others
had not worked with the main trunk



> On Wed, Jan 7, 2009 at 9:28 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >  Ulf> That is why other systems like OpenEmbedded allow having more
> >  Ulf> than one version of a package.
> >  Ulf> A system that only allows a single version is really not useful.
> >
> > Sorry, I disagree. Most packages only have a single version and that
> > works fine. Almost everything under packages builds just fine on any
> [cut]



> I agree with Peter. We should strive to keep single versions only.
> There are cases like DirectFB and perhaps other libs that it's not
> possible, because the lib changes it's API. But in general, having
> several versions of the same package will add clutter and will be a
> maintenance nightmare.
> Ulf, I see your point. But suggesting to have versions for every
> package is too much. Perhaps we could have multiple versions for one
> very important package or another but every one doesn't make sense.

> The point is, when you have to be stable for delivered products, you
> won't update any package without a reason, let alone u-boot or the
> toolchain. During development you can update whenever you want to. So if
> you really need some new versions, you can cherry-pick them from the
> latest buildroot into your stable-branch. No need for multiple version
> inside buildroot itself.

My idea is based on that if buildroot works, then noone
should need to have a personal stable branch because
buildroot will contain the personal stable branch
without much addition.

Unfortunately people equates having several package versions inside 
buildroot
with having to test different permutations of those packages.

That just mean that either they have not read what I have written
or they have not understood so I repeat:

My proposal means that the test effort will only use ONE VERSION of each 
package.
The release will only support one version of each package.
It is in the development phase, where you get more versions,
and when you move to a new package version in a new distribution
you FREEZE the old versions, but you do not remove them
and you do not allow the casual user to select them through Kconfig.

You can however select to build an older distribution and then the older
versions will be used.
There is no immediate way to mix packages from  different distribution
suing Kconfig
A developer is free to select whatever package he wants by creating
his own distribution using overrides.








> Markus



Best Regards
Ulf Samuelsson
