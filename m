From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 17:51:14 +0100
Subject: [Buildroot] libglib2 (or maybe libffi) build failure
In-Reply-To: <529621B0.60106@newflow.co.uk>
References: <52960F8C.5040003@newflow.co.uk> <20131127171511.2abd4873@skate>
 <52961D17.6020904@newflow.co.uk> <20131127173755.6019dd2f@skate>
 <529621B0.60106@newflow.co.uk>
Message-ID: <20131127175114.619d17d5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mark Jackson,

On Wed, 27 Nov 2013 16:45:36 +0000, Mark Jackson wrote:

> > Ok. What does libffi.pc contains?
> 
> $ cat output/staging/usr/lib/pkgconfig/libffi.pc 
> prefix=/usr
> exec_prefix=/usr
> libdir=${exec_prefix}/lib
> 
> Name: libffi
> Description: Library supporting Foreign Function Interfaces
> Version: 3.0.13
> Libs: -L${libdir} -lffi

Looks somewhat sane to me.


> > However here, I see:
> > 
> > PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/mpfj/buildroot/output/host/usr/bin
> > 
> > So you have /home/mpfj/buildroot/output/host/usr/bin but the failing
> > build takes place in /home/mpjf/buildroot-bt/.
> > 
> > Can you remove /home/mpfj/buildroot/output/host/usr/bin from your PATH
> > and try again?
> > 
> > To be honest, I don't quite see why this would be causing problems, but
> > that's the only possibly "odd" thing that I see in your
> > configuration/setup for the moment.
> 
> Still fails ...

Gaah. So, the next debugging step is:

strace -s 512 -o foo.log -f ./output/host/usr/bin/pkg-config --list-all

and then pastebin the contents of foo.log. We'll see where it looks for
its .pc file, whether it looks or not for libffi.pc, etc.

Thanks :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
