From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 8 Jan 2009 21:28:59 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <007901c971bf$6b6e9030$dfc4af0a@Glamdring>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901081850.39916.markus.heidelberg@web.de>
	<007901c971bf$6b6e9030$dfc4af0a@Glamdring>
Message-ID: <200901082128.59939.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson, 08.01.2009:
> 
> Thiago A. Corr?a, 07.01.2009:
> > On Wed, Jan 7, 2009 at 10:19 AM, Markus Heidelberg
> > <markus.heidelberg@web.de> wrote:
> > > Peter Korsgaard, 07.01.2009:
> > >> Markus Heidelberg writes:
> > >
> > >> Right now things are kind of a mess as avr32 is lacking from most
> > >> upstream projects, so there's lots of big patches involved. As things
> > >> are now, I don't see missing avr32 as a showstopper for a first
> > >> release.
> > >
> > > Absolutely agreed. Especially given that there is this well-supported
> > > AVR32 fork (which isn't really a fork I think, it rather sits on top of
> > > uclibc-buildroot).
> 
> Yes, HCE regularily downloads the svn, adds his stuff on top.
> and tests with one or more rc versions before release.
> 
> Therefore it makes sense to propagate any fixes to mainstream
> because then the diff will be smaller and his job easier
> and it contributes to mainstream with both generic
> and AVR32 stuff.

Pushing stuff into mainstream is always desirable.
I don't mean to have AVR32 specific things out of uclibc-buildroot. Of
course it should be supported there as well. But mplayer is just a good
example, where support for it is wrong and is a good reason for a
separate AVR32 repo, especially given that it's well supported by Atmel.

But when you already put so much stuff into uclibc-buildroot to fully
support AVR32, what's then remaining in HCE's tree and for what reason
this is not put into upstream? With your arguments, HCE doesn't need to
commit to his own repository at all, he could just commit everything
to upstream. The only purpose of his tree then would be having stable
and tested AVR32 releases for the customers.

> One of the key issues for an AVR32 developer is that they cannot
> commit additions to the Atmel version, so every time

What's wrong with that? What would they want to commit? You also cannot
commit directly to Haavards avr32-linux repo. Do you then ask Linus for
push access because of that? Is this also the reason why you put all the
U-Boot patches into buildroot, because you don't have commit access to
the u-boot repo but to uclibc-buildroot?

I think if you have AVR32 changes, that shouln't go into
uclibc-buildroot, then you could always send a patch to the
avr32-buildroot mailing list or HCE.

> a new version is released, they have to port their stuff to the
> Atmel version.

I don't get it. You can use the HCE's git repo and just pull the updates
or rebase against it. What has this to do with the fact that you cannot
commit to the public repo?

> > Given that there are numerous issues, can you at least show me a few of
> > them? I'm interested. Everybody is calling for stable releases, HCE
> > offers such for AVR32, but nobody is using them!?
> 
> Why do you think that noone is using them, there are thousands
> of AVR32 boards sold every year, and if the Atmel buildroot
> is the recommended way of providing the Linux, that is the route
> many will follow.

No, I don't think nobody is using them, that was just expressed
unluckily. But it seems as if the AVR32 users that are subscribed to
buildroot at uclibc.org aren't using it. At least I got that feeling while
following this mailing list.

> > The point is, when you have to be stable for delivered products, you
> > won't update any package without a reason, let alone u-boot or the
> > toolchain. During development you can update whenever you want to. So if
> > you really need some new versions, you can cherry-pick them from the
> > latest buildroot into your stable-branch. No need for multiple version
> > inside buildroot itself.
> 
> My idea is based on that if buildroot works, then noone
> should need to have a personal stable branch because
> buildroot will contain the personal stable branch
> without much addition.
> 
> [...]
> 
> My proposal means that the test effort will only use ONE VERSION of each 
> package.
> The release will only support one version of each package.
> It is in the development phase, where you get more versions,
> and when you move to a new package version in a new distribution
> you FREEZE the old versions, but you do not remove them
> and you do not allow the casual user to select them through Kconfig.

When I'm on stable, I definetly want to be on stable and only update/fix
packages that caused bugs. Consider a package that doesn't update its
version in buildroot (and also upstream maybe) during several months. It
will never FREEZE and always stay in development phase, because it's the
latest version, and it will probably get more patches.
So when merging the latest buildroot updates into my personal buildroot
repo for a board in development, I'd get changes behind my back also for
a released board in support phase.

So I will keep using branches in git instead of relying on buildroot to
include half a VCS functionality.

Markus
