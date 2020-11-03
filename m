From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 21:43:44 +0100
Subject: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
In-Reply-To: <CAMKF1sodESjxJAwwJ9i5tFuU1j5dzL0cNx42FB97SSQYwEzpYA@mail.gmail.com>
References: <20201023093641.619746-1-raj.khem@gmail.com>
 <20201103201640.GI2887157@scaer>
 <CAMKF1sodESjxJAwwJ9i5tFuU1j5dzL0cNx42FB97SSQYwEzpYA@mail.gmail.com>
Message-ID: <20201103214344.65ac36cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 3 Nov 2020 12:25:25 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> >   - Buildroot does not officially support distributions' cross
> >     toolchains, as they may contain extra libraries that are not
> >     accoutned for by Buildroot,
> 
> yes that's fine, this patch does not claim to support all of them
> either, it just
> makes the situation a bit better without regressing the supported usecases
> I think it helps lowering the build times on such distros for
> developers and improve
> first time experience

This has not clarified things for me. Most distributions allow extra
libraries to be installed in their cross-toolchains, i.e on Debian, you
can install libxml2, zlib, and zillions of other libraries
cross-compiled into your cross-compilation toolchain.

Then things are confusing for Buildroot: when it copies the sysroot, it
already contains more than just the C library... potentially libraries
that will conflict with libraries that Buildroot will build.

I don't see how this can work reliably.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
