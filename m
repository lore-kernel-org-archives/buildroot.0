From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 7 Apr 2014 09:10:57 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-05
In-Reply-To: <20140407134643.591875e7@skate>
References: <20140406063010.119BC100CBA@stock.ovh.net>
 <20140406110837.45baff8e@skate> <20140407111824.GA544@arch.cereza>
 <20140407132720.699be504@skate> <20140407114337.GB544@arch.cereza>
 <20140407134643.591875e7@skate>
Message-ID: <20140407121057.GD544@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 07, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Mon, 7 Apr 2014 08:43:37 -0300, Ezequiel Garcia wrote:
> 
> > OK, let me try to explain this better. If we have a (not too dirty) way of
> > running some script over the linux headers after an external toolchain has
> > been installed, we can "sanitize" them.
> > 
> > In other words, we'd be doing the "make headers_install" sed magic ourselves,
> > given the Sourcery people forgot about it.
> > 
> > Maybe adding something to toolchain-external.mk would work?
> > Let me do some tests to see if this works.
> 
> We can certainly do some magic in toolchain-external.mk for specific
> toolchains. I just hope the magic is not too horrible :-)
> 

I'm on it.

On the other side, I should really stop fooling around and prepare a mail
asking about these toolchain issues to the Sourcery guys. I'm sorry for being
so lazy with this!

And while we are here... upstream binutils and GCC supports Nios-II,
unfortunately, glibc and uclibc doesn't (well, uclibc supports threadless,
non shared libraries and non-MMU).

The problem with this, is that Altera is forced to move from a custom
syscall ABI to the generic syscall ABI, before upstreaming the kernel and libc
ports. So, I wouldn't count on this being upstreamed anytime soon.
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
