From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 09:28:25 +0100
Subject: [Buildroot] [PATCH 1/2] package/sdl_mixer: add host-pkgconf
 dependency
In-Reply-To: <20191230210953.1144882-1-fontaine.fabrice@gmail.com>
References: <20191230210953.1144882-1-fontaine.fabrice@gmail.com>
Message-ID: <20191231082825.GY26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-30 22:09 +0100, Fabrice Fontaine spake thusly:
> host-pkgconf is needed to find libmodplug
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/83f378d9d01424678006434bb1e4a49cf4131fdf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl_mixer/sdl_mixer.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
> index 0423817316..ab6f7ef014 100644
> --- a/package/sdl_mixer/sdl_mixer.mk
> +++ b/package/sdl_mixer/sdl_mixer.mk
> @@ -37,7 +37,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
>  SDL_MIXER_CONF_OPTS += --enable-music-mod-modplug
> -SDL_MIXER_DEPENDENCIES += libmodplug
> +SDL_MIXER_DEPENDENCIES += host-pkgconf libmodplug
>  else
>  SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
>  endif
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
