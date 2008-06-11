From: John Voltz <john.voltz@gmail.com>
Date: Wed, 11 Jun 2008 12:53:29 -0400
Subject: [Buildroot] mdev.conf missing during kernel boot-up process?
In-Reply-To: <326f33790806110918x2d922e13vbd8b62bbc223bac5@mail.gmail.com>
References: <326f33790806110918x2d922e13vbd8b62bbc223bac5@mail.gmail.com>
Message-ID: <46a136670806110953h537bab32t47982eef215873fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arun,

Look in target/generic/target_skeleton. I think that's probably where the
filesystem skeleton for MIPS and x86 comes from. If the file isn't there, go
ahead and add it. There are examples you can use in the AVR32 directories,
target/device/Atmel/atngw100/target_skeleton/etc.

John


On Wed, Jun 11, 2008 at 12:18 PM, Arun Reddy <reddyac@gmail.com> wrote:

> I just finished a MIPS build and I seem to have a near-successful boot-up
> in QEMU going. After mounting the root (ext2 filesystem) as ready only, the
> boot up halts saying that it
>
> cannot create directory '/dev/pts': File exists
> /bin/sh: /proc/sys/kernel/hotplug: No such file or directory
> mdev: /etc/mdev.conf: No such file or directory
> mdev: /etc/mdev.conf: No such file or directory
> mdev: /etc/mdev.conf: No such file or directory
> mdev: mknod loop2: Read-only file system
> /bin/hostname: invalid option -- F
> Try '/bin/hostname --help' for more information.
>
> I checked my BusyBox settings and mdev.conf support is enabled. It seems to
> me that mdev.conf should be automatically generated for me, but after
> mounting my harddisk image and checking inside of /etc, I don't see it. Is
> this because it is supposed to be created after the root filesystem is
> mounted during the boot-up process? Is it being restricted because I haven't
> set rw access? I tried booting it up with rw set, but I still get the same
> mdev.conf error. And when I try to boot it up again, it says that it can't
> mount to my hda1 device because the kernel has unsupported optional features
> set. The only way to try again properly is by remaking my harddisk image.
>
> Anyone have any idea why mdev.conf is not being generated? Any specific
> BusyBox setting I might be missing? Here's what I have set for mdev in
> BusyBox:
>
> FEATURE_MDEV_EXEC=y
> FEATURE_MDEV_CONF=y
> MDEV=y
>
> Thank you for any assistance you guys can offer!
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080611/1521f75d/attachment.htm 
