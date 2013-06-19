From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Jun 2013 17:45:40 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
 use udev environment variables instead
In-Reply-To: <20130619174320.464b740b@skate>
References: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
 <20130619164656.33bc3f8c@skate> <1371653634.3873.13.camel@sven>
 <20130619171702.4d5a5e6b@skate> <1371656552.3873.16.camel@sven>
 <20130619174320.464b740b@skate>
Message-ID: <1371656740.3873.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2013-06-19 at 17:43 +0200, Thomas Petazzoni wrote:

> On Wed, 19 Jun 2013 17:42:32 +0200, Sven Neumann wrote:
> 
> > Well, udev selects util-linux (for libblkid), and util-linux requires a
> > toolchain with LARGEFILE + WCHAR support. So as far as I can see this
> > util-linux dependency needs to be propagated to udev (but can be dropped
> > from usbmount).
> 
> This dependency already exists in udev:
> 
> config BR2_PACKAGE_UDEV
>         bool "udev"
>         depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>         depends on BR2_LARGEFILE # util-linux
>         depends on BR2_USE_WCHAR # util-linux
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>         select BR2_PACKAGE_KMOD

Oh, I missed that as I was only looking at the dependency of the comment
at the bottom of package/udev/Config.in.


Regards,
Sven
