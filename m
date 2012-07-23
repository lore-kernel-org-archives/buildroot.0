From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jul 2012 11:56:37 +0200
Subject: [Buildroot] [PATCH] mediastreamer: fix build with libX11 and
 sdl without x11 support
In-Reply-To: <1343036959-7639-1-git-send-email-jacmet@sunsite.dk>
References: <1343036959-7639-1-git-send-email-jacmet@sunsite.dk>
Message-ID: <20120723115637.36b5b8cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jul 2012 11:49:19 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> -ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> +# mediastreamer assumes SDL has X11 support if --enable-x11 (and X11 support
> +# is only used for SDL output)
> +ifeq ($(BR2_PACKAGE_SDL_X11),y)
>  MEDIASTREAMER_CONF_OPT += --enable-x11
> -MEDIASTREAMER_DEPENDENCIES += xlib_libX11
>  else
>  MEDIASTREAMER_CONF_OPT += --disable-x11
>  endif

So this means that it is not possible to use mediastreamer on X11
without SDL?

I understand that when SDL support is enabled, it wants SDL to support
X11. But when X11 is enabled, does it requires SDL ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
