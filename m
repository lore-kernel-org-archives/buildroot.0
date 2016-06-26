From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:57:06 +0200
Subject: [Buildroot] [PATCH 1/1] Signed-off-by: PeterThompson
 <peter.macleod.thompson@gmail.com>
In-Reply-To: <1466910144-17919-1-git-send-email-peter.macleod.thompson@gmail.com>
References: <1466910144-17919-1-git-send-email-peter.macleod.thompson@gmail.com>
Message-ID: <20160626145706.6342d905@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As Baruch said, the first line of your commit should be:

	sdl2_ttf: new package

On Sat, 25 Jun 2016 21:02:24 -0600, Peter Thompson wrote:
> From: PeterThompson <peter.macleod.thompson@gmail.com>

Please add a space between Peter and Thompson.

> 
> sdl2_ttf created from sdl_ttf with minor changes for sdl2
> 
> Signed-off-by: PeterThompson <peter.macleod.thompson@gmail.com>

Ditto.

> new file mode 100644
> index 0000000..8eb480f
> --- /dev/null
> +++ b/package/sdl2_ttf/sdl2_ttf.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# sdl2_ttf
> +#
> +################################################################################
> +
> +SDL2_TTF_VERSION = 2.0.14
> +SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
> +SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
> +SDL2_TTF_LICENSE = zlib
> +SDL2_TTF_LICENSE_FILES = COPYING
> +
> +SDL2_TTF_INSTALL_STAGING = YES
> +SDL2_TTF_DEPENDENCIES = sdl2 freetype
> +SDL2_TTF_CONF_OPTS = \
> +	--without-x \
> +	--with-freetype-prefix=$(STAGING_DIR)/usr \
> +	--with-sdl2-prefix=$(STAGING_DIR)/usr
> +
> +SDL2_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL2"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"

The LDFLAGS should not be needed, as searching for libraries in
$(STAGING_DIR)/usr/lib is the default. Regarding the INCLUDES variable,
it's also a bit weird, since you're already passing
--with-sdl2-prefix=$(STAGING_DIR)/usr in CONF_OPTS.

Please include a blank line before the last variable definition and the
call to the autotools-package macro.

Finally, please add a hash file (see
https://buildroot.org/downloads/manual/manual.html#adding-packages-hash).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
