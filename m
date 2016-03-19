From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 19 Mar 2016 20:14:49 +0100
Subject: [Buildroot] [PATCH 1/2] m68k: enable internal toolchain
In-Reply-To: <20160319192753.45ac97e3@free-electrons.com>
References: <20160319172656.GA19850@waldemar-brodkorb.de>
 <20160319192753.45ac97e3@free-electrons.com>
Message-ID: <20160319191449.GY21774@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Waldemar,
> 
> On Sat, 19 Mar 2016 18:26:56 +0100, Waldemar Brodkorb wrote:
> > This allows to build a m68k toolchain.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Thanks! One question below, though.
> 
> > diff --git a/arch/Config.in b/arch/Config.in
> > index 401bd28..3f1453f 100644
> > --- a/arch/Config.in
> > +++ b/arch/Config.in
> > @@ -95,7 +95,6 @@ config BR2_i386
> >  config BR2_m68k
> >  	bool "m68k"
> >  	select BR2_ARCH_HAS_MMU_MANDATORY
> 
> Are you sure all the m68k have a MMU ?
> 
> According to https://en.wikipedia.org/wiki/Motorola_68000_series, it
> seems like the MMU appeared in 68030, so 68000, 68010 and 68020
> probably don't have a MMU.
> 
> According to http://www.linux-m68k.org/faq/reqs.html:
> 
>   You need a Motorola 680x0 processor with a programmable memory
>   management unit (PMMU). There is no way to run Linux/m68k without
>   one. This reduces the list of possible processors to 68020+68851,
>   68030, 68040, 68LC040, and 68060. This list of processors excludes
>   the 68000, 68HC000, 68008, 68010, 68EC020, 68EC030, and 68EC040. It
>   also excludes the CPU32 processors (683x0 series) and the ColdFire
>   processor.
> 
> However, I believe this is not completely correct, as Linux definitely
> runs on some Coldfire, as the later variants have gotten a MMU.

Yes, the info is incomplete. I have another Qemu board defconfig available for coldfire
without MMU. But I wait until ARM noMMU stuff is in, as the minimal
busybox config might be interesting here, too.
And some of the later coldfire v4 have a MMU.

So m68k is really complicated and interesting ;)
 
> Maybe to get started you should simply support the 68040 which you have
> tested, and leave the rest for later, once it is understood which
> variant has a MMU, which variant does not?

Yes, that is better. I just copied the old variants without thinking
about it.

best regards
 Waldemar
