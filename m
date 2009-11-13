From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 13 Nov 2009 15:10:37 +0100
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <a038bef50911130603g11082b75w556db27d94b15eb@mail.gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
	<4AFC1FC8.3020305@gmail.com> <200911131518.14509.cristeab@gmail.com>
	<4d28d4b50911130556r34138e7ai481140b27d15af53@mail.gmail.com>
	<4d28d4b50911130557k4bbdfe0xee1a9234b4092050@mail.gmail.com>
	<a038bef50911130603g11082b75w556db27d94b15eb@mail.gmail.com>
Message-ID: <4d28d4b50911130610q43e9fbf1k2aad22f7b8e57270@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 13, 2009 at 3:03 PM, Chris Packham <judge.packham@gmail.com>wrote:

> On Fri, Nov 13, 2009 at 8:57 AM, Lionel Landwerlin
> <llandwerlin@gmail.com> wrote:
> >>> > Making use of qemus ability to replace the bootloader you can invoke
> >>> > qemu with
> >>> >     qemu -kernel output/images/bzImage \
> >>> >          -initrd output/images/rootfs.i686.cpio
> >>
> >> Shouldn't be the cpio image gunzipped ? :
> >
> > I mean gzipped of course...
>
> Unzipped works for me. The cpio target makes 2 files. rootfs.ARCH.cpio
> and rootfs.ARCH.cpio.gz.
> I just tried the .gz file and that works too.
>

In fact the 600Mb cpio archive is probably the problem ;)
Maybe the Qemu hardware configuation hasn't enough ram.

Bogdan: You should probably avoid building things like WebKit at least in
initrd
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091113/3cd96b81/attachment-0001.htm>
