From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:18:04 +0100
Subject: [Buildroot] [PATCH 0/4] Add go language support
In-Reply-To: <1456955234.13916.34.camel@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
 <20160302214959.419006f6@free-electrons.com>
 <1456955234.13916.34.camel@infradead.org>
Message-ID: <20160302231804.31fe7c87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoff,

On Wed, 02 Mar 2016 13:47:14 -0800, Geoff Levand wrote:

> >   http://lists.busybox.net/pipermail/buildroot/2016-February/151550.html
> >   (from Ludovic Guegan)
> 
> I took a quick look at this.  Patch 1, which builds the go
> complier, has the bootstrap and final compiler built in the
> same package.  I think it better to split the bootstrap out
> into its own package as I have done since then the two packages
> are each then simpler and I think easier to maintain.

I'll have a look at this specific aspect. Having two packages that use
the same source is not always the best solution, but I'll have a look.

> Also, this implementation does not build cross compilers
> correctly, nor does it install the go pkg and tools, nor does
> it enable CGO_ENABLED for C language linkage support.
> 
> All in all, think my patches seem more complete in adding
> go compiler support.
> 
> I think the other patches in Ludovic's series can be considered
> independent of the go compiler.  Patch 4 which adds pkg-golang.mk
> is something needed.  I had planned to look into this.

OK. As I said, what I would like to see is one single patch series that
contains the full support, and that is approved by the interested
parties (you, Ludovic and Christian). The Buildroot maintainers cannot
be expert in all topics, and diving into the Go topic would require
quite some time. So I'd like to see a single patch series acknowledged
by all parties so that we can have some good confidence that it does
things the right way.

Of course, it can also be two separate patch series: one from you with
the core Go stuff (acknowledged by Christian and Ludovic), and another
from Ludovic with the Go package infrastructure (acknowledged by you
and Christian).

> I did see this is now out of date, building go compiler version
> 1.4.2.  It also doesn't seem to install the go tools.  To bring
> these up to date would need almost a complete re-write since
> the current compiler now requires a bootstrap compiler.  I
> think my patches superseed this series.

OK. I'll mark Christian's patch as Superseded then.

> My proposal is to use my patches to provide the basic go compiler
> support.  Ludovic's other patches provide additional language
> support, and seem as though they could be useful, but they are
> additions to the basic compiler support, and I think can be
> considered independently.
> 
> Is my proposal acceptable?  Let's work to move forward.

It is acceptable to me, but please work with Ludovic and Christian to
get to a point where they can give their Acked-by to your patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
