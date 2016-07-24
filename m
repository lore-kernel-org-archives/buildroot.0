From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:04:47 +0200
Subject: [Buildroot] [PATCH] package/sdl2_ttf: x-includes and
 x-libraries must be set for cross-compiling
In-Reply-To: <1469269182-16000-1-git-send-email-romain.naour@gmail.com>
References: <1469269182-16000-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724150447.57fd9303@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 12:19:42 +0200, Romain Naour wrote:

> +# x-includes and x-libraries must be set for cross-compiling
> +# By default x_includes and x_libraries contains unsafe paths.
> +# (/usr/include and /usr/lib)
> +ifeq ($(BR2_PACKAGE_SDL2_X11),y)
> +SDL2_TTF_CONF_OPTS += --with-x=$(STAGING_DIR) \

I *think* --with-x doesn't look at its argument, so I've changed this
to just --with-x.

> +	--x-includes=$(STAGING_DIR)/usr/include \
> +	--x-libraries=$(STAGING_DIR)/usr/lib
> +else
> +SDL2_TTF_CONF_OPTS += --with-x=no

And I've changed this to --without-x.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
