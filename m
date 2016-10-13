From: Adam Baxter <voltagex@voltagex.org>
Date: Thu, 13 Oct 2016 23:34:30 +1100
Subject: [Buildroot] initramfs is not being linked into kernel
In-Reply-To: <CAChFQ9Rdy+teG00Mv6Rku8Yju1r8hJsDYN6SQuXkWWgyRCCK5Q@mail.gmail.com>
References: <CAChFQ9TE=2_k0xH2UwHBGOgkynMMASnuQ-xApx3v+xGFWCcsiQ@mail.gmail.com>
 <CAChFQ9QOe0BNc-AcZO1AYENwbWup9ss2PVj42h3Rqncwx7tQgw@mail.gmail.com>
 <a69f5bc3-a82e-c2a5-fb60-66cab28924a1@mind.be>
 <CAChFQ9TidZ==+o3nEoGo+NOh3w=JQJRbUDr-r5_M2CenKLHTWA@mail.gmail.com>
 <CAChFQ9Rdy+teG00Mv6Rku8Yju1r8hJsDYN6SQuXkWWgyRCCK5Q@mail.gmail.com>
Message-ID: <CAChFQ9SvMjJPcZ282Oh7vX9W7VcwUXJfd+fyhog5p846hfFjyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 Oct 2016 9:34 AM, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>
>
>
> On 08-10-16 12:39, Adam Baxter wrote:
> > Hi all,
> >
> > I've got the following external / overlay build setup
> > - https://github.com/baxterworks-build/buildroot-skeleton.
BR2_TARGET_ROOTFS_INITRAMFS=y
> > is set, however the resulting bzImage doesn't have the rootfs linked
into it.
> > This is more evident on the selfhost branch, where I do silly things
like add a
> > complete set of compilers to the rootfs - in this case, rootfs.cpio is
40
> > megabytes, but bzImage is 2 megabytes.
> >
> > Relevant
> > files:
https://github.com/baxterworks-build/buildroot-skeleton/blob/master/external/configs/skeleton_defconfig
> > and
https://github.com/baxterworks-build/buildroot-skeleton/blob/master/external/configs/kernel.config
>
>  It seems to work for me (with a slightly modified buildroot config
though) on
> current git master, and there are no relevant changes since 2016.08.
>
>  Do you have this with a clean build, or only when you do a rebuild?
Although
> the latter really shouldn't make a difference... Is the
> output/build/linux-4.7.2/.stamp_initramfs_rebuilt file created and
up-to-date?
> Does output/build/linux-4.7.2/initramfs_data.cpio.gz look correct?
initramfs_data.o?
>

This was very strange. At the time I wrote that, I couldn't get the
initramfs to work with git HEAD, but it was working fine with 2016.08.

Current HEAD is working fine.

Thanks for your suggestions in any case. On to the next problem.

--Adam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161013/6ce37e1e/attachment.html>
