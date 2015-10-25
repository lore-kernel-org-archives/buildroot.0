From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 15:41:39 +0100
Subject: [Buildroot] [PATCH v5 10/36] package/efl/libefl: add webp
 dependency
In-Reply-To: <1445720476-21517-11-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-11-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025144138.GG11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> WebP is a new image format that provides lossless and lossy
> compression for images on the web. So enabling webp support
> in efl libraries allow to loads images using WebP.
> 
> Also, it one of the "highly recommended" dependecies [1]
> according to the README but disabling it doesn't need
> the --enable-i-really-know-what-i-am-doing... option.
> That's why BR2_PACKAGE_LIBEFL_WEBP is not added to
> BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.
> 
> [1] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n486
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: rename to libefl
>     improve commit log
> ---
>  package/efl/libefl/Config.in | 5 +++++
>  package/efl/libefl/libefl.mk | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index 5c65744..c72ea7e 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -65,4 +65,9 @@ config BR2_PACKAGE_LIBEFL_TIFF
>  	help
>  	  This enables the loader code that loads tiff files.
>  
> +config BR2_PACKAGE_LIBEFL_WEBP
> +	bool "libevas webp image loader"

You forgot to select BR2_PACKAGE_WEBP.

Regards,
Yann E. MORIN.

> +	help
> +	  This enables the loader code that loads images using WebP.
> +
>  endif # BR2_PACKAGE_LIBEFL
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index c7ecf51..9633630 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -195,6 +195,13 @@ else
>  LIBEFL_CONF_OPTS += --enable-image-loader-tiff=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
> +LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
> +LIBEFL_DEPENDENCIES += webp
> +else
> +LIBEFL_CONF_OPTS += --enable-image-loader-webp=no
> +endif
> +
>  $(eval $(autotools-package))
>  
>  ################################################################################
> -- 
> 2.4.3
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
