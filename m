From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 11:47:27 +0100
Subject: [Buildroot] [PATCH v7 06/33] package/efl/libefl: new package
In-Reply-To: <1449523775-6582-7-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151208104727.GD4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> Add the libefl package which contains an updated version of the following
> libraries:
> libecore, libedje, libeet, libfreet, libeina, libeio, libembryo, libthumb
> and libevas. It also contains eldbus, ephysics, and escape, see [1].
[--SNIP--]
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index d070131..7bd3820 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -18,6 +18,157 @@ LIBEFL_LICENSE_FILES = \
>  	licenses/COPYING.LGPL \
>  	licenses/COPYING.SMALL
>  
> +LIBEFL_INSTALL_STAGING = YES
> +
> +LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev \
> +	util-linux zlib
> +
> +# regenerate the configure script:
> +# https://phab.enlightenment.org/T2718
> +LIBEFL_AUTORECONF = YES
> +LIBEFL_GETTEXTIZE = YES
> +
> +# Configure options:
> +# --disable-cxx-bindings: disable C++11 bindings.
> +# --disable-fb: disable frame buffer support.
> +# --disable-harfbuzz: disable harfbuzz support.
> +# --disable-image-loader-jp2k: disable JPEG 2000 support.
> +# --disable-image-loader-webp: disable webp support.
> +# --disable-sdl: disable sdl2 support.
> +# --disable-systemd: disable systemd support.
> +# --disable-wayland: disable wayland support.
> +# --disable-xinput22: disable X11 XInput v2.2+ support.

I just nmoticed that this option is not present in the list, below.
I guess it is in fact not needed since you specify --with-x11=none.

> +# --enable-lua-old: disable Elua and remove luajit dependency.
> +# --with-opengl=none: disable opengl support.
> +# --with-x11=none: remove dependency on X.org.
> +LIBEFL_CONF_OPTS = \
> +	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> +	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
> +	--disable-cxx-bindings \
> +	--disable-fb \
> +	--disable-harfbuzz \
> +	--disable-image-loader-jp2k \
> +	--disable-image-loader-webp \
> +	--disable-sdl \
> +	--disable-systemd \
> +	--disable-wayland \
> +	--enable-lua-old \
> +	--with-opengl=none \
> +	--with-x11=none
[--SNIP--]

However, I guess your patch that adds support for X11 will have to
introduce that --disable-xinput22 until the patch that actually enables
that support.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
