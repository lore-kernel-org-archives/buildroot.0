From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Thu, 20 Aug 2015 15:14:09 -0700
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
 <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD967E@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,



Thanks for your suggestion. Please view my in-line replies.



Tommy



-----Original Message-----
From: Brendan Heading [mailto:brendanheading at gmail.com]
Sent: Thursday, August 20, 2015 12:08 PM
To: Lee, Tommy
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] bootm - "Starting kernel"



You seem to be setting your rootfs to /dev/sda in your u-boot command line option. This only makes sense if your root filesystem is an attached ATA or SCSI hard disk, which is probably not the case.



Marvell?s DB-88F6820-GP board has four SDRAM devices and four SATA connectors. With no SATA devices connected, the Linux system in Marvell?s USB is bootable with root=/dev/sda1. You probably know the reason for the booting success.



In my situation I suppose I need /dev/ram or /dev/ram0 to attach my root filesystem; I need not to use Marvell?s mtdparts string (spi_flash:4m(boot),-(spi-rootfs) .



Comment please.



The fix for this depends on what you intend to do. You can either download the rootfs image separately, or you can bake it into the kernel, or you can flash it separately to an MTD partition and then mount it when the kernel starts. Personally I prefer to start out with the initramfs baked into the kernel.



The kernel binary format is selected as zImage for the U-Boot bootz command. For baking my root filesystem.into the kernel, I suppose my root filesystem?s compression method should be ?no compression?.



Comment please.



Following is the ?filesystem images? configuration I am going to use. I hope you see the configuration is proper.

?..

-*- cpio the root filesystem (for use as an initial RAM filesyste

Compression method (no compression)  --->



[*] initial RAM filesystem linked into linux kernel

?..



Brendan

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150820/56e3c8e5/attachment.html>
