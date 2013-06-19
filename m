From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 16:46:56 +0200
Subject: [Buildroot] [PATCH] usbmount: stop using blkid,
 use udev environment variables instead
In-Reply-To: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
References: <1371652082-3515-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20130619164656.33bc3f8c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Wed, 19 Jun 2013 16:28:02 +0200, Sven Neumann wrote:

> @@ -4,8 +4,6 @@ config BR2_PACKAGE_USBMOUNT
>  	depends on BR2_USE_WCHAR # util-linux

If this dependency is only for util-linux and you remove the select
BR2_PACKAGE_UTIL_LINUX below, you could get rid of this dependency.

>  	depends on BR2_PACKAGE_UDEV
>  	select BR2_PACKAGE_LOCKFILE_PROGS
> -	select BR2_PACKAGE_UTIL_LINUX
> -	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	help
>  	  The usbmount package automatically mounts USB mass storage devices
>  	  when they are plugged in, and unmounts them when they are removed.
> diff --git a/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch b/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch
> new file mode 100644
> index 0000000..0f0968b
> --- /dev/null
> +++ b/package/usbmount/usbmount-use-udev-environment-instead-of-blkid.patch
> @@ -0,0 +1,65 @@
> +--- usbmount-0.0.22/usbmount.orig	2013-06-18 14:44:40.143096147 +0200
> ++++ usbmount-0.0.22/usbmount	2013-06-19 16:13:09.882434896 +0200

Patch should have a description and Signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
