From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Dec 2015 10:45:54 +0100
Subject: [Buildroot] [PATCH v2] musl: add a sys/queue.h implementation
In-Reply-To: <1449017908-7935-1-git-send-email-sergio.prado@e-labworks.com>
References: <1449017908-7935-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151202104554.1c667515@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Tue,  1 Dec 2015 22:58:28 -0200, Sergio Prado wrote:
> Musl does not provide a 'sys/queue.h' implementation, and this has been
> a problem for packages that depend on it.
> 
> So lets create a package called netbsd-queue that will install a
> 'sys/queue.h' in the staging directory when enabled, based on the
> NetBSD implementation.
> 
> Musl toolchain and external toolchain packages will depend on this
> package, so that 'sys/queue.h' will be always installed when compiling
> with a musl based toolchain.
> 
> Tested on ARM and x86 in the following cases:
>   - Buildroot musl toolchain.
>   - External musl toolchain without 'sys/queue.h'.
>   - External musl toolchain with 'sys/queue.h'.
> 
> Fixes:
> http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e
> 
> And possibly many others.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

From a quick look, it looks good. Can you chase down the packages that
had their own workaround for the lack of queue.h ?

At the moment, I see only libtirpc, but I might have missed others. If
you could prepare a patch for those packages to make them use the now
globally available queue.h, it would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
