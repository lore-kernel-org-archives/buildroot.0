From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 9 Jan 2009 00:13:01 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231453993.9711.27.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901082306.29783.markus.heidelberg@web.de>
	<1231453993.9711.27.camel@elrond.atmel.com>
Message-ID: <200901090013.01339.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson, 08.01.2009:
> > > >> One of the key issues for an AVR32 developer is that they cannot
> > > >> commit additions to the Atmel version, so every time
> > > 
> > > > What's wrong with that? What would they want to commit?
> > > 
> > > X-Windows for a start...
> > > That was committed to Buildroot by John Voltz so he
> > > could run X on his AVR32 board.
> > > There are plenty of examples.
> > 
> > In package/x11r7/ there is only one little avr32 patch to support
> > xorg-server for this architecture. I think this is fine to be included
> > in uclibc-buildroot, as long as it is pushed upstream. I looked at
> > Xorg's git web interface and at least in the latest version it is
> > included.
> > 
> > So this is not a good example for a lack-of-commit-access issue with
> > HCE's repository.
> 
> You forget that  he created the build recipe,,,,,
> and he is actually a VERY good example.

I didn't understand this. Who is "he"? HCE? And which build recipe?

> > I rather thought of examples like the big mplayer patch. This doesn't
> > belong into uclibc-buildroot, but into the AVR32 repo. 
> 
> 
> I am sure you would think otherwise if you were an AVR32 user.

Eh, I am.

> > And as I said
> > earlier: without commit access just send a patch to HCE. I'm sure he
> > would be glad to apply it to get more packages working with/optimized
> > for AVR32.
> 
> The best way to have it upgraded, I guess is to 
> update the mplayer version.
> Then HCE will detect that mplayer will not build
> and the patch will be have to be rebased on the new version.

That's exactly the problem. We cannot update mplayer without breaking
anything. On the one hand you speak about creating releases, on the
other hand breaking packages is acceptable?

> You will of course see a new AVR32 patch quite soon in uclibc-buildroot.

If nobody has time to push the patch upstream, probably nobody will have
the time to update the patch to a newer mplayer version as well. And as
a result HCE will stay at the older version in his repository and
mplayer doesn't work for AVR32 with uclibc-buildroot.

But why not bump mplayer to 1.0rc2 and see what happens? It would be
interesting.

But if someone finds the time to update the patch, then I don't
understand why there won't be spent some more time to get it ready for
inclusion upstream. That's more effective than to always be behind and
having to adjust it to new a version.

> > > Since AVR32 is a fairly new architecture, support for it does not exist
> > > in many packages, and maybe some developers want to put their
> > > own effort into bringing more packages online with AVR32 support.
> > > 
> > > > I think if you have AVR32 changes, that shouln't go into
> > > > uclibc-buildroot, then you could always send a patch to the
> > > > avr32-buildroot mailing list or HCE.
> > > 
> > > I do not know of any AVR32 changes which I do not think
> > > should go into uclibc-buildroot.
> > 
> > Then why is it a problem not to have commit access to HCE's repo?
> 
> If I or someone else have a AVR32 patch available that will enable 
> a package to build for the AVR32, then I think it belongs in
> uclibc-buildroot.

I have never objected. But it depends on the type of the patch. A
simple patch that adds some architecture specific configurations
(endian or something) to get it working belongs to uclibc-buildroot. And
even there it can require some investigation to update the patch, if the
source code base has changed. And this investigation should be avoided
with pushing it upstream.

But a huge patch that adds lots of optimization code (mplayer) definetly
belongs to avr32-buildroot.

Markus
