From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:54:28 +0100
Subject: [Buildroot] [PATCH 0/4] Add go language support
In-Reply-To: <1456958592.13916.50.camel@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
 <20160302214959.419006f6@free-electrons.com>
 <1456955234.13916.34.camel@infradead.org>
 <20160302231804.31fe7c87@free-electrons.com>
 <1456958592.13916.50.camel@infradead.org>
Message-ID: <20160302235428.205fa042@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoff,

On Wed, 02 Mar 2016 14:43:12 -0800, Geoff Levand wrote:

> On Wed, 2016-03-02 at 23:18 +0100, Thomas Petazzoni wrote:
> > I took a quick look at this.  Patch 1, which builds the go
> > > complier, has the bootstrap and final compiler built in the
> > > same package.  I think it better to split the bootstrap out
> > > into its own package as I have done since then the two packages
> > > are each then simpler and I think easier to maintain.
> > 
> > I'll have a look at this specific aspect. Having two packages that use
> > the same source is not always the best solution, but I'll have a look.
> 
> Just to mention it, the two use different source versions, 1.4.3
> for the bootstrap, and 1.5.3 (currently) for the final compiler.

Yeah, I just discovered this while reviewing your patches. In this
case, it definitely makes sense. I forgot that the 1.5 Go compiler had
some parts of it in Go, and therefore needed a previous Go compiler.

> > > OK. As I said, what I would like to see is one single patch series that
> > contains the full support, and that is approved by the interested
> > parties (you, Ludovic and Christian). The Buildroot maintainers cannot
> > be expert in all topics, and diving into the Go topic would require
> > quite some time. So I'd like to see a single patch series acknowledged
> > by all parties so that we can have some good confidence that it does
> > things the right way.
> > 
> > Of course, it can also be two separate patch series: one from you with
> > the core Go stuff (acknowledged by Christian and Ludovic), and another
> > from Ludovic with the Go package infrastructure (acknowledged by you
> > and Christian).
> 
> I understand your need to have these things reviewed by the interested
> parties.  I will work towards the consensus.

Thanks a lot!

On my side, I reviewed your patches. There are a few comments/issues,
but nothing major. Overall it looks fairly simple and straightforward.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
