From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 22:16:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: add libvdpau optional
 dependency
In-Reply-To: <20200118183732.1114950-1-fontaine.fabrice@gmail.com>
References: <20200118183732.1114950-1-fontaine.fabrice@gmail.com>
Message-ID: <20200118211621.GF32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-01-18 19:37 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpv/mpv.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index f92b604c28..2150f7e9aa 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -30,7 +30,6 @@ MPV_CONF_OPTS = \
>  	--disable-uchardet \
>  	--disable-vapoursynth \
>  	--disable-vapoursynth-lazy \
> -	--disable-vdpau \
>  	--disable-mali-fbdev
>  
>  # ALSA support requires pcm+mixer
> @@ -130,6 +129,14 @@ else
>  MPV_CONF_OPTS += --disable-drm
>  endif
>  
> +# libvdpau
> +ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
> +MPV_CONF_OPTS += --enable-vdpau
> +MPV_DEPENDENCIES += libvdpau
> +else
> +MPV_CONF_OPTS += --disable-vdpau
> +endif
> +
>  # LUA support, only for lua51/lua52/luajit
>  # This enables the controller (OSD) together with libass
>  ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
> -- 
> 2.24.1
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
