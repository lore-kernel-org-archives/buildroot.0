From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 06:17:40 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916200420.GF3293@free.fr>
References: <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr> <20130916195846.32e98c8a@skate>
 <20130916181512.GD3293@free.fr> <20130916202439.50de3e76@skate>
 <20130916200420.GF3293@free.fr>
Message-ID: <20130917061740.19eb3a66@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 16 Sep 2013 22:04:20 +0200, Yann E. MORIN wrote:

> Also, I would like to reiterate my suggestion the vriable BR2_EXTERNAL
> contains a list (space- or colon-sperated, as you wish) of external
> trees to descend into, rather than containing a single entry.

Unfortunately, I don't think this is easy to do. Have you seen how the
BR2_EXTERNAL/Config.in gets included in the top-level menu? The way
we're doing this in the current implementation doesn't make it easy to
have several paths in BR2_EXTERNAL.

> A side question to this: what if any of the external tree(s) contain a
> package already in a previous external tree or in the original
> Buildroot tree?

I don't think we want to support overlay-ing packages.

> > But it isn't quite sufficient: by your definition, the
> > Buildroot .config should also be shipped, and it also contains
> > config options for the company-specific proprietary packages. So
> > the .config should be "filtered" before being released. Not simple.
> 
> I think that is relatively easy: in the Buildroot tree, just run:
>     make BR2_EXTERNAL= oldconfig
> 
> That will expunge the .config from any variable from the BR2_EXTERNAL
> tree. You can then tar up the Buildroot tree, and make that available.
> Quite easy, but requires a process that documents this simple extra
> step prior to publication.

Hum, right, makes sense.

> > Aren't companies going to be afraid of revealing too much of their
> > secret sauce if they have to disclose their Buildroot tree?
> 
> Depends on what you call "their secret sauce". If you meant "their
> prorietary apps packaged in Buildroot" then, curently, yes, since
> those would be in the Buildroot tree. But with BR2_EXTERNAL (and the
> little oldconfig trick above), that'd be straightforward.
> 
> If you meant "the fact that they actually use Buildroot", then I don;t
> think how this could be seen as a "secret sauce".

I was talking about their proprietary apps / rootfs overlay, etc. Which
indeed with BR2_EXTERNAL they can keep separate.

> > If it's considered as a derived work, then your above idea of using
> > BR2_EXTERNAL to split things between secret stuff and released
> > stuff no longer works.
> 
> Well, yes it still stands. The GPL only applies at the time of
> distribution. So if BR2_EXTERNAL only contains recipes for
> weak-copyleft or non-copyleft packages,

Yes, and this *if* is very important.

> then there is no need for the
> company to distribute it, since the "official" Buildroot tree is
> enough to reproduce the GPL program(s) on the target.
> 
> This applies, of course, only if the company decides to publish
> Buildroot to catter for section 3 of the GPL of those programs.
> 
> If the company decides for another route, then this point is moot
> anyway, since there is no distribution at all.

Sure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
