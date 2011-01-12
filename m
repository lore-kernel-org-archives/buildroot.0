From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 12 Jan 2011 16:40:21 +0100
Subject: [Buildroot] [PATCH v2] New package: can-utils
In-Reply-To: <4D07935A.1070505@visionsystems.de>
References: <4D07935A.1070505@visionsystems.de>
Message-ID: <4D2DCB65.6080502@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please, don't apply this patch. SocketCAN devs are about to create official distribution and the package name
will be changed. I'll post a proper patch as soon as the distro is finished.

Best regards,
Yegor

Am 14.12.2010 16:55, schrieb Yegor Yefremov:
> Add SocketCAN utilities.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Index: b/package/Config.in
> ===================================================================
> --- a/package/Config.in	2010-12-14 12:26:51.000000000 +0100
> +++ b/package/Config.in	2010-12-14 12:41:56.000000000 +0100
> @@ -364,6 +364,7 @@
>  source "package/bind/Config.in"
>  source "package/bmon/Config.in"
>  source "package/bridge-utils/Config.in"
> +source "package/can-utils/Config.in"
>  source "package/ctorrent/Config.in"
>  source "package/cups/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> Index: b/package/can-utils/Config.in
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ b/package/can-utils/Config.in	2010-12-14 16:52:36.000000000 +0100
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_CAN_UTILS
> +	bool "can-utils"
> +	help
> +	  SocketCAN is a set of open source CAN drivers and a networking stack.
> +	  This package provides various tools for this stack.
> +
> +	  http://developer.berlios.de/projects/socketcan/
> +
> Index: b/package/can-utils/can-utils.mk
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ b/package/can-utils/can-utils.mk	2010-12-14 15:23:12.000000000 +0100
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# can-utils
> +#
> +#############################################################
> +
> +CAN_UTILS_VERSION = 1217
> +CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk/can-utils
> +
> +CAN_UTILS_AUTORECONF = YES
> +
> +$(eval $(call AUTOTARGETS,package,can-utils))
> +
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
