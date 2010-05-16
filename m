From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 16 May 2010 06:45:54 -0500
Subject: [Buildroot] FYI: Re: Conflicting types for getline
In-Reply-To: <m3ocgg87pn.fsf_-_@HayekU.fritz.box>
References: <7085C89ACBD47E4B947F91A84B9EA9240C1CF914C3@EXCHANGE31.staff.main.ntu.edu.sg>
	<87ljjs5s2f.fsf@macbook.be.48ers.dk>
	<m3ocgg87pn.fsf_-_@HayekU.fritz.box>
Message-ID: <201005160645.56518.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun May 16 2010, Jochen+busybox at hayek.name wrote:
> >>>>> "PK" == Peter Korsgaard <jacmet-2zL2ArBv0bUdnm+yROfE0A@public.gmane.org> writes:
> 
> >>>>> "TCWP" == Teng Chee Wan Philip <tcheewan-HU4z9rI8l8CLvajZxc+D7Q@public.gmane.org> writes:
> 
>     TCWP> Hi,
>     TCWP> I encountered an error running make for buildroot.  
>     TCWP> Any ideas?  
>     TCWP> Thanks in advance.
> 
>     PK> That's a known problem 
> 
> Oh, good to know ;-)
> 
>     PK> when you try to use older Linux kernels on new distributions.
> 
>     PK> Select a newer version (>2.6.28) for the Linux kernel headers
>     PK> and it should work.
> 
> Well, Peter,
> I am facing the same problem as Teng Chee Wan Philip did then.
> And I am not really free in my choice regarding the kernel.
> 
> My pretty brand new Internet router ("AVM FRITZ!Box 7390") is using a 2.6.19.2 Linux kernel,
> and I can't really rebuild the entire thing,
> as they only tell us, on what open source it's based,
> and they don't publish their extensions.
> 
>     root at fritz.fonwlan.box(fb7390) # uname -a
>     Linux fritz.fonwlan.box 2.6.19.2 #4 Fri Mar 26 17:10:43 CET 2010 mips unknown
> 
>     root at fritz.fonwlan.box(fb7390) # cat /proc/cpuinfo 
>     system type             : Ikanos Fusiv Core
>     processor               : 0
>     cpu model               : MIPS 24K V4.12
>     BogoMIPS                : 330.75
>     wait instruction        : yes
>     unaligned_instructions  : 2845982
>     microsecond timers      : yes
>     tlb_entries             : 64
>     extra interrupt vector  : yes
>     hardware watchpoint     : yes
>     ASEs implemented        : mips16 dsp
>     VCED exceptions         : not available
>     VCEI exceptions         : not available
> 
> I want to be able to mount ext2 partitions on external disks,
> and not just vfat partitions,
> so I want to grab the ext2.ko from your build
> and "insmod" it in my devices kernel.
> 
> 
> They actually supply us with the kernel sources,
> they use for building their device,
> and I have no idea, whether they really changed it.
> Of course, I know how to do a "diff -r" on their kernel and the vanilla 2.6.19.2 ...
> 
> So now with your software
> I actually also didn't find a way to tell it,
> how to use a custom kernel, that I already have on my disk.
> 
> And "here" you are also telling us,
> there is a problem with buildroot regarding the kernel to be built resp.  how new it is.
> 
> Well, whatever!
> Either I use your software, which so far seems to lack a few features resp. suffers from a few minor deficits,
> or I need to build a cross-compiler and then the kernel with that cross-compiler all by myself.
> 
> 
> Now in this light -- do you see any chance for me to get this job done?
> 

Try here:
http://minimodding.com

We do almost exclusively MIPS, primarily 24K

And we are dealing with similar problems with the MultiMedia SoC chips -
the factory is building on 2.6.12.4 and we want something newer.

Or (just so you don't think my site is the only place)
OpenWRT and OpenEmbedded projects support MIPS.

Mike
> Be sure: your community would love you for this!
> 
> Kind regards,
> Jochen
> 
> P.S.
> I am a little in a hurry right now,
> and I hope you don't consider me curt.
> Thanks for your work on buildroot!!!
> Do you have an Amazon or whatever wishlist,
> so I can do something good for you?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
