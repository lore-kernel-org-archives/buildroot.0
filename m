From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 20 Dec 2017 21:41:16 +0200
Subject: [Buildroot] Unable to boot ISO on target
In-Reply-To: <2e461fd4955c6c4d165ee1e28be00ee6@gulon.co.uk>
References: <2e461fd4955c6c4d165ee1e28be00ee6@gulon.co.uk>
Message-ID: <c7d19ef1-0d46-f3fb-aa8e-292b9278ff14@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Im not quite sure what you mean by hybrid image (I always thought that
buildroot creates just plain read only iso9660 livecd images)
but can you please post your .config file and I could take a look?

-S-

Rob Kent kirjoitti 20.12.2017 klo 18:50:
> Hi All,
>
> I have created a build for an Atom N270 target (eeebox b202) and am
> now trying to create a bootable USB drive to test on the target
> machine. My configuration creates a kernel image (bzImage) and a
> filesystem (rootfs.ext2) and then creates an ISO9660 hybrid image
> installing syslinux/isolinux as a bootloader. I can run the output
> with qemu using the following command:
>
> $ qemu-system-i386 -cpu n270 -hda output/images/rootfs.iso9660
>
> This boots to the prompt (with a readonly filesystem).
>
> I copy this iso image to a USB stick as follows:
>
> $ sudo dd if=rootfs.iso9660 of=/dev/sdg bs=4M && sync
>
> However, when I boot this on the target machine, it loads the kernel
> but then panics as its unable to find the rootfs as follows:
>
> Kernel panic - not syncing: VFS: Unable to mount rootfs on
> unknown-block(0,0)
>
> The output can be a bit inconsistent, but sometimes the message says
> its not able to find "sda" and to set "root=" to something else giving
> a blank list of available partitions.
>
> It seems to me that the kernel is unable to find any suitable/readable
> partitions, but as this boots with qemu I am assuming this must be
> something to do with the ISO config/setup?
>
> Can anyone shine any light on this? I've tried quite a lot of things
> from Google and so far had no luck.
>
> Thanks very much,
>
> Rob
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
