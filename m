From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 21:38:56 +0200
Subject: [Buildroot] package/linux/Makefile.in does not
	include	'openswan' patches
In-Reply-To: <20070723164124.GA9995@aon.at>
References: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
	<20070723132936.GB7902@aon.at> <20070723142207.GA9324@aon.at>
	<000401c7cd42$28b0cec0$dcc4af0a@atmel.com>
	<20070723164124.GA9995@aon.at>
Message-ID: <1185219536.21840.66.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-23 klockan 18:41 +0200 skrev Bernhard Fischer:
> On Mon, Jul 23, 2007 at 05:19:36PM +0200, Ulf Samuelsson wrote:
> >> On Mon, Jul 23, 2007 at 03:29:36PM +0200, Bernhard Fischer wrote:
> >>>On Mon, Jul 23, 2007 at 03:11:26PM +0200, Ulf Samuelsson wrote:
> >>>>The Kernel Headers buildscript applies the openswan patches 
> >>>>on top of the kernel headers, but the target/linux/Makefile.in does not.
> >>>
> >>>The headers (which used the very same sourcedir, dunno if it still does
> >>>with your toolchain/linux* stuff) have to be patched. To achieve this,
> >>>we patch the source before installing the headers.
> >>>>
> >>>>Isn't this a bug?
> >>>
> >>>I don't understand? You can't apply patches twice, if you mean to
> >>>suggests this (you most likely don't, i assume).
> >> 
> >> ok, you broke building a linux kernel.
> >> 
> >
> >No, Stephen did...
> >He patched the linux makefile with the BSP patch.
> >Please give the credit where it is due.
> 
> Please accept my apologies. This BSP stuff should not have been applied
> in it's current incarnation :(

We need eventually to move to using the BSP for the Linux,
but it needs to be tested thoroughly.
I will move pre-your-revert target/linux/Makefile.in
to target/linux-experimental/Makefile.in so 
that we can continue testing.
 
Again, the package/linux.mk was broken well before that
and only worked properly if the kernel and the kernel-headers
was the same, and applying the BSP patch on top of the linux.mk
was therefore a good thing, because it ironed out an existing
nasty bug, even if it caused hassle for You and others
using the same kernel + headers.

Best Regards,
Ulf Samuelsson
