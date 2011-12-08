From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 08 Dec 2011 09:37:07 +0100
Subject: [Buildroot] [PATCH] New package: xinput-calibrator
In-Reply-To: <4E984F1D.6060103@visionsystems.de>
References: <4E984F1D.6060103@visionsystems.de>
Message-ID: <4EE07733.1000902@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.10.2011 17:02, schrieb Yegor Yefremov:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/x11r7/Config.in                                        |    1 
>  package/x11r7/xapp_xinput_calibrator/Config.in                 |    9 ++++++
>  package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk |   13 ++++++++++
>  3 files changed, 23 insertions(+)
> 
> Index: b/package/x11r7/Config.in
> ===================================================================
> --- a/package/x11r7/Config.in
> +++ b/package/x11r7/Config.in
> @@ -129,6 +129,7 @@
>  		source package/x11r7/xapp_xhost/Config.in
>  		source package/x11r7/xapp_xinit/Config.in
>  		source package/x11r7/xapp_xinput/Config.in
> +		source package/x11r7/xapp_xinput_calibrator/Config.in
>  		source package/x11r7/xapp_xkbcomp/Config.in
>  		source package/x11r7/xapp_xkbevd/Config.in
>  		source package/x11r7/xapp_xkbprint/Config.in
> Index: b/package/x11r7/xapp_xinput_calibrator/Config.in
> ===================================================================
> --- /dev/null
> +++ b/package/x11r7/xapp_xinput_calibrator/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR
> +	bool "xinput-calibrator"
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXI
> +	help
> +	  A generic touchscreen calibration program for X.Org.
> +
> +	  http://www.freedesktop.org/wiki/Software/xinput_calibrator
> +
> Index: b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
> ===================================================================
> --- /dev/null
> +++ b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# xapp_xinput-calibrator
> +#
> +################################################################################
> +
> +XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
> +XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
> +XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
> +XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
> +
> +$(eval $(call AUTOTARGETS))
> +
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

ping
