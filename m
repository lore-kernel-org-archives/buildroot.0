From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 18 Oct 2014 19:13:11 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: add dependencies for make source
In-Reply-To: <20141018184717.229346e1@free-electrons.com>
References: <1413580605-57289-1-git-send-email-kaszak@gmail.com>
 <CAGduivwDurQn5c5Qovk+K6ZUg86cneLCjq7dpEmPJ9x-9ak=Eg@mail.gmail.com>
 <54426BB5.6030903@mind.be>
 <CABbD_XBSjcCmHwiVAwA7Ac+H_tFuv_DP9Jp8mfd5KfbuV21pYw@mail.gmail.com>
 <20141018184717.229346e1@free-electrons.com>
Message-ID: <CABbD_XAJ28-rB30H_fjZF6Xn-BTYzU2s+5bODKBP9kvrG0=ByQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> > >  You should use $(ROOTFS_ISO9660_DEPENDENCIES) here.
> > >
> > Why? Non of the other rootfs target makefiles use that (fs/*/*.mk).
>
> All the other rootfs target makefiles use <foo>_DEPENDENCIES. Except
> that it's taken into account directly by the common filesystem logic in
> fs/common.mk. However, iso9660 is special, and therefore we handle the
> dependencies manually. But still, there's no need to repeat them twice.
> So, in your patch, change:
>
> ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio
> grub
>
> $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux
> rootfs-cpio grub
>
> To:
>
> ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio
> grub
>
> $(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)
>
> Oh, that's correct. I misunderstood the first proposal of Arnout.

> Regarding the order: I don't really think that matters.
>
> Well, it's indeed just a subjective thing, like most coding style
> things. Still, when a core Buildroot contributor such as Arnout
> suggests coding style changes, it's usually a good idea to follow suit
> to get the patch merged quickly :)
>
> That being said, I agree that we don't enforce any particular order for
> the dependencies in the other packages.
>

OK, but this means the changing of the order of dependencies is not at all
connected with
the original purpose of this patch, also everywhere else it should be
changed I guess.

I'll send a V2.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141018/c653e863/attachment.html>
