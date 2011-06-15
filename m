From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 15 Jun 2011 07:28:16 +0000
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
 disable}-{shared, static} automatically
In-Reply-To: <20110615084756.5d787906@skate>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
 <87k4cq7rdq.fsf@macbook.be.48ers.dk> <20110613001630.1281e5c3@skate>
 <874o3t9zs2.fsf@macbook.be.48ers.dk> <20110614085430.3229006e@skate>
 <87wrgn8usg.fsf@macbook.be.48ers.dk> <20110615084756.5d787906@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C603216F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Wednesday, June 15, 2011 1:48 AM
> To: Peter Korsgaard
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 7/8] package/autotools: add --
> {enable, disable}-{shared, static} automatically
> 
> Hello,
> 
> Le Wed, 15 Jun 2011 08:37:19 +0200,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
> 
> >  Thomas> Ok. Thanks a lot for doing this testing!
> >
> > Another more serious issue is that some non-library packages like
> bmon
> > interprete --enable-static as link the binary statically, leading
> to
> > bloat (E.G. ~900KB instead of ~100KB).
> 
> Is --enable-static supposed to have this semantic ? If not, then we
> should fix the package. If yes, then we can fix those packages
> manually
> by adding --disable-static to <pkg>_CONF_OPT, no ?
> 
> Or maybe this isn't worth the trouble after all, and we could just
> use
> --disable-static by default. I'm not personally using static
> linking,
> so adding the production of .a files was just done because it
> appeared
> to be cost-free and could have been useful to some users. So I
> wouldn't
> complain if we decide to revert back to --disable-static for target
> packages.

I need the static libs.  If no one else does, I do.  If you do
something like that, please make it configurable so I can get
back to the old way.

Andy
