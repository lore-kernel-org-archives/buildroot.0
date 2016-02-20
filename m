From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2016 18:40:40 +0100
Subject: [Buildroot] [PATCH 6/8] package/links: add
 --with/--without-libtiff
In-Reply-To: <1455986411-14273-7-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
 <1455986411-14273-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160220174040.GK3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-02-20 17:40 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/links/links.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/links/links.mk b/package/links/links.mk
> index 26af392..3486d94 100644
> --- a/package/links/links.mk
> +++ b/package/links/links.mk
> @@ -31,7 +31,10 @@ ifeq ($(BR2_PACKAGE_JPEG),y)
>  LINKS_DEPENDENCIES += jpeg
>  endif
>  ifeq ($(BR2_PACKAGE_TIFF),y)
> +LINKS_CONF_OPTS += --with-libtiff
>  LINKS_DEPENDENCIES += tiff
> +else
> +LINKS_CONF_OPTS += --without-libtiff
>  endif
>  endif
>  
> -- 
> 2.7.0
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
