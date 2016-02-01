From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:42:18 +0100
Subject: [Buildroot] [PATCH 08/10] libimxvpuapi: add new package
In-Reply-To: <1454154357-31625-9-git-send-email-gary.bisson@boundarydevices.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-9-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160201214218.3eb39852@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 30 Jan 2016 12:45:55 +0100, Gary Bisson wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 09c2b40..d3e5e30 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1033,6 +1033,7 @@ menu "Multimedia"
>  	source "package/libfslparser/Config.in"
>  	source "package/libfslvpuwrap/Config.in"
>  	source "package/libhdhomerun/Config.in"
> +	source "package/libimxvpuapi/Config.in"

Why isn't it part of the package/freescale/ directory ? Because it
isn't sourced from the same site ?

>  	source "package/libmatroska/Config.in"
>  	source "package/libmms/Config.in"
>  	source "package/libmpeg2/Config.in"
> diff --git a/package/libimxvpuapi/Config.in b/package/libimxvpuapi/Config.in
> new file mode 100644
> index 0000000..222aa76
> --- /dev/null
> +++ b/package/libimxvpuapi/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBIMXVPUAPI
> +	bool "libimxvpuapi"
> +	depends on BR2_arm # Only relevant for i.MX
> +	select BR2_PACKAGE_FREESCALE_IMX
> +	select BR2_PACKAGE_IMX_VPU

I am wondering if the first one shouldn't be a "depends on", but I'm
not sure. What do other think ?

> +	help
> +	  This library provides an API for using the iMX6 VPU video engine. It
> +	  is an alternative to Freescale's VPU wrapper. Both the wrapper and
> +	  this library are layered on top of imx-vpu, the low-level iMX6 VPU
> +	  interface.

A URL to the upstream web page would be good. A github page is fine as
a fallback if there's no real upstream web site.

> diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
> new file mode 100644
> index 0000000..ff9282d
> --- /dev/null
> +++ b/package/libimxvpuapi/libimxvpuapi.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# libimxvpuapi
> +#
> +################################################################################
> +
> +LIBIMXVPUAPI_VERSION = 0.10.1
> +LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
> +LIBIMXVPUAPI_LICENSE = LGPLv2.1

License seems to be LGPLv2.1+.

Also, you forgot to include a hash file. Could you fix those issues and
send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
