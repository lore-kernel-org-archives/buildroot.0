From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 27 Feb 2017 22:13:13 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170227205923.GE17670@free.fr>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks> <20170227172540.GA17670@free.fr>
 <20170227183016.GC17670@free.fr> <20170227183547.GA1242@megas.kitware.com>
 <20170227205923.GE17670@free.fr>
Message-ID: <1488229993.14030.12.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Ben,

On Mon, 2017-02-27 at 21:59 +0100, Yann E. MORIN wrote:
> Ben, All,
> 
> On 2017-02-27 13:35 -0500, Ben Boeckel spake thusly:
> > On Mon, Feb 27, 2017 at 19:30:16 +0100, Yann E. MORIN wrote:
> > > Of course, this is only for when we build out own cmake, not when
> > > we use
> > > the host pre-installed one. I'll try to see tonight if we can do
> > > similar
> > > for it, too.
> > 
> > It may make sense to support this upstream. CMake already has
> > platform
> > files for things such as Cray and Android (among others) which are
> > just
> > special kinds of Linux, like Buildroot.
> > 
> > How often does that toolchain file change? Or does it depend on
> > Buildroot settings?
> 
> The toolchainfile.cmake is really specific to one build: it contains
> the
> path to the compiler, linker... It contains place-holders that get
> replaced by a sed invocation:
> 
> ????https://git.buildroot.org/buildroot/tree/package/pkg-cmake.mk#n23
> 6
> 
> However, the Modules/Platform/Buildroot.cmake would be just as simple
> as (which is what I use currently):
> 
> ????include(Platform/Linux)
> ????set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
> ????set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
> 
> I don;t see that changing anytime soon. So, if that would be
> aceptable
> for upstream, then we could submit it, yes.
> 
> However, I wonder if that's worth the effort...
> 
> After all, this is a setting specific to us. I would have a hard time
> arguing that upstream cmake should carry all such files for all
> imaginable buildsystems.

I replied to Bard King on the CMake mailing list [1]. From my view,
there is an issue that /sysroot/usr/lib32 is not reported by the linker
or not treated by CMake as an implicit runtime search path. However, I
am neither a CMake nor a toolchain expert...

> And if the solution is that simple and also works for host pre-
> installed
> cmake, then we can carry that ourselves, I believe.

Sounds reasonable!

[1] https://cmake.org/pipermail/cmake/2017-February/065064.html

J?rg
