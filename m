From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Fri, 07 Feb 2014 08:14:34 +0100
Subject: [Buildroot] Antw: Re: Why can't I see any effects by different
 rootfs compression methods ??
In-Reply-To: <52F3C228.2080002@mind.be>
References: <52F361B10200004600049F5D@gwia2.rz.hs-offenburg.de>
 <52F3C228.2080002@mind.be>
Message-ID: <52F495EA020000460004A4C6@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the response, that gave me a better view. 

But now i got a question which may sound a bit confusing: what can I do with these compressed archives (like rootfs.cpio.lzo) ? I always thought I can only create bootable Images with an Initramfs/initrd ? Because when I put the (e.g) rootfs.cpio as Initramfs source file(s) in make linux-menuconfig then i got a working image in the end, but if i put rootfs.cpio.lzo then he skips the .lzo ending and uses the rootfs.cpio again (I guess that's nothing new to you).

so then I'm not sure why the rootfs can be compressed if it only can be used on host, or is it there so it can be mount e.g. in userspace ?

The other question is: about the "double" compression you mentioned. Someone told me these two compression modes are independent from each other, unfortunately i can't open those u/zImages to look what's right now. Anyway, if you want to have a fast booting linux, can't some combination of these 2 compression mode lead to a quicker startup?.

Thanks a lot for your help!

Kind Regards,

Frank

>>> Arnout Vandecappelle <arnout@mind.be> 06.02.14 20.38 Uhr >>>
On 06/02/14 10:19, Frank Ihle wrote:
> Hi,
> 
> I'm using Buildroot to generate a uImage with a kernel, which in the end
> starts busybox. I tried the different compression modes (kernel
> compression, built-in initramfs compression and the rootfs compression).
> The first 2 options worked quiet well but when it comes to apply
> different compression methodes (e.g. LZMA, bzip2) on  rootfs in make
> menuconfig nothing changes, neither size nor decompress time.
> 
> Why is it like that ? And how can I extract files of the generated
> uImage, so that i can see what really has been compressed ?

 The rootfs compression only affects the rootfs image that is generated
in output/images, not the initramfs that is linked into the kernel. The
latter is purely controlled by kernel options (which you did).

 Note that built-in initramfs compression is pointless, because it will
be compressed again with the kernel compression method - and that usually
increases the size rather than decreasing it.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140207/f60fead9/attachment.html>
