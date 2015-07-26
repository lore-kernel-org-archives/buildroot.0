From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 17:43:24 +0100
Subject: [Buildroot] Best way to update deployed systems created with
	BuildRoot?
In-Reply-To: <CAE-zcqW_rRQVr8T+wevTdboyyk3qtf88YpX_be5M-A7_=B89uA@mail.gmail.com>
References: <CAE-zcqW_rRQVr8T+wevTdboyyk3qtf88YpX_be5M-A7_=B89uA@mail.gmail.com>
Message-ID: <CA+BsyQ7UaCmeqaH17MYz1PQdGiETGg5A9x-2ra2Ly2u26XG+Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fred,

my advice is usually "don't". :)

The most popular and easiest way is to bake everything into a rootfs cpio
and include it with the kernel. To upgrade the system simply reflash the
kernel and reboot.

The way I really like to do it is to make a squashfs with the kernel
included within the rootfs, have the bootloader load the kernel from it,
and then have the kernel mount it as the rootfs when it starts. This is a
bit more memory efficient and usually boots a bit faster.

If you really want to have a system that can be upgraded piece by piece you
would need to use a package manager, such as ipkg. buildroot isn't really
intended for use in conjunction with such systems. I know there was some
chat a while back about supporting packagisation, but I don't recall the
outcome of the discussion. Yocto may be more appropriate for your needs in
this case. I'd repeat, though, don't go down the packaging route unless you
really have to. Most applications IME don't need it.

Brendan



On 26 July 2015 at 17:30, Fred Basset <fredbasset1000@gmail.com> wrote:

> Hi All,
>
> Does anyone have any experience on the best way to update the root
> filesystem of systems in the field once they're deployed?
>
> Thank you,
> Fred
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/f0a534f1/attachment.html>
