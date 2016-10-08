From: Adam Baxter <voltagex@voltagex.org>
Date: Sat, 8 Oct 2016 21:39:07 +1100
Subject: [Buildroot] initramfs is not being linked into kernel
In-Reply-To: <CAChFQ9TE=2_k0xH2UwHBGOgkynMMASnuQ-xApx3v+xGFWCcsiQ@mail.gmail.com>
References: <CAChFQ9TE=2_k0xH2UwHBGOgkynMMASnuQ-xApx3v+xGFWCcsiQ@mail.gmail.com>
Message-ID: <CAChFQ9QOe0BNc-AcZO1AYENwbWup9ss2PVj42h3Rqncwx7tQgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've got the following external / overlay build setup -
https://github.com/baxterworks-build/buildroot-skeleton.
BR2_TARGET_ROOTFS_INITRAMFS=y
is set, however the resulting bzImage doesn't have the rootfs linked into
it. This is more evident on the selfhost branch, where I do silly things
like add a complete set of compilers to the rootfs - in this case,
rootfs.cpio is 40 megabytes, but bzImage is 2 megabytes.

Relevant files:
https://github.com/baxterworks-build/buildroot-skeleton/blob/master/external/configs/skeleton_defconfig
and
https://github.com/baxterworks-build/buildroot-skeleton/blob/master/external/configs/kernel.config

I am building with 2016.08. Building with git HEAD appears to create an
unbootable kernel, but that's a story for another thread.

Any ideas why I can't get the initramfs to be linked in?

Thanks,
Adam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161008/fccf72b9/attachment.html>
