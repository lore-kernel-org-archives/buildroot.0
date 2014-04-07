From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 7 Apr 2014 08:43:37 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-05
In-Reply-To: <20140407132720.699be504@skate>
References: <20140406063010.119BC100CBA@stock.ovh.net>
 <20140406110837.45baff8e@skate> <20140407111824.GA544@arch.cereza>
 <20140407132720.699be504@skate>
Message-ID: <20140407114337.GB544@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 07, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Mon, 7 Apr 2014 08:18:24 -0300, Ezequiel Garcia wrote:
> > On Apr 06, Thomas Petazzoni wrote:
> > > >      nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/c32ad4bac5f651502e551f7733f702afaa0e742a/
> > > 
> > > Ezequiel, can you look into this?
> > > 
> > 
> > Ah, yes. Known issue. The kernel headers exported to userspace by the Sourcery
> > toolchain are completely broken. Seems like they used "cp" instead of
> > "make headers_install".
> 
> Ok.
> 
> > If we want to fix headers in an external toolchain, this issue and others like
> > it will get fixed.
> 
> I'm not sure to understand what you mean here, however.
> 

OK, let me try to explain this better. If we have a (not too dirty) way of
running some script over the linux headers after an external toolchain has
been installed, we can "sanitize" them.

In other words, we'd be doing the "make headers_install" sed magic ourselves,
given the Sourcery people forgot about it.

Maybe adding something to toolchain-external.mk would work?
Let me do some tests to see if this works.
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
