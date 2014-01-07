From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 14:26:17 +0800
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
References: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
Message-ID: <20140107142617.64f53ddc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Mon,  6 Jan 2014 22:09:02 +0000, spdawson at gmail.com wrote:

> +ifeq ($(BR2_PACKAGE_ALSA_LIB),)

Maybe we should use positive logic everywhere, no? I.e invert all the
conditions to be:

ifeq ($(BR2_<foo>),y)
  use the feature
else
  don't use the feature
endif

> +ifeq ($(BR2_PACKAGE_LIVE555),)
> +VLC_CONF_OPT += --disable-live555
> +else
> +VLC_CONF_OPT += --disable-live555

This should be --enable-live555

> +VLC_DEPENDENCIES += live555
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUA),)
> +VLC_CONF_OPT += --disable-lua
> +else
> +VLC_CONF_OPT += --disable-lua

Same mistake.

> +VLC_DEPENDENCIES += lua
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT),)
> +VLC_CONF_OPT += --disable-qt
> +else
> +VLC_CONF_OPT += --disable-qt

Ditto.

> +VLC_DEPENDENCIES += qt
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL),)
> +VLC_CONF_OPT += --disable-sdl
> +else
> +VLC_CONF_OPT += --disable-sdl

Ditto.

> +VLC_DEPENDENCIES += sdl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL_IMAGE),)
> +VLC_CONF_OPT += --disable-sdl-image
> +else
> +VLC_CONF_OPT += --disable-sdl-image

Ditto.

> +VLC_DEPENDENCIES += sdl-image
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SPEEX),)
> +VLC_CONF_OPT += --disable-speex
> +else
> +VLC_CONF_OPT += --enable-speex
> +VLC_DEPENDENCIES += speex
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TREMOR),)
> +VLC_CONF_OPT += --disable-tremor
> +else
> +VLC_CONF_OPT += --enable-tremor
> +VLC_DEPENDENCIES += tremor
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11),)
> +VLC_CONF_OPT += --without-x
> +else
> +VLC_CONF_OPT += --with-x
> +VLC_DEPENDENCIES += xlib_libX11
> +endif

I wonder if this block shouldn't interact with the XCB block above.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
