From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2016 18:43:48 +0100
Subject: [Buildroot] [PATCH 3/8] package/links: add --with/--without-ssl
In-Reply-To: <1455986411-14273-4-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
 <1455986411-14273-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160220174348.GN3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-02-20 17:40 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/links/links.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/links/links.mk b/package/links/links.mk
> index 3515e5f..3a4519f 100644
> --- a/package/links/links.mk
> +++ b/package/links/links.mk
> @@ -44,7 +44,10 @@ LINKS_DEPENDENCIES += libevent
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LINKS_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr --enable-ssl-pkgconfig

So, even when using pkg-config, we still need to tell it where OpenSSL
is located?

Regards,
Yann E. MORIN.

>  LINKS_DEPENDENCIES += openssl
> +else
> +LINKS_CONF_OPTS += --without-ssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XZ),y)
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
