From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2009 08:09:22 +0200
Subject: [Buildroot] [PATCH] SDL_image: fix runtime libjpeg failure
In-Reply-To: <20091109130709.GF26599@jasper.tkos.co.il>
References: <20091109130709.GF26599@jasper.tkos.co.il>
Message-ID: <20091123060922.GA6897@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

Ping?

Should I open a Bugzilla entry to have this issue handled?
Is there a better solutions?

baruch

On Mon, Nov 09, 2009 at 03:07:09PM +0200, Baruch Siach wrote:
> From d86e3115e0beaf281e791a78a5e73bac69f14128 Mon Sep 17 00:00:00 2001
> From: Baruch Siach <baruch@tkos.co.il>
> Date: Mon, 9 Nov 2009 14:53:30 +0200
> Subject: [PATCH] SDL_image: fix runtime libjpeg failure
> 
> By default SDL_image loads libjpeg at runtime on-demand. The find_lib routine
> in the configure script of SLD_image searches the /usr/lib directory of the
> host machine to find the file name of the jpeg library.
> 
> When the host on which Buildroot is being built contains newer version of
> libjpeg (e.g. libjpeg7), the configure script incorrectly uses its file name.
> The result is a runtime failure to load libjpeg.
> 
> Fix this by disabling runtime load of libjpeg.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/sdl_image/sdl_image.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
> index 382c0b1..c12ae8e 100644
> --- a/package/sdl_image/sdl_image.mk
> +++ b/package/sdl_image/sdl_image.mk
> @@ -14,6 +14,7 @@ SDL_IMAGE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
>         --with-sdl-exec-prefix=$(STAGING_DIR)/usr \
>         --disable-sdltest \
>         --disable-static \
> +       --disable-jpg-shared \
>         --enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
>         --enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
>         --enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
> -- 
> 1.6.5

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
