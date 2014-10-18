From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 18 Oct 2014 16:17:46 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: add dependencies for make source
In-Reply-To: <54426BB5.6030903@mind.be>
References: <1413580605-57289-1-git-send-email-kaszak@gmail.com>
 <CAGduivwDurQn5c5Qovk+K6ZUg86cneLCjq7dpEmPJ9x-9ak=Eg@mail.gmail.com>
 <54426BB5.6030903@mind.be>
Message-ID: <CABbD_XBSjcCmHwiVAwA7Ac+H_tFuv_DP9Jp8mfd5KfbuV21pYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>>
> >> +ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux
> rootfs-cpio grub
> >> +
> >>  $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux
> rootfs-cpio grub
>
>  You should use $(ROOTFS_ISO9660_DEPENDENCIES) here.
>
>
Why? Non of the other rootfs target makefiles use that (fs/*/*.mk).


> > How about putting the dependencies variables on the top ?
> > Also, please keep the dependencies alphabetically sorted.
> > I know they are not ordered the line below, but it would be nice.
>
>  Well, now they're ordered according to how they appear in the makefiles,
> i.e.
> first the real packages, then the kernel, then the rootfs, then the
> bootloader.
>
>  Hm, actually, the bootloader should come before the kernel in that
> reasoning...
>
>  So alphabetically is probably better :-)
>

Technically, the dependencies variable is already at the top, before the
first make target.
Also, it's not on the exact top of the file in any other rootfs target
makefiles.
Regarding the order: I don't really think that matters.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141018/89f7f1cc/attachment.html>
