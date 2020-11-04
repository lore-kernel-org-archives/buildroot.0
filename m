From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2020 19:24:52 -0800
Subject: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
In-Reply-To: <20201103214344.65ac36cf@windsurf.home>
References: <20201023093641.619746-1-raj.khem@gmail.com>
 <20201103201640.GI2887157@scaer>
 <CAMKF1sodESjxJAwwJ9i5tFuU1j5dzL0cNx42FB97SSQYwEzpYA@mail.gmail.com>
 <20201103214344.65ac36cf@windsurf.home>
Message-ID: <CAMKF1srPCu8xV8d7xXSupMt_Ge5e+YpVVz+pZ-xAOFDbzb4J2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 3, 2020 at 12:43 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 3 Nov 2020 12:25:25 -0800
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > >   - Buildroot does not officially support distributions' cross
> > >     toolchains, as they may contain extra libraries that are not
> > >     accoutned for by Buildroot,
> >
> > yes that's fine, this patch does not claim to support all of them
> > either, it just
> > makes the situation a bit better without regressing the supported usecases
> > I think it helps lowering the build times on such distros for
> > developers and improve
> > first time experience
>
> This has not clarified things for me. Most distributions allow extra
> libraries to be installed in their cross-toolchains, i.e on Debian, you
> can install libxml2, zlib, and zillions of other libraries
> cross-compiled into your cross-compilation toolchain.

right, this change is only using compiler and compiler runtime
(headers+libs) from those toolchains, everything else is built by
buildroot.
so there is clear separation since --sysroot would point to BR created
sysroot for all target libs. I will install an additional lib and see
how that pans out.

>
> Then things are confusing for Buildroot: when it copies the sysroot, it
> already contains more than just the C library... potentially libraries
> that will conflict with libraries that Buildroot will build.

>
> I don't see how this can work reliably.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
