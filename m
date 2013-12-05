From: Thomas Pedersen <thomas@cozybit.com>
Date: Thu, 5 Dec 2013 00:24:52 -0800
Subject: [Buildroot] [PATCH] pandaboard: fix defonf build with recent
	kernels
In-Reply-To: <20131205085935.75f129c7@skate>
References: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
 <20131205085935.75f129c7@skate>
Message-ID: <CAG6hwVPEtmc5x-6KsismUWV8-ubr6hDWKpFc5EKEjcdP8TsUVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Dec 4, 2013 11:59 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Thomas Pedersen,
>
> On Wed,  4 Dec 2013 15:57:44 -0800, Thomas Pedersen wrote:
> > The patch "pandaboard: Fix defconfig build" locked the
> > default pandaboard kernel to 3.8.11. This is inconvenient,
> > however, and we can make the default pandaboard kernel
> > build and boot with a few changes:
>
> The lock down to a specific version of the kernel and a specific version
> of the kernel headers is intentional. These are here to guarantee that
> the defconfig will always produce the same result, regardless of
> whether Buildroot updates the default kernel / kernel headers version.

Ah OK. At least this patch will make future kernels compatible with legacy
u-boot loaders. In our case we're using usbboot, and I'm not aware of a
method to pass the device tree over USB or PXE.

> > -# Lock to 3.8 headers to avoid breaking with newer kernels
> > -BR2_KERNEL_HEADERS_3_8=y
>
> So this should be kept (possibly updating to a new kernel headers
> version of course, but we should keep a kernel headers version here).
>
> >  # Kernel
> >  BR2_LINUX_KERNEL=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.11"
>
> Same thing here. No problem with bumping from 3.8.x to 3.12.x or
> something like that, if you've tested 3.12.x, but an explicit version
> selection must be kept.

Will do. Thanks!

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/cf95afab/attachment-0001.html>
