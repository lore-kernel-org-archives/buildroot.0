From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:26:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: new package
In-Reply-To: <20160906203620.4685-1-bernd.kuhls@t-online.de>
References: <20160906203620.4685-1-bernd.kuhls@t-online.de>
Message-ID: <20160912232623.1fc706be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Sep 2016 22:36:20 +0200, Bernd Kuhls wrote:

>  package/ghostscript/objarch.h-aarch64         |  40 ++++++++++
>  package/ghostscript/objarch.h-arm             |  40 ++++++++++
>  package/ghostscript/objarch.h-armeb           |  40 ++++++++++
>  package/ghostscript/objarch.h-i686            |  41 +++++++++++
>  package/ghostscript/objarch.h-microblaze      |  40 ++++++++++
>  package/ghostscript/objarch.h-microblazeel    |  40 ++++++++++
>  package/ghostscript/objarch.h-mips            |  40 ++++++++++
>  package/ghostscript/objarch.h-mips64          |  40 ++++++++++
>  package/ghostscript/objarch.h-mips64el        |  40 ++++++++++
>  package/ghostscript/objarch.h-mipsel          |  40 ++++++++++
>  package/ghostscript/objarch.h-nios2           |  40 ++++++++++
>  package/ghostscript/objarch.h-powerpc         |  40 ++++++++++
>  package/ghostscript/objarch.h-powerpc64       |  40 ++++++++++
>  package/ghostscript/objarch.h-x86_64          |  40 ++++++++++

Since this mess of pre-defined per-architecture header files is really
nasty, could you instead try to package the latest git version of
ghostscript ?

Indeed, since early July, the Git repository includes numerous
cross-compilation fixes, and especially
http://git.ghostscript.com/?p=user/chrisl/ghostpdl.git;a=commitdiff;h=0a44ce497dbf6064981d88953df63bfdfce0a984
which generates the arch.h header using regular configure.ac tests.

This should hopefully greatly simplify the whole problem.

The libtiff directory problem has also been fixed by
http://git.ghostscript.com/?p=user/chrisl/ghostpdl.git;a=commitdiff;h=3d3982f844fed6d6cb092055980900289fb6a402.

But it's not clear which of these have landed in the main Ghostscript
Git repository at http://git.ghostscript.com/?p=ghostpdl.git;a=summary,
unfortunately.

Could you have a look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
