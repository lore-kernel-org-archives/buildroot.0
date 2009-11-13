From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 13 Nov 2009 14:56:45 +0100
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <200911131518.14509.cristeab@gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
	<4AFC1FC8.3020305@gmail.com> <200911131518.14509.cristeab@gmail.com>
Message-ID: <4d28d4b50911130556r34138e7ai481140b27d15af53@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 13, 2009 at 2:18 PM, Bogdan Cristea <cristeab@gmail.com> wrote:

> On Thursday 12 November 2009 16:46:32 you wrote:
> > I've just started doing the same thing myself.  After a bit of googling
> > the trick I found was to ask buildroot to generate a cpio target file
> > system. Start with the i386_defconfig or i686_defconfig and set
> > BR2_TARGET_ROOTFS_CPIO=y (or use "make menuconfig" an find the cpio
> > option under the "Target file system" menu)
> >
> > Making use of qemus ability to replace the bootloader you can invoke
> > qemu with
> >     qemu -kernel output/images/bzImage \
> >          -initrd output/images/rootfs.i686.cpio
>

Shouldn't be the cpio image gunzipped ? :

$ file /boot/initrd.img-2.6.30-2-686
/boot/initrd.img-2.6.30-2-686: gzip compressed data, from Unix, last
modified: Fri Nov 13 09:08:02 2009
$ gunzip -c /boot/initrd.img-2.6.30-2-686 > test
$ file test
test: ASCII cpio archive (SVR4 with no CRC)



> >
>      I have tried this approach, but it does not seem to work. First
> inconvenient is that rootfs.i686.cpio file is very large (600 MB) and when
> using the above command I only get a black screen from QEMU while the
> entire
> computer seems to be slower.
>    Lionel, suggested other approaches but till now I have no luck. Trying
> to
> obtain first a cloop root filesystem and then convert that to a QEMU format
> seem to work and the file size is small (3 MB), but still when using that
> disk
> image, QEMU is not able to recognize any root partition.
>    If you have any other suggestion it would be helpful.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091113/44a0bbd1/attachment.htm>
