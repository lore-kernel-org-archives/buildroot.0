From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 09:04:45 +0200
Subject: [Buildroot] [PATCH] package/netsurf: disallow on archs
 requiring ABI specific CFLAGS
In-Reply-To: <20190531214052.14297-1-peter@korsgaard.com>
References: <20190531214052.14297-1-peter@korsgaard.com>
Message-ID: <20190601090445.44405bb9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 May 2019 23:40:52 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/67ef520d82ea529a9fe593d83a3aeae5f8b0ee5d/
> http://autobuild.buildroot.net/results/eafc3e4be571d5ecee549a11530ac4e508f31782/
> http://autobuild.buildroot.net/results/ba7f30833fef54162a82f4b336a72d6599594526/
> 
> The netsurf build system mixes up host and target CFLAGS, so it isn't
> compatible with architectures where we pass ABI specicif compiler flags (in
> TARGET_ABI).
> 
> Add a _ARCH_SUPPORTS kconfig variable matching the TARGET_ABI logic we have
> in package/Makefile.in, and use it to disallow netsurf for those
> architectures.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I understand the idea, but we need to realize it has some drawbacks:

 - If we add additional flags for some architecture, this will have to
   be updated.

 - If some custom flags are passed in BR2_TARGET_OPTIMIZATION, I would
   assume it would also cause a build failure, no ?

If we really can't remove the package, then I'm fine with this patch as
a stop-gap measure. But I think removing the package is the sanest
thing to do. If anything, removing the package might wake up the people
using it so that they fix it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
