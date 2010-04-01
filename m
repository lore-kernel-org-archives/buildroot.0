From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Apr 2010 20:09:49 +0200
Subject: [Buildroot] [PATCH 05/16] xlib_libXau: remove duplicate
 dependancies
In-Reply-To: <1270126006-22405-5-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
	<1270126006-22405-5-git-send-email-will_wagner@carallon.com>
Message-ID: <20100401200949.22caad19@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Thu,  1 Apr 2010 13:46:35 +0100
Will Wagner <will_wagner@carallon.com> wrote:

> ---
>  package/x11r7/xlib_libXau/Config.in      |    1 -
>  package/x11r7/xlib_libXau/xlib_libXau.mk |    2 +-
>  2 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
> index 1b7adbc..4c4e517 100644
> --- a/package/x11r7/xlib_libXau/Config.in
> +++ b/package/x11r7/xlib_libXau/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_XLIB_LIBXAU
>  	bool "libXau"
>  	select BR2_PACKAGE_XPROTO_XPROTO
> -	select BR2_PACKAGE_XPROTO_XPROTO
>  	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>  	help
>  	  libXau 1.0.5
> diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
> index 71bca6c..d5f6814 100644
> --- a/package/x11r7/xlib_libXau/xlib_libXau.mk
> +++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
> @@ -10,7 +10,7 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  XLIB_LIBXAU_AUTORECONF = NO
>  XLIB_LIBXAU_LIBTOOL_PATCH = NO
>  XLIB_LIBXAU_INSTALL_STAGING = YES
> -XLIB_LIBXAU_DEPENDENCIES = xproto_xproto xproto_xproto xutil_util-macros
> +XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
>  XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
>  
>  $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau))


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
