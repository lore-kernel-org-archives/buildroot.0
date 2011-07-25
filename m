From: Dominic Newton <dominic.newton@in-2-technology.co.uk>
Date: Mon, 25 Jul 2011 13:27:24 +0100
Subject: [Buildroot] dbg problem with threads
In-Reply-To: <BAY148-W188B7918A758222B68A18DBA330@phx.gbl>
References: <BAY148-W188B7918A758222B68A18DBA330@phx.gbl>
Message-ID: <4E2D612C.3060805@in-2-technology.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check your target, I find uClibc's thread support for i386 can throw up 
some issues. Try compiling for something like i486 or i586 if your 
system can run that type of processor.

I've found this often solves all manner of thread problems, but I 
haven't tried this for gdb.

Dominic Newton

On 25/07/2011 12:39, andrew Parker wrote:
> Hi,
>
> I?m unable to debug with threads under the Buildroot-2010.11.
>
> I tried dozens of combinations, but I get always errors when I try to debug.
>
> Obviously the next options are always activated in the configuration files:
>
> Menuconfig:
>
> -Thread library debbuging
>
> -Build gdb debugger for the Target
>
> -Build gdb server for the Target
>
> -Build gdb for the host
>
> Uclibc-menuconfig:
>
> -Build pthreads debugging support
>
> -Build uClibc with debugging symbols
>
> The target is i386
>
> The gcc version is 4.3.6
>
> The gdb version is6.8
>
> The uClibc is 0.9.31
>
> I tried also with newest Buildroot release, with the same result.
>
> The gdb always says the same:
>
> ? cannot initialize thread debugging library: generic error?
>
> And other data is that the when the gdb starts, the line ?This GDB was
> configured as:?.? does not have any mention to the thread library.
>
> In the /lib folder I have:
>
> libpthread-0.9.31.so
>
> libthread_db-0.9.31.so
>
> Any knows any trick for this?
>
> Thanks.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
