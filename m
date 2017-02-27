From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 28 Feb 2017 09:54:39 +1100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <20170227165859.51c786a8@free-electrons.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
 <20170227165859.51c786a8@free-electrons.com>
Message-ID: <20170227225439.GA2535@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 27, 2017 at 04:58:59PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 27 Feb 2017 15:58:54 +0100, Arnout Vandecappelle wrote:
> 
> >  At least, if we do go the qemu-user way, it should always work, so also with
> > musl and uClibc, also if host headers are older than target...
> 
> It simply cannot work with host headers older than the target headers,
> by principle.

Right. I believe it's because what it's doing is translating system
calls from one arch (and kernel version) to another (arch and kernel
version) -- and if the target's headers are newer than the host kernel,
there are new things that need to be translated that have no equivalent
on the host. It's just impossible.

> > But really, cross-compilation doesn't work at all (i.e. qemu is
> > needed), and anyway doesn't work on the unusual architectures where
> > Debian is not available, then I don't think Buildroot is the right
> > way.
> 
> Do you meant "*if* cross-compilation doesn't work at all" ?
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
