From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Feb 2014 18:11:04 +0100
Subject: [Buildroot] Why can't I see any effects by different rootfs
 compression methods ??
In-Reply-To: <52F361B10200004600049F5D@gwia2.rz.hs-offenburg.de>
References: <52F361B10200004600049F5D@gwia2.rz.hs-offenburg.de>
Message-ID: <52F3C228.2080002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
