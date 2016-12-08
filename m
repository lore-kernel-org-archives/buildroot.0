From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 23:06:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: new package
In-Reply-To: <20160912232623.1fc706be@free-electrons.com>
References: <20160906203620.4685-1-bernd.kuhls@t-online.de>
 <20160912232623.1fc706be@free-electrons.com>
Message-ID: <20161208230606.64ce147c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 23:26:23 +0200, Thomas Petazzoni wrote:

> Since this mess of pre-defined per-architecture header files is really
> nasty, could you instead try to package the latest git version of
> ghostscript ?
> 
> Indeed, since early July, the Git repository includes numerous
> cross-compilation fixes, and especially
> http://git.ghostscript.com/?p=user/chrisl/ghostpdl.git;a=commitdiff;h=0a44ce497dbf6064981d88953df63bfdfce0a984
> which generates the arch.h header using regular configure.ac tests.
> 
> This should hopefully greatly simplify the whole problem.
> 
> The libtiff directory problem has also been fixed by
> http://git.ghostscript.com/?p=user/chrisl/ghostpdl.git;a=commitdiff;h=3d3982f844fed6d6cb092055980900289fb6a402.
> 
> But it's not clear which of these have landed in the main Ghostscript
> Git repository at http://git.ghostscript.com/?p=ghostpdl.git;a=summary,
> unfortunately.
> 
> Could you have a look into this?

Could you please rework your patch to use the latest Git version of
ghostscript? It has commit
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=c3c4bf022a631be939ebb4bf6f59e41514cb1e48
which simplifies things a lot:

 - No need to build host-ghostscript
 - No need for hardcoded architecture headers

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
