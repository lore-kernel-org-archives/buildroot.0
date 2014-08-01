From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Aug 2014 23:32:28 +0200
Subject: [Buildroot] [PATCH v16 3/3] xbmc: Add VA-API support
In-Reply-To: <1406914359-31106-4-git-send-email-bernd.kuhls@t-online.de>
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
 <1406914359-31106-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140801213228.GG3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-01 19:32 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xbmc/xbmc.mk |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 920d731..880b3d4 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -52,7 +52,6 @@ XBMC_CONF_OPT +=  \
>  	--disable-projectm \
>  	--disable-pulse \
>  	--disable-ssh \
> -	--disable-vaapi \
>  	--disable-vdpau \
>  	--disable-vtbdecoder \
>  	--enable-optimizations
> @@ -186,6 +185,14 @@ ifeq ($(BR2_PACKAGE_XBMC_LIBTHEORA),y)
>  XBMC_DEPENDENCIES += libtheora
>  endif
>  
> +# xbmc needs libva & libva-glx
> +ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
> +XBMC_DEPENDENCIES += mesa3d libva
> +XBMC_CONF_OPT += --enable-vaapi
> +else
> +XBMC_CONF_OPT += --disable-vaapi
> +endif
> +
>  # Add HOST_DIR to PATH for codegenerator.mk to find swig
>  define XBMC_BOOTSTRAP
>  	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
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
