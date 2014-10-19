From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 13:49:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/libpciaccess: Add optional
 support for zlib
In-Reply-To: <1413716896-15085-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413716896-15085-1-git-send-email-bernd.kuhls@t-online.de>
 <1413716896-15085-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019114947.GT4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-19 13:08 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libpciaccess/libpciaccess.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
> index 010707e..f27925d 100644
> --- a/package/libpciaccess/libpciaccess.mk
> +++ b/package/libpciaccess/libpciaccess.mk
> @@ -11,4 +11,11 @@ LIBPCIACCESS_LICENSE = MIT
>  LIBPCIACCESS_LICENSE_FILES = COPYING
>  LIBPCIACCESS_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +LIBPCIACCESS_CONF_OPTS += --with-zlib
> +LIBPCIACCESS_DEPENDENCIES += zlib
> +else
> +LIBPCIACCESS_CONF_OPTS += --without-zlib
> +endif
> +
>  $(eval $(autotools-package))
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
