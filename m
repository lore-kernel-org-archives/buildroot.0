From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 22 Aug 2007 22:59:24 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <200708222244.38319.yann.morin.1998@anciens.enib.fr>
References: <1187728137.6145.48.camel@86-115-11-152>
	<20070822191320.GU11697@aon.at> <1187814296.4321.37.camel@86-115-11-28>
	<200708222244.38319.yann.morin.1998@anciens.enib.fr>
Message-ID: <1187816364.4321.63.camel@86-115-11-28>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-08-22 klockan 22:44 +0200 skrev Yann E. MORIN:
> Ulf, Bernhard and All,
> 
> On Wednesday 22 August 2007 22:24, Ulf Samuelsson wrote:
> > If people starting using buildroot had this help, then they could
> > spend their time first building a working filesystem, and then select
> > a specific, non-working package, to debug.
> 
> For what it's worth, here's my point of view.
> 
> When _I_ start from scratch on something I have no previous knowledge of, then
> I tend to build the smallest set I can. In this case, I'd disable everything in
> buildroot, save building the toolchain.
> 
> Once I get that first step right, I start by adding things bit after bit. For
> buildroot, BusyBox looks the most basic thing that can be added to a bare rootfs.
> 
> Again, once this is working, I would get more comfortable to try other things,
> such as adding other tools, for example wireless tools (supposing I'd need that).
> 
> And so on till I get something that doesn't build, which I'd try to debug, submit
> a patch or workaround, and resort to asking help if I can't solve it on my own.
> 
> What I'm trying to say is that someone starting with buildroot and expecting
> to be able to build every and all packages shouldn't be surprised if something
> goes amiss.
> 
> The rule is: divide and rule. Take pieces bit after bit while it works, and
> you get a 'stable' basis to try a new feature. Bash this new feature until it
> works, and start again.
> 
> On a personal experience, I have background that tells me what package to add
> or not in a config. This is becaise I've had previous experience telling me
> that such or such option is valis in such or such circumstances. Those are far
> too complex to express in terms of Kconfig, I'm afraid.
> 
> > If it is known not to build, it is good to communicate this to others.
> 
> But it might build in some cases which are not your daily configted, bn.

Granted, but do we need it to be perfect?, I think not!

I know that openssh does not work due to lack of 64 bit math.
I do not think it works for any architecture.
Why should every newbie try this out for themseleves,
only to find that it does not build...

Much better to hide it from the build, and then let the guy
which really wants it to reenable and debug it.


-- 
Best Regards,
Ulf Samuelsson
