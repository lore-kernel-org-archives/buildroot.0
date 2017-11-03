From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 09:04:21 +0100
Subject: [Buildroot] [PATCH] package/collectd: Specify correct FP layout
 for PowerPC
In-Reply-To: <CAHQ1cqEGDEcCAJ2roAXy6jgzYk2nNaVc8MVCSLBQ--Lw9AEwtQ@mail.gmail.com>
References: <20171031003539.919-1-andrew.smirnov@gmail.com>
 <20171101104256.4da2b465@windsurf>
 <CAHQ1cqEGDEcCAJ2roAXy6jgzYk2nNaVc8MVCSLBQ--Lw9AEwtQ@mail.gmail.com>
Message-ID: <20171103090421.42a6c009@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 16:24:48 -0700, Andrey Smirnov wrote:

> > ifeq ($(BR2_ENDIAN),"BIG")
> > COLLECTD_FP_LAYOUT = endianflip
> > else
> > COLLECTD_FP_LAYOUT = normal
> > endif
> >  
> 
> Yeah, that sounds right. I implemented it PPC-only just because it was
> the only use-case I could test, but if OpenWRT is doing that for every
> big-endian arch, then it makes sens to change my patch to do the same.

Right, but your patch makes ppc64le use endianflip, which isn't correct.

> I looked at that part of config.ac when I was debugging the problem
> and AFACT all "intswap()" does is swapping upper and lower 32-bits of
> a 64-bit word. I can't think of an architecture that would require
> such a transformation and commit that introduced that check in
> collectd didn't have any helpful hints either. Can we limit the scope
> of this fix to big vs. little endian the way you suggested and leave
> the "intswap" case out?

Since OpenWRT doesn't use it either, I agree we will leave this case on
the side, and see if anyone complains about it.

Could you submit an updated patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
