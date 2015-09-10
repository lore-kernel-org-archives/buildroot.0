From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Thu, 10 Sep 2015 15:07:53 +0200
Subject: [Buildroot] Xorg Segmentation fault now. Please help
In-Reply-To: <55F13CF8.3070706@mind.be>
References: <CAEzGmjDwBwLt8kynQpjj-2sKtOX6Un7TLXX1i7sH6vBODda+9A@mail.gmail.com>
 <55F13CF8.3070706@mind.be>
Message-ID: <CAEzGmjBTEQHT9L4TYpc=6BU1VziYcN2GWPUJrebsqQFr+KBqhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout,

I tried your tips in order and had success when I selected
Kernelheaders 3.18.x and
Kernel = same as kernel headers
which gave me 3.18.19 as opposed to the default 4.1.4

Thus my now working defconfig as below.

Guess I have to stick to that for now.

Thanks again and regards
Lennart

BR2_x86_i686=y
BR2_KERNEL_HEADERS_3_18=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_ROOTFS_OVERLAY="board/eta/board1/rootfs-overlay/"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XWD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_LIBGTK2=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_SUPERVISOR=y
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_NANO_TINY is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
BR2_TARGET_GRUB2=y



On Thu, Sep 10, 2015 at 10:19 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 10-09-15 09:15, Lennart Ramberg wrote:
> > Hello,
> >
> > After having been away from Buildroot since last year, I'm at it again.
> > But I had a setback;
> >
> > With 2014.11 the xorg-server runs allright.
> > Jumping to 2015.08.1 the xorg-server won't run.
> > Why might this be? Please help.
> >
> > Below is a part of my /var/log/Xorg.0.log after I executed 'X',
> > as well as my defconfig (and there is nothing suspicious in the
> overlays).
> > And I did a 'make clean all' first.
>
>  I know nothing about X, but here are a few tips:
>
> - I see you are using ccache. That is still not 100% reliable, so perhaps
> try
> again with turning ccache off and do a make clean all.
>
> - You could disable the intel driver and enable e.g. VESA or fbdev to
> isolate
> where the issue is.
>
> - You could try to vary the kernel and gcc versions.
>
>  And of course, check the Xorg bug tracker.
>
>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150910/1660419d/attachment.html>
