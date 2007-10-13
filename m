From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sat, 13 Oct 2007 21:58:07 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1192300638.26495.13.camel@elrond.atmel.sweden>
References: <20071012210141.1DF69A5E1B@busybox.net>
	<0710131046500.9729@somehost>
	<1192269439.26495.4.camel@elrond.atmel.sweden>
	<0710131212520.9729@somehost>
	<1192300638.26495.13.camel@elrond.atmel.sweden>
Message-ID: <0710132115250.9729@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Oct 2007, Ulf Samuelsson wrote:

> l?r 2007-10-13 klockan 12:19 +0200 skrev Cristian Ionescu-Idbohrn:
> > On Sat, 13 Oct 2007, Ulf Samuelsson wrote:
> >
> > > l?r 2007-10-13 klockan 10:49 +0200 skrev Cristian Ionescu-Idbohrn:
> > > > On Fri, 12 Oct 2007, ulf at uclibc.org wrote:
> > > >
> > > > > Author: ulf
> > > > > Date: 2007-10-12 14:01:41 -0700 (Fri, 12 Oct 2007)
> > > > > New Revision: 20237
> > > > >
> > > > > Log:
> > > > > Allow library copy to fail
> > > >
> > > > As it's not obvious to me, may I ask why?
> > > > Why not making sure it doesn't fail, instead?
> > >
> > > That is the long term approach, but I have no control over that part.
> >
> > Who has the "control over that part"?
> >
> The guys at Atmel responsible for supporting the AVR32 gcc port...
> They have started to take an interest, but I have no clue
> when a fix will appear.

Sorry if I missed something, but what's the involvement the guys at Atmel
have in this project?  Do they have some sort of maintenance
responsabilities in this project?  Do they sponsor this project in some
way?  Are you working for the guys at Atmel?

> I do not have the bandwidth to dig into this.

I'm realy sorry for you (and for the rest of us using other archs), but
the way you treat the buildroot project is not really acceptable.
If you don't have the bandwidth to do things right, maybe the guys at
Atmel can buy you some more bandwidth so you can do dig and make proper
changes that don't break other archs.

> > > If copying fails,
> >
> > Why should it?
> > Have you seen it failing?
> > Can you reproduce that?
>
> Yes, this is the cause of the failure of the AVR32 tool build.

But doesn't that mean that the AVR32 tool is broken?
What am I missing here?

> It built during the summer, and then suddenly stopped building.

And that means that all other archs that _do build_ must be broken?
Sorry, doesn't make much sense to me :(

> > Is there a use case you can share with us?
> >
>
> Take an older snapshot and try to build AVR32 toolchain.
> The libgcc_s.so.1 does not get built.

Not interested to build any AVR32 toolchain myself.  I'm quite happy if
the other toolchains do build.

> > > then libgcc.a is available,
> > > and the end application can be linked with this instead
> >
> > I see.
> >
> > > It is better than aborting the build.
> >
> > But doesn't cure the disease :(
> > In other words, you prefer aspirine :)
>
> If this ensures that I can run the code on the AVR32
> then it is good enough for me at this point.

What about the rest of us?

> Obviously it is better to ensure that the AVR32 toolchain
> build generates a shared library,

Obviously it is better to ensure that _all_ toolchains build, I'd say.

> and anyone complaining
> are open to develop a patch which fixes the real problem
> instead of the symptom.

So, all other toolchains that occasionally build (until you you break
them) must be broken, and that's not your problem?

All you talk about is AVR32.
You seem to only care about AVR32.
You couldn't care less if you break all other archs with your patches?
Is this fare play?


Cheers,

-- 
Cristian
