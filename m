From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 09 May 2014 20:44:02 +0200
Subject: [Buildroot] [PATCH] package/xbmc: add missing dependency on
	libtheora
References: <1399588125-11165-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <i8kv3bxp0t.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:1399588125-11165-1-git-send-email-yann.morin.1998 at free.fr: 

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Signed-off-by: "Yann E. MORIN"
> <yann.morin.1998@free.fr> Cc: Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> Cc: Bernd
> Kuhls <berndkuhls@hotmail.com> ---
>  package/xbmc/xbmc.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 1bfc17d..c7a4607 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -127,6 +127,10 @@ ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
>  XBMC_DEPENDENCIES += wavpack
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XBMC_LIBTHEORA),y)
> +XBMC_DEPENDENCIES += libtheora
> +endif
> +
>  # Add HOST_DIR to PATH for codegenerator.mk to find swig
>  define XBMC_BOOTSTRAP
>       cd $(@D) && PATH=$(BR_PATH) AUTOPOINT=/bin/true ./bootstrap

Acked-by Bernd Kuhls <bernd.kuhls@t-online.de>
