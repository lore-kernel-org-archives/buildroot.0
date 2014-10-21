From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 19:03:57 +0200
Subject: [Buildroot] [PATCH 03/31] arch/arm: add blind options to know
 the ARM architecture
In-Reply-To: <20141019215528.GD12247@free.fr>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141019215528.GD12247@free.fr>
Message-ID: <20141021190357.6982847e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 19 Oct 2014 23:55:28 +0200, Yann E. MORIN wrote:

> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> > index 201ff1d..d2ba924 100644
> > --- a/arch/Config.in.arm
> > +++ b/arch/Config.in.arm
> > @@ -37,6 +37,27 @@ config BR2_ARM_CPU_HAS_THUMB
> >  config BR2_ARM_CPU_HAS_THUMB2
> >  	bool
> 
> Indirectly related to your patch: HAS_THUMB2 should select HAS_THUMB,
> since Thumb-2 is a superset of Thumb.

Right.

> Then, you could just have (for example) BR2_ARM_CPU_ARMV4 and ditch
> BR2_ARM_CPU_ARMV4T since it can be reconstructed from BR2_ARM_CPU_ARMV4
> && HAS_THUMB.
> 
> The reasonning is that few package actually require knowing the exact
> variant, but rather the instruction set generation. Thus knowing about
> armv4t is equivalent to knowing about armv4 for most. Those few that
> actuallt require the Thumb isns would need to use the HAS_THUMB option,
> which very purpose is just that, telling whether thumb is supported or
> not (or HAS_THUMB2 for Thumb-2).
> 
> As for the J version, I wonder if we need to introduce a HAS_JAZELLE
> option. For armv6zk (Wikpedia refer to it as armv6kz), I also doubt we
> need to introduce a HAS_TRUSTZONE option either.

Agreed with all of that.

> For armv7a, I think we
> can just use armv7, since we will probably never support the R and M
> profiles in Buildroot.

But not with that one: I now have a Cortex-M platform, and I hope to do
something with it at some point. And since Cortex-M platforms don't
have a MMU, it's significant difference between ARMv7-A and ARMv7-M.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
