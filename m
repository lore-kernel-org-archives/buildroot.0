From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 15:51:22 +0200
Subject: [Buildroot] [PATCH 20/20] external-toolchain: add Sourcery
 CodeBench ARM 2012.03
In-Reply-To: <CAHkwnC8sEW3NSwCKpfMwbGWbJgVQ_zKKga5kRduutvFUnPKNqg@mail.gmail.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <d7731ad73ed06ae83273de4ba302bdaa5d791943.1344706801.git.thomas.petazzoni@free-electrons.com>
 <CAHkwnC8sEW3NSwCKpfMwbGWbJgVQ_zKKga5kRduutvFUnPKNqg@mail.gmail.com>
Message-ID: <20120822155122.2cf57b60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 10:46:49 +0200,
Fabio Porcedda <fabio.porcedda@gmail.com> a ?crit :

> I've discovered only today that this toolchain has already the rpc library...
> so the test fail because the rpc/rpc.h header it's present.
> 
> getting-started.pdf:
> A.1.1. Changes in Sourcery CodeBench Lite 2012.03-57
> ...
> RPC library functions. GLIBC has been changed so that programs may
> again be built to use its
> RPC library functions. The ability to build programs using these
> functions had previously been dis-
> abled.

Argh, so they brought back RPC support into glibc... sigh.

> IMHO there are two solutions:
> a) update this patch to enable the BR2_TOOLCHAIN_HAS_NATIVE_RPC
> b) apply as is directly on the next branch and change accordingly the commit:
> commit 80f89c34315be739c52935f1b0606dc5531e6eb3
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Sat Aug 11 18:50:42 2012 +0200
> 
>     toolchain-external: improve glibc support to test availability of RPC
> 
> Let me know which one solution you prefer.

I'm a bit hesitant here. If newer glibc toolchains re-include the RPC
support, is it worth supporting libtirpc and do all the changes I had
proposed? Or should we just give up and say we only support
glibc toolchains that include RPC support? Maybe not nice, since
libtirpc brings quite a few features compared to in-toolchain RPC
support.

Comments from others?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
