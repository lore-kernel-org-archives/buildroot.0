From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Mar 2014 21:34:24 +0100
Subject: [Buildroot] compiling kernel
In-Reply-To: <1395101926704-65501.post@n4.nabble.com>
References: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
 <20140226014847.23839269@core2quad.morethan.org> <530E2686.8040409@mind.be>
 <1395101926704-65501.post@n4.nabble.com>
Message-ID: <532B50D0.7030100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/14 01:18, raj wrote:
> Hi Arnout,
> 
> Thanks much for your reply...
> I want to compile kernel and root file system separately for couple of
> reasons:
> 
> 1. I want application developer to just use prebuilt kernel binary + rootfs
> and run some script to create full Image so that, they don't need to have
> kernel source files.
> 
> could you give some clarity on creating separately file system and passing
> boot args to kernel to use the file system located in the dram.

 I'm not sure what you mean exactly, but perhaps you should look into
unionfs-fuse. That allows you to boot a standard rootfs and then mount
the developer's additions on top of it.

> 
> 2. I can compile kernel without the  "Initial RAM filesystem and RAM disk
> (initramfs/initrd) support", so that it has only the kernel image. How do I
> built the file system image?

 Look in buildroot's filesystem options menu.

 Regards,
 Arnout

> 
> 
> Thanks & Regards,
> Raj
>  
> 
> 
> 
> 
> 
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/compiling-kernel-tp63718p65501.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
