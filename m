From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 22:45:56 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/imagemagick: add host package
In-Reply-To: <1527628939-7389-2-git-send-email-angelo@amarulasolutions.com>
References: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
 <1527628939-7389-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180630204556.GB23012@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-05-29 23:22 +0200, Angelo Compagnucci spake thusly:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch add the host package for imagemagick.
> It comes with a minimal selection of configure options to
> compile fast, it's indeed only used to convert
> the image file for the custom linux logo.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/imagemagick.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 1165438..c319589 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -143,4 +143,15 @@ else
>  IMAGEMAGICK_CONF_OPTS += --without-bzlib
>  endif
>  
> +HOST_IMAGEMAGICK_CONF_OPTS = \
> +	--with-jpeg \
> +	--with-png \
> +	--with-zlib
> +
> +HOST_IMAGEMAGICK_DEPENDENCIES = \
> +	host-libjpeg \
> +	host-libpng \
> +	host-zlib
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.7.4
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
