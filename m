From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 12:12:45 +0200
Subject: [Buildroot] [PATCH 2/2] arch/Config.in: Allow ARM to select
 BR2_BINFMT_FLAT
In-Reply-To: <5229A990.7080906@zacarias.com.ar>
References: <1378262598.32360.5.camel@phoenix>
 <1378262667.32360.6.camel@phoenix> <20130905234841.3bbfe0d4@skate>
 <CAAXf6LVLhC7LiuXTcSY+Rmyy_jt6ec37cU4S_4a=j=CpUs1qbA@mail.gmail.com>
 <20130906082537.08818fba@skate> <5229A990.7080906@zacarias.com.ar>
Message-ID: <20130906121245.565c2208@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 06 Sep 2013 07:08:16 -0300, Gustavo Zacarias wrote:
> On 09/06/2013 03:25 AM, Thomas Petazzoni wrote:
> 
> > On Fri, 6 Sep 2013 03:08:10 +0200, Thomas De Schampheleire wrote:
> > 
> >> Don't we/shouldn't we have something like ARCH_HAS_MMU and/or
> >> ARCH_SUPPORTS_FLAT_BINARY?
> > 
> > Yes, we should probably have something like this (and ditto for other
> > binary formats: ELF, FDPIC and so on).
> 
> On a side note, remember that HAS_MMU doesn't mean it's using it - from
> what i've read you can use MMU-bearing processors to test uclinux
> MMU-less scenarios (dunno if it can be done with every SOC out there,
> probably depends on the linux support for each one, at least a couple of
> Atmel ones were used this way for testing and/or masochism).

Right. We could distinguish what the hardware is capable of (i.e
BR2_HAS_MMU vs. !BR2_HAS_MMU) and what the user wants to do
(BR2_USE_MMU vs. !BR2_USE_MMU). Of course, BR2_USE_MMU depends on
BR2_HAS_MMU. That said, until now, we've been hiding BR2_USE_MMU on
many architectures for which !MMU doesn't exist/isn't supported. On
ARM, I believe it doesn't make much sense to expose !MMU for
MMU-capable variants.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
