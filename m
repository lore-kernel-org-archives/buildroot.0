From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 26 Jul 2011 16:14:33 -0500
Subject: [Buildroot] Can't boot with 2011.05
In-Reply-To: <000e01cc4bcd$4094e360$c1beaa20$@com>
References: <000e01cc4bcd$4094e360$c1beaa20$@com>
Message-ID: <201107261614.35874.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue July 26 2011, Sam Nazarko wrote:
> Since the 2011.05 Buildroot release I've not been able to get a bootable
> system even with the simplest of options and I haven't a clue why. In
> 2011.02 if I was to have some simple options of a i386 build platform
> targeting i686 to generate an initramfs system (everything else default,
> kernel with i386 defconfig) the system would boot fine in QEMU or VirtualBox
> and give me a login prompt. Trying a similar approach on 2011.05 either
> chucks a "Adjusting TSC clocksource" and hang or a "ip used greatest stack
> depth" and hang. I assume this is not the actual cause of the hang but what
> I see before the problem, which I think is to do with mounting the root file
> system. 
> 
>  
> 
> I am wondering what's changed that might be causing this,
>

Hard to tell exactly from the information given, but....

I recall that the old default choice for Intel (i386) was changed
to default to i586.
Which was done to support NPTL builds. (cmpxchg instruction used).

Other than that change specific to Buildroot;

Any change in toolchain version;
C library version and/or type of C library;
Any change in kernel version;

Might, anyone of them, cause the problem "as reported".

Mike
>  
> 
> Thanks
> 
>  
> 
> Sam
> 
> 
