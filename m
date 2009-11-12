From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 12 Nov 2009 10:04:37 -0500
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <200911121623.45929.cristeab@gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
Message-ID: <a038bef50911120704v4d26e4bdkf7ff8842eed8508b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 12, 2009 at 9:23 AM, Bogdan Cristea <cristeab@gmail.com> wrote:
> ? ?I am trying to use QEMU for development of embedded systems using Real
> Time Linux. Buildroot seems to be the tool I need, but I still don't know how
> to build a disk image recognized by QEMU. Right now I am trying to use only
> x86 and x86_64 architectures.
> ? ?Does anyone know how to build a file system usable in QEMU ?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

I've just started doing the same thing myself.  After a bit of googling
the trick I found was to ask buildroot to generate a cpio target file
system. Start with the i386_defconfig or i686_defconfig and set
BR2_TARGET_ROOTFS_CPIO=y (or use "make menuconfig" an find the cpio
option under the "Target file system" menu)

Making use of qemus ability to replace the bootloader you can invoke
qemu with

   qemu -kernel output/images/bzImage \
        -initrd output/images/rootfs.i686.cpio
