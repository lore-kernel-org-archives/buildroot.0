From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Feb 2015 17:06:21 +0100
Subject: [Buildroot] [PATCH v1] qt5base: disable gold linker
In-Reply-To: <20150211153232.2dcd2b32@free-electrons.com>
References: <1423637231-4145-1-git-send-email-ps.report@gmx.net>,
 <20150211153232.2dcd2b32@free-electrons.com>
Message-ID: <trinity-7770b020-1a93-417b-895b-9055bc4acab0-1423670781149@3capp-gmx-bs31>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Mittwoch, 11. Februar 2015 um 15:32 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v1] qt5base: disable gold linker
>
> Dear Peter Seiderer,
> 
> On Wed, 11 Feb 2015 07:47:11 +0100, Peter Seiderer wrote:
> > Fixes [1],[2]:
> > powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized command line option '-fuse-ld=gold'
> > Makefile:1192: recipe for target '../../lib/libQt5Core.so.5.4.0' failed
> 
> The Qt configure script has some logic to detect whether the compiler
> supports -fuse-ld=gold or not. Do you know why this logic is not
> properly working, and not detecting that this specific compiler doesn't
> support this?
> 

No (did not investigate further, disabling gold unconditionally worked for me
for ptxdist/qt-5.4.0)...

> Disabling unconditionally this feature is maybe OK, but I'd like to
> understand why the configure script logic to auto-detect this is not
> working.

O.k, will try (but may last some time)...

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
