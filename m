From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 13:03:04 +0200
Subject: [Buildroot] [PATCH 2/3] package/libuio: disable Werror
In-Reply-To: <1467450008-27597-2-git-send-email-romain.naour@smile.fr>
References: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
 <1467450008-27597-2-git-send-email-romain.naour@smile.fr>
Message-ID: <20160702110304.GK22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-02 11:00 +0200, Romain Naour spake thusly:
> Disable -Werror to avoid build issues caused by warnings.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Reported-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libuio/libuio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
> index 6a73d23..c254d0d 100644
> --- a/package/libuio/libuio.mk
> +++ b/package/libuio/libuio.mk
> @@ -9,7 +9,7 @@ LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
>  LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
>  LIBUIO_LICENSE = LGPLv2.1 (library), GPLv2 (programs)
>  LIBUIO_LICENSE_FILES = COPYING
> -LIBUIO_CONF_OPTS = --with-glib=no
> +LIBUIO_CONF_OPTS = --with-glib=no --without-werror
>  LIBUIO_INSTALL_STAGING = YES
>  
>  # Fetched from github, no pre-generated configure script provided
> -- 
> 2.5.5
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
