From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Nov 2019 18:18:00 +0100
Subject: [Buildroot] [PATCH] package/libftdi: don't override license
 files variable
In-Reply-To: <20191125070319.22261-1-b.bilas@grinn-global.com>
References: <20191125070319.22261-1-b.bilas@grinn-global.com>
Message-ID: <20191125171800.GL32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2019-11-25 08:03 +0100, Bartosz Bilas spake thusly:
> Fixes:
>   package/libftdi/libftdi.mk:22: conditional override of variable LIBFTDI_LICENSE_FILES

Thanks for fixing my mess. :-)

> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libftdi/libftdi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
> index cafa40eed4..257342622f 100644
> --- a/package/libftdi/libftdi.mk
> +++ b/package/libftdi/libftdi.mk
> @@ -19,7 +19,7 @@ LIBFTDI_CONF_OPTS = --without-examples
>  # configure detect it automaticaly so we need to force it
>  ifeq ($(BR2_PACKAGE_LIBFTDI_CPP),y)
>  LIBFTDI_LICENSE += , GPL-2.0 with exception (ftdipp)
> -LIBFTDI_LICENSE_FILES = COPYING.GPL
> +LIBFTDI_LICENSE_FILES += COPYING.GPL
>  LIBFTDI_DEPENDENCIES += boost
>  LIBFTDI_CONF_OPTS += --enable-libftdipp
>  else
> -- 
> 2.11.0
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
