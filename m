From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 23:17:20 +0200
Subject: [Buildroot] [PATCH v4 1/4] package/imagemagick: add host package
In-Reply-To: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180824211720.GS9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-08-24 15:44 +0200, Angelo Compagnucci spake thusly:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds the host package for imagemagick.
> It comes with a minimal selection of configure options to
> compile fast cause it is used only to convert
> the image files for the custom linux logo.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

You forgot to carry my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/imagemagick.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 4aa9d56..0eb94b7 100644
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
