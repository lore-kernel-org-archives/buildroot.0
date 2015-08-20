From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 20 Aug 2015 20:08:18 +0100
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474AD9614@svr-wa-exch1.atg.lc>
Message-ID: <CA+BsyQ7GRYhUA-2aJ+4qxaFnr6g0740B9sxEkGhXNEQ84ct3bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I did all the bootcmd commands step by step. The final bootz command ended
> up with a kernel panic message:
>
> [    3.482970] ---[ end Kernel panic - not syncing: VFS: Unable to mount
> root fs on unknown-block(0,0)
>
> I am reporting this panic to see any adjustments I need to do in my .config
> file.

Tommy,

(please don't quote large parts of older emails in replies)

You seem to be setting your rootfs to /dev/sda in your u-boot command
line option. This only makes sense if your root filesystem is an
attached ATA or SCSI hard disk, which is probably not the case.

The fix for this depends on what you intend to do. You can either
download the rootfs image separately, or you can bake it into the
kernel, or you can flash it separately to an MTD partition and then
mount it when the kernel starts. Personally I prefer to start out with
the initramfs baked into the kernel.

Brendan
