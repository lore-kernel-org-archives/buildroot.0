From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 13 Oct 2007 20:37:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <0710131212520.9729@somehost>
References: <20071012210141.1DF69A5E1B@busybox.net>
	<0710131046500.9729@somehost>
	<1192269439.26495.4.camel@elrond.atmel.sweden>
	<0710131212520.9729@somehost>
Message-ID: <1192300638.26495.13.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-10-13 klockan 12:19 +0200 skrev Cristian Ionescu-Idbohrn:
> On Sat, 13 Oct 2007, Ulf Samuelsson wrote:
> 
> > l?r 2007-10-13 klockan 10:49 +0200 skrev Cristian Ionescu-Idbohrn:
> > > On Fri, 12 Oct 2007, ulf at uclibc.org wrote:
> > >
> > > > Author: ulf
> > > > Date: 2007-10-12 14:01:41 -0700 (Fri, 12 Oct 2007)
> > > > New Revision: 20237
> > > >
> > > > Log:
> > > > Allow library copy to fail
> > >
> > > As it's not obvious to me, may I ask why?
> > > Why not making sure it doesn't fail, instead?
> >
> > That is the long term approach, but I have no control over that part.
> 
> Who has the "control over that part"?
> 
The guys at Atmel responsible for supporting the AVR32 gcc port...
They have started to take an interest, but I have no clue
when a fix will appear.

I do not have the bandwidth to dig into this.

> > If copying fails,
> 
> Why should it?
> Have you seen it failing?
> Can you reproduce that?

Yes, this is the cause of the failure of the AVR32 tool build.
It built during the summer, and then suddenly stopped building.

> Is there a use case you can share with us?
> 

Take an older snapshot and try to build AVR32 toolchain.
The libgcc_s.so.1 does not get built.

> > then libgcc.a is available,
> > and the end application can be linked with this instead
> 
> I see.
> 
> > It is better than aborting the build.
> 
> But doesn't cure the disease :(
> In other words, you prefer aspirine :)

If this ensures that I can run the code on the AVR32
then it is good enough for me at this point.
Obviously it is better to ensure that the AVR32 toolchain
build generates a shared library, and anyone complaining
are open to develop a patch which fixes the real problem
instead of the symptom.


> 
> Cheers,
> 
-- 
Best Regards
Ulf Samuelsson
Atmel Nordic AB
