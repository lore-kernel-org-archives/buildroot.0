From: Gregoire Lejay <gregoire.lejay@gmail.com>
Date: Fri, 24 Jan 2014 13:43:13 +0000
Subject: [Buildroot] Building a proper uImage (Kernel panic - not syncing:
	VFS)
Message-ID: <CA+Ojkbtwp19sdmHrQQepaoXf=+niAVA=oQi5GOgo=gom7BWcag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello the Buildroot Mailing List,

That's my first message on this mailing list !

My board is a imx53-tx53 from Freescale and I have been using RedBoot as a
bootloader for quite a while.
Since i'm very interested in the scripting capabilities of U-Boot, I would
like to change my setup such that I can manage my partitions using U-Boot.

To do that, I thought that setting BuildRoot to generate a uImage without
the appended device tree and to run make LOADADDR=0x700800 would be enough.

But apparently, I do something wrong. Or miss something fundamental.

The kernel is correctly loaded and started, but it crashes when
(apparently) loading the root file system. See below:

rtc-ds1307 1-0068: setting system clock to 2000-01-01 01:17:51 UTC
(946689471)
List of all partitions:
1f00          131072 mtdblock0  (driver?)
No filesystem could mount root, tried:  jffs2
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
Backtrace:
[<c00118c8>] (dump_backtrace+0x0/0x10c) from [<c02adfec>]
(dump_stack+0x18/0x1c)
 r6:ffffffea r5:df8a8006 r4:c0400c00 r3:00000001
[<c02adfd4>] (dump_stack+0x0/0x1c) from [<c02ae1b4>] (panic+0x8c/0x1d4)
[<c02ae128>] (panic+0x0/0x1d4) from [<c039cda0>]
(mount_block_root+0x1e8/0x248)
 r3:df87bee4 r2:c036062c r1:df87bf14 r0:c03479b3
 r7:00008001
[<c039cbb8>] (mount_block_root+0x0/0x248) from [<c039d008>]
(mount_root+0xf8/0x11c)
[<c039cf10>] (mount_root+0x0/0x11c) from [<c039d188>]
(prepare_namespace+0x15c/0x1bc)
 r6:c03c25d0 r5:c03baf41 r4:c04007a0
[<c039d02c>] (prepare_namespace+0x0/0x1bc) from [<c039c998>]
(kernel_init+0x168/0x1a0)
 r5:c03baf08 r4:00000007
[<c039c830>] (kernel_init+0x0/0x1a0) from [<c002147c>] (do_exit+0x0/0x6a8)
Rebooting in 1 seconds..

the Kernel command line is:  console=ttymxc0,115200 ro debug panic=1
root=/dev/mtdblock3 rootfstype=jffs2

I have tried with the uImage and the root file system provided by the
manufacturer and everything works fine.
So my guess, is that there is an option I miss in the Buildroot
configuration.

Did some of you experienced that in the past ?


Any of your comment would be appreciated since i'm pretty now in that field.

Best regards,

gregoire.


PS: Even if I had issues recently, i always surprised on how good
buildroot. Thank you for that !
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140124/96e87940/attachment.html>
