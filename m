From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:17:58 +0200
Subject: [Buildroot] [PATCH 1/4] arch: add option to disable internal
 toolchain backend
In-Reply-To: <20170902201010.GD3396@scaer>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
 <5326fe3900e51f3b0a2ac4fc9d750245d560802c.1504381100.git.yann.morin.1998@free.fr>
 <20170902214704.0a01ba92@windsurf.lan>
 <20170902201010.GD3396@scaer>
Message-ID: <20170902221758.284de319@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Sep 2017 22:10:10 +0200, Yann E. MORIN wrote:

> > I'm not a big fan of the option name. What about:  
> 
> Oh, neither am I, neither am I. You know well that I am very bad at
> finding good names. ;-)

No problem, that's what reviews are made for!

> > So, arches can select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT, and else
> > we can "depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT".  
> 
> I also thought about doing so, yes, but is it really necessary to
> introduce two blind options just to have a positive logic in the only
> location we need it?

Yeah, I also thought about this. It's true that the positive symbol is
going to be used only in one place, and it's the negative symbol (the
one being selected) that will be used in most places.

So perhaps you're right, and having both hidden booleans is not that
useful.

> > Now that I think of it: we have dropped the Blackfin ADI external
> > toolchain. Therefore, we currently have no in-tree solution to use/test
> > bf606, bf607, bf608, etc. Perhaps we should drop them instead ?  
> 
> As already said: I don;t care about bfin, so I'm fine with dropping
> those bfin cores. But we'd still need BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
> and BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT for the rest, no?

Yes, we would still need them. I'm not at all saying that your patch
series is not useful, I'm just saying that for Blackfin, dropping
support for those cores is better :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
