From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 21:41:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: add image
 printing support
In-Reply-To: <20200501155524.5478-1-skif@skif-web.ru>
References: <20200501155524.5478-1-skif@skif-web.ru>
Message-ID: <20200501194108.GD3687@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2020-05-01 18:55 +0300, Alexey Lukyanchuk spake thusly:
> Cups can print images like jpeg/png.
> 
> In current version it's disabled, but may be needed for some customers.
> 
> This patch add cups-filters for images.
> 
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  package/cups-filters/cups-filters.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index 3bb33d963c..1fba61ad15 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -11,8 +11,7 @@ CUPS_FILTERS_LICENSE_FILES = COPYING
>  
>  CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
>  
> -CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
> -	--disable-mutool \
> +CUPS_FILTERS_CONF_OPTS = --disable-mutool \

We like to have explicit enable, rather than rely on the defaults, so
I've added an explicit --enable-imagefilters, reworded the commit log,
and applied to master, thanks.

Regards,
Yann E. MORIN.

>  	--disable-foomatic \
>  	--disable-braille \
>  	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
> -- 
> 2.17.1
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
