From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 00:10:35 +0100
Subject: [Buildroot] How to get the kernel to mount a rootfs without an
 initramfs ?? (2)
In-Reply-To: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
References: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
Message-ID: <5301456B.7080504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/14 09:40, Frank Ihle wrote:
> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0)
> Please append a correct "root=" boot option; here are the available
> partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> 
> I believe that partitioning doesn't lead to the solution, since booting
> with the same settings but with an initramfs is possible.
> 
> I found out that when booting with the initramfs image, when I do an ls
> /dev neither mmcblk nor sdb is listed.
> 
> After hitting dmesg following interesting lines appear:
> 
> mmc0: clock 0Hz busmode 1 powermode 0 cs 0 Vdd 0 width 0 timing 0

 I'm not familiar with the Atmel MCI controller, but my gut feeling says
that all these zeroes are a bad sign.

 As I said before: you should check the BSP for your board, there is
probably something wrong there.

 For sure, this issue is not buildroot-related. It's purely kernel-related.


 Regards,
 Arnout

> atmel_mci atmel_mci.0: Atmel MCI controller at 0xf0008000 irq 12, 1 slots
> mmc_host mmc0: card is not present
> mmc1: clock 0Hz busmode 1 powermode 0 cs 0 Vdd 0 width 0 timing 0
> atmel_mci atmel_mci.1: Atmel MCI controller at 0xf000c000 irq 26, 1 slots
> mmc_host mmc1: card is not present
> 
> (Yes the card is in the slot ;)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
