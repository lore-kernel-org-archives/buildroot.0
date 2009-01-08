From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 08 Jan 2009 23:33:12 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <200901082306.29783.markus.heidelberg@web.de>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901082128.59939.markus.heidelberg@web.de>
	<00b501c971d5$4db0e0a0$dfc4af0a@Glamdring>
	<200901082306.29783.markus.heidelberg@web.de>
Message-ID: <1231453993.9711.27.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-08 klockan 23:06 +0100 skrev Markus Heidelberg:
> Ulf Samuelsson, 08.01.2009:
> > > But when you already put so much stuff into uclibc-buildroot to fully
> > > support AVR32, what's then remaining in HCE's tree and for what reason
> > > this is not put into upstream? With your arguments, HCE doesn't need to
> > > commit to his own repository at all, he could just commit everything
> > > to upstream. The only purpose of his tree then would be having stable
> > > and tested AVR32 releases for the customers.
> > 
> > That is a very important reason for it to exist.
> 
> Yes, it is. But I have the feeling, that in your opinion it is the only
> reason.
> 
> > >> One of the key issues for an AVR32 developer is that they cannot
> > >> commit additions to the Atmel version, so every time
> > 
> > > What's wrong with that? What would they want to commit?
> > 
> > X-Windows for a start...
> > That was committed to Buildroot by John Voltz so he
> > could run X on his AVR32 board.
> > There are plenty of examples.
> 
> In package/x11r7/ there is only one little avr32 patch to support
> xorg-server for this architecture. I think this is fine to be included
> in uclibc-buildroot, as long as it is pushed upstream. I looked at
> Xorg's git web interface and at least in the latest version it is
> included.
> 
> So this is not a good example for a lack-of-commit-access issue with
> HCE's repository.

You forget that  he created the build recipe,,,,,
and he is actually a VERY good example.


> I rather thought of examples like the big mplayer patch. This doesn't
> belong into uclibc-buildroot, but into the AVR32 repo. 


?I am sure you would think otherwise if you were an AVR32 user.
 
> And as I said
> earlier: without commit access just send a patch to HCE. I'm sure he
> would be glad to apply it to get more packages working with/optimized
> for AVR32.

The best way to have it upgraded, I guess is to 
update the mplayer version.
Then HCE will detect that mplayer will not build
and the patch will be have to be rebased on the new version.
You will of course see a new AVR32 patch quite soon in uclibc-buildroot.

It is also creating more work to do the same thing.




> > Since AVR32 is a fairly new architecture, support for it does not exist
> > in many packages, and maybe some developers want to put their
> > own effort into bringing more packages online with AVR32 support.
> > 
> > > I think if you have AVR32 changes, that shouln't go into
> > > uclibc-buildroot, then you could always send a patch to the
> > > avr32-buildroot mailing list or HCE.
> > 
> > I do not know of any AVR32 changes which I do not think
> > should go into uclibc-buildroot.
> 
> Then why is it a problem not to have commit access to HCE's repo?

If I or someone else have a AVR32 patch available that will enable 
a package to build for the AVR32, then I think it belongs in
uclibc-buildroot.




> Markus
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
