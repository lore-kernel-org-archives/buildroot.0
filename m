From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 08:54:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: disable mpers support
In-Reply-To: <20200907225655.GU14354@scaer>
References: <20200907202410.12228-1-heiko.thiery@gmail.com>
 <20200907225655.GU14354@scaer>
Message-ID: <20200908085449.35e7ec6f@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 8 Sep 2020 00:56:55 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > script searchs for a 32bit compiler. When a matching compiler is found
> > in the PATH some compatiblity checks are done. This can fail when the
> > available kernel headers on host and buildroot target does not match.
> > 
> > Since buildroot does not support 32bit binaries when building for 64bit
> > architecture (no -m32 option) we can disable this option unconditionally.  
> 
> ... but indeed, mpers is not about personalities at all; it is about
> multi-bitness systems. Buildroot does not support building a userland
> for multi-bitness systems.

Absolutely.

> However, some systems may very well run a 64-bit kernel with a 32-bit
> userland. In that case, strace should be able to interpret the syscalls
> made by the process and the replies sent by the kernel, and those are
> done in the bitness of the process, not of the kernel.
> 
> So, we always want an strace that is of the same bitness as the
> userland. And so I indeed think we do not need this ill-named
> multi-personality support of strace.
> 
> Note that some people may however run such multi-bitness systems. But in
> that case, they had to build two userlands, a 32-bit one and a 64-bit
> one, and somehow aggregate the two after the fact. In that case, they
> would bear the responsibility to carry an strace for each bitness.

So, is this an Acked-by for this patch ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
