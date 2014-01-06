From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jan 2014 17:26:37 +0800
Subject: [Buildroot] [PATCH] Add LBreakout2 package (SDL game)
In-Reply-To: <1388999577-9681-1-git-send-email-julien.boibessot@free.fr>
References: <1388999577-9681-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140106172637.6a479999@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

Thanks for contributing this patch!

On Mon,  6 Jan 2014 10:12:57 +0100, julien.boibessot at free.fr wrote:
> --- /dev/null
> +++ b/package/lbreakout2/lbreakout2.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# LBreakout2

This should be all lower case.

> +#
> +#############################################################
> +
> +LBREAKOUT2_SITE = http://sourceforge.net/projects/lgames/files/lbreakout2/2.6/

This should use a downloads.sourceforge.net URL, like all other
sourceforge packages in BR.

> +LBREAKOUT2_VERSION = 2.6.3

There is a newer 2.6.4 version.

> +LBREAKOUT2_LICENSE = GPLv2

License is GPLv2+

> +LBREAKOUT2_LICENSE_FILES = COPYING
> +
> +LBREAKOUT2_DEPENDENCIES = sdl libpng
> +LBREAKOUT2_CONF_OPT = --disable-nls

Passing this option is not needed. It is automatically passed by the
autotools infrastructure we needed.

> +
> +ifeq ($(BR2_PACKAGE_LBREAKOUT2_AUDIO),y)
> +LBREAKOUT2_DEPENDENCIES += sdl_mixer

Maybe pass --enable-audio here.

> +else
> +LBREAKOUT2_CONF_OPT += --disable-audio
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LBREAKOUT2_NET),y)
> +LBREAKOUT2_DEPENDENCIES += sdl_net

And --enable-network here.

> +else
> +LBREAKOUT2_CONF_OPT += --disable-network
> +endif
> +
> +LBREAKOUT2_CONF_ENV = \
> +	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
> +
> +$(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
