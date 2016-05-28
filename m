From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 28 May 2016 17:48:11 +0200
Subject: [Buildroot] [PATCH v2 3/4] gdb: enable simulator support for
 host build
In-Reply-To: <20160528154933.575c86c3@free-electrons.com>
References: <20160513121651.GA30939@waldemar-brodkorb.de>
 <20160528154933.575c86c3@free-electrons.com>
Message-ID: <20160528154811.GJ22609@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 13 May 2016 14:16:51 +0200, Waldemar Brodkorb wrote:
> > Add an option to enable simulator support, so
> > it can be used to test some no-MMU systems.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> It doesn't seem to build on Blackfin for me. I'm not using the internal
> toolchain support that you've added in PATCH 2/4, I'm using the
> defconfig from your PATCH 4/4 with the Blackfin external toolchain. But
> host-gdb is a host package, so the cross-compilation toolchain used
> doesn't matter. And what I get is:
> 
> ./../common/sim-model.c: In function ?model_set?:
> ./../common/sim-model.c:108:3: warning: implicit declaration of function ?CPU_MACH? [-Wimplicit-function-declaration]
>    CPU_MACH (cpu) = MODEL_MACH (model);
>       MODEL_NAME (CPU_MODEL (cpu)),
> make[1]: *** [/home/thomas/projets/buildroot/output/build/host-gdb-7.10.1/.stamp_built] Error 2
> Makefile:36: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> Could you have a look?

I totally forgot about it. See here:
https://www.sourceware.org/ml/gdb/2015-12/msg00029.html

For newer GDB (7.10.1/7.11) we need to use out-of-tree builds. I
only tested with 7.9, I think it was the default by the time I
tested it or I changed it.

How would we change package/gdb to use out-of-tree building?

best regards
 Waldemar
