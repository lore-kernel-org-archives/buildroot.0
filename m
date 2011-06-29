From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 29 Jun 2011 08:54:34 -0500
Subject: [Buildroot] problems compiling uclibc for Geode (i386)
In-Reply-To: <1309350574.17457.5.camel@sven>
References: <1309291371.21632.5.camel@bender> <1309350574.17457.5.camel@sven>
Message-ID: <201106290854.36429.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed June 29 2011, Sven Neumann wrote:
> On Tue, 2011-06-28 at 22:02 +0200, Sven Neumann wrote:
> > Hi,
> > 
> > I am currently trying to update our buildroot system to the latest
> > version that I pulled from your git repository yesterday. Things work
> > reasonably well and I have everything compiling fine for the ARM
> > platform. The Geode platform however is causing trouble when it comes to
> > compiling uclibc 0.9.32.
> > 
> > First I had to fix a compile problem by pulling in this patch from the
> > uclibc repository:
> > http://git.uclibc.org/uClibc/patch/?id=8245f3b4638fdff2011c2657af1bb211def704bc
> > 
> > 
> > But now I am stuck with this linker error:
> > 
> >   LD libuClibc-0.9.32.so
> > libc/libc_so.a(err.os):(.text.vwarn_work+0x127): undefined reference to
> > `__lll_unlock_wake_private'
> > collect2: ld returned 1 exit status
> > make[1]: *** [lib/libc.so] Error 1
> > make[1]: Leaving directory
> > `/home/sven/git/buildroot/output/toolchain/uClibc-0.9.32'
> 
> Looks like NPTL support is broken for the generic 386 target. I've
> changed the uclibc configuration to i586 now (in the hope that this will
> work for a Geode processor) and that has fixed above problem for me.
> 

Probably a good starting point although you don't mention __which__ Geode
processor your using.

An older sort of reference but depending on your processor, might still apply:
http://www.larwe.com/technical/geode_linux.html

Mike
> 
> Sven
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
