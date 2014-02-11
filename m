From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 11 Feb 2014 16:37:01 +0100 (CET)
Subject: [Buildroot] Antw: Re: Antw: Re: Antw: Re: Antw: Re: How to get
 the kernel to mount a rootfs without an initramfs ??
In-Reply-To: <52FA4A13020000460004A8A4@gwia2.rz.hs-offenburg.de>
Message-ID: <1990298190.5287992.1392133021402.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Please stop mailing me directly, people on the mailing list are
knowledgeable and probably able to help. There is no reason to
move to a private conversation

> >if you got files on the SD then your SD is partitioned and has a
> >single
> >FAT partition. I'm not sure where you put your squash fs... as an
> >image
> >file on the SD card (i.e on the FAT partition of the SD card )
> 
> well I created a 1 primary partition with fdisk and put all the
> images on the SD.

yes, but is it a FAT partition ?

> When I was booting U-Boot told me "Wrong Image
> Format for bootm command" and "ERROR: can't get kernel image!"

bootm it to boot from memory, you load the kernel image in memory,
you load somehow the kernel to RAM and give the address where it 
has been loaded to U-Boot. Do you do that step ? it's not automated

I don't know if U-Boot is able to boot directly from a SD-Card

> - I
> guess he couldn't read a thing. Then I deleted the partition again
> (table was empty) and put all the files on the SD,

how can you put multiple files on a SD that is not partitionned ? or
at least formated into some type of filesystem ?

how do you create your SD, could you give me the precise command you
use ?

> booted the system
> and the same kernel panic as usual appeared - so what I see now is
> that he's got a problem with reading from a partitioned SD.
> 

i'm not convinced that's the problem, but as I said it depends what
you are really doing with the SD and your explanation so far hasn't
allowed me to understand that.

> Right now I'm a bit clueless. But what I believe is, when it is only
> able to boot from mmcblk0 instead of mmcblk0p1 then it should
> actually be able to run the squashfs from mmcblk0 too, right ?
> 

no. if you formated mmcblk0 as a squashfs then it should be able to 
use it as root, but that's probably not the case since it does find
the kernel. My guess is that you formated mmcblok0 as a FAT filesystem
and that your firmware somehow finds the kernel there. However the
squashfs is here as a file, not as a partition. I don't know how you
tell Linux to use a file on a FAT partition as a rootfs. I don't 
know if it is even possible.

logically, you need two partitions, a FAT partition with your kernel
and a squashfs partition with your root filesystem. I'm not sure what
you are doing, but that's not it...
