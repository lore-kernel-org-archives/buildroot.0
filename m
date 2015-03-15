From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2015 23:47:56 +0100
Subject: [Buildroot] [PATCH v4] wine: Add gettext dependency for
	host-wine
In-Reply-To: <55056E86.5020109@dawncrow.de>
References: <55056E86.5020109@dawncrow.de>
Message-ID: <20150315224756.GE4104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-03-15 12:35 +0100, Andr? Hentschel spake thusly:
> Mostly based on a comment by Yann E. MORIN
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested by running readelf on 'wrc' and checking it is now linked
 with libgettextpo.so.0]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wine/wine.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index aa474f9..a699fff 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -243,6 +243,10 @@ else
>  WINE_CONF_OPTS += --without-zlib
>  endif
>  
> +# host-gettext is essential for .po file support in host-wine wrc
> +HOST_WINE_DEPENDENCIES += host-gettext
> +HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
> +
>  # Wine needs to enable 64-bit build tools on 64-bit host
>  ifeq ($(HOSTARCH),x86_64)
>  HOST_WINE_CONF_OPTS += --enable-win64
> @@ -280,8 +284,6 @@ HOST_WINE_CONF_OPTS += \
>  	--without-curses \
>  	--without-dbus \
>  	--without-fontconfig \
> -	--without-gettext \
> -	--without-gettextpo \
>  	--without-gphoto \
>  	--without-glu \
>  	--without-gnutls \
> -- 
> 1.9.1
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
