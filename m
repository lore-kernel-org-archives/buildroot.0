From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Wed, 10 Sep 2014 13:28:59 +0000
Subject: [Buildroot] [PATCH] arc: Fix warning if atomics are selected
In-Reply-To: <20140910151910.2e29889e@free-electrons.com>
References: <1410353187-16974-1-git-send-email-Anton.Kolesov@synopsys.com>
 <20140910151910.2e29889e@free-electrons.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356D1ECC4@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

defconfig is pretty simple:

BR2_arcle=y
BR2_ARC_ATOMIC_EXT=y

When I do anything with such configuration (like savedefconfig or menuconfig), I observe the following warning:

warning: (BR2_ARC_ATOMIC_EXT) selects BR2_ARCH_HAS_ATOMICS 
which has unmet direct dependencies (BR2_arm || BR2_armeb || BR2_aarch64 
|| BR2_avr32 || BR2_bfin || BR2_m68k || BR2_microblazeel || BR2_microblazebe
|| BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || BR2_nios2 ||
BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_sh || BR2_sh64
|| BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_xtensa)

That is using current master branch.

Anton


> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 10 September 2014 17:19
> To: Anton Kolesov
> Cc: buildroot at uclibc.org
> Subject: Re: [Buildroot] [PATCH] arc: Fix warning if atomics are selected
> 
> Dear Anton Kolesov,
> 
> On Wed, 10 Sep 2014 16:46:27 +0400, Anton Kolesov wrote:
> 
> > If atomic instructions were selected for ARC, there was a warning, like:
> > "(BR2_ARC_ATOMIC_EXT) selects BR2_ARCH_HAS_ATOMICS which has
> unmet direct
> > dependencies". This patch removes the reason of this warning by adding a
> > respective configuration entry.
> >
> > Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> > ---
> >  arch/Config.in.arc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> > index 8a7f290..d2ccf09 100644
> > --- a/arch/Config.in.arc
> > +++ b/arch/Config.in.arc
> > @@ -1,3 +1,6 @@
> > +config  BR2_ARCH_HAS_ATOMICS
> > +	bool
> 
> No. This option is already defined in arch/Config.in. There's no point
> in redefining it anywhere else.
> 
> Can you give me a .config that shows the warning you had?
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
