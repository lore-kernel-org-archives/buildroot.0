From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 22:00:16 +0200
Subject: [Buildroot] [PATCH v8 13/28] sdl: Add new dependency libglu for
 opengl support
In-Reply-To: <1400342276-10303-14-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-14-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517200016.GE3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sdl/sdl.mk |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index 8d0e5bd..e8ee0c0 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -62,9 +62,12 @@ SDL_DEPENDENCIES += alsa-lib
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MESA3D),y)
> -SDL_DEPENDENCIES += mesa3d
> +SDL_DEPENDENCIES += libglu mesa3d
> +SDL_CONF_OPT += --enable-video-opengl
>  endif
>  
> +SDL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)

It looks like this should be in a separate patch. If it is needed here,
then please expand the commit log with the reason libiconv is now a
dependency of sdl.

Regards,
Yann E. MORIN.

>  SDL_CONF_OPT += --enable-pulseaudio=no \
>  		--disable-arts \
>  		--disable-esd \
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
