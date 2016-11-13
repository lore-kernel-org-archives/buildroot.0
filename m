From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 09:53:04 +0100
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <20161112210140.GA3700@free.fr>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
 <20161111150017.29e032b5@free-electrons.com>
 <20161112210140.GA3700@free.fr>
Message-ID: <20161113095304.3dcd95f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 22:01:40 +0100, Yann E. MORIN wrote:

> > > Yann, you added this dependency in commit f443386c5d. Is that the right fix?  
> 
> Not really: if VFPv3 is enabled, so is VFPv2, see the conditions:
> 	https://git.buildroot.org/buildroot/tree/arch/Config.in.arm#n21
> 
> and see the reasons below...
> 
> > I'm wondering if BR2_ARM_CPU_HAS_VFPV3 shouldn't select
> > BR2_ARM_CPU_HAS_VFPV2, and ditto for V4 selecting V3.  
> 
> Unless I'm mistaken, that's already the case, and has been so at least
> since 2013:
> 
>     5f959a1c arch: improve ARM floating point support and add support for EABIhf
> 
>    21 config BR2_ARM_CPU_HAS_VFPV3
>    22 	bool
>    23 	select BR2_ARM_CPU_HAS_VFPV2
>    [--SNIP--]
>    30 config BR2_ARM_CPU_HAS_VFPV4
>    31 	bool
>    32 	 select BR2_ARM_CPU_HAS_VFPV3

I don't see how I could miss this. But then, why did Lijun had issues
selecting NodeJS, and Baruch proposal to add || BR2_ARM_CPU_HAS_VFPV3
solved it?

We need to look into this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
