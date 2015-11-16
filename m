From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 16 Nov 2015 22:07:22 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc compile
In-Reply-To: <20151116214000.3f33b341@free-electrons.com>
References: <20151115122455.GA29481@waldemar-brodkorb.de>
 <20151116214000.3f33b341@free-electrons.com>
Message-ID: <20151116210722.GG19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sun, 15 Nov 2015 13:24:55 +0100, Waldemar Brodkorb wrote:
> > Like for sparc64, set correct instruction set.
> > Patch is obsoleted by this changeset.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> 
> Is this fixing an actual issue / build failure, or just making the
> Sparc fix nicer ?

It makes the sparc fix nicer, no patch required to disable c3 and
it will use sparcv8 instead sparcv7, which matches more your
targeting sparc systems.
 
> Also, Boost on Sparc still doesn't build properly for me in certain
> configurations. For example:
> 
> BR2_PACKAGE_BOOST_CONTEXT=y
> BR2_PACKAGE_BOOST_COROUTINE=y
> 
> Fails with:
> 
> ...failed gcc.compile.asm bin.v2/libs/context/build/gcc-4.9.3/release/threading-multi/asm/jump_sparc_sysv_elf_gas.o...
> gcc.compile.c++ bin.v2/libs/context/build/gcc-4.9.3/release/threading-multi/unsupported.o
> libs/context/src/unsupported.cpp:7:2: error: #error "platform not supported"
>  #error "platform not supported"

As mentioned in my comment, context/coroutine are not yet supported.
Will need to do some testing and then I will try to get the fixes to
enable it upstream.

best regards
 Waldemar
