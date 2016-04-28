From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 16:42:16 +0200
Subject: [Buildroot] [PATCH] mpv: va-api requires egl-drm,
 wayland and/or x11
In-Reply-To: <1461853987-5313-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461853987-5313-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160428164216.0e28690d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Apr 2016 11:33:07 -0300, Gustavo Zacarias wrote:

>  # va-api support
> +# This requires one or more of the egl-drm, wayland, x11 backends
> +# For now we support wayland and x11
>  ifeq ($(BR2_PACKAGE_LIBVA),y)
> +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),)
> +MPV_CONF_OPTS += --disable-vaapi
> +else
>  MPV_CONF_OPTS += --enable-vaapi
>  MPV_DEPENDENCIES += libva
> -else

Can we make that positive logic ?

ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),y)
enable vaapi
else
disable vaapi
endif

or you have cases where wayland on X is used, so you have both options
set to 'y' and still want the vaapi support ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
