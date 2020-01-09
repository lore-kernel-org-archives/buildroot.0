From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 17:51:11 +0100
Subject: [Buildroot] [PATCH] package/libupnp18: add config option
 --enable-reuseaddr
In-Reply-To: <20200109103241.3786-1-joerg.krause@embedded.rocks>
References: <20200109103241.3786-1-joerg.krause@embedded.rocks>
Message-ID: <20200109165111.GK17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2020-01-09 11:32 +0100, J?rg Krause spake thusly:
> Enable the option to use SO_REUSEADDR on the built-in miniserver
> socket to allow clean restarts [1].
> 
> This fixes a runtime issue with Gerbera and possible other programs
> which does not allow a graceful restart otherwise.
> 
> [1] https://github.com/pupnp/pupnp/commit/629dec75610260a669c7c3ed40c9332b7917b562
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libupnp18/libupnp18.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
> index ca82a54413..f73c656831 100644
> --- a/package/libupnp18/libupnp18.mk
> +++ b/package/libupnp18/libupnp18.mk
> @@ -13,6 +13,9 @@ LIBUPNP18_LICENSE = BSD-3-Clause
>  LIBUPNP18_LICENSE_FILES = COPYING
>  LIBUPNP18_DEPENDENCIES = host-pkgconf
>  
> +# Bind the internal miniserver socket with reuseaddr to allow clean restarts.
> +LIBUPNP18_CONF_OPTS += --enable-reuseaddr
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LIBUPNP18_CONF_OPTS += --enable-open-ssl
>  LIBUPNP18_DEPENDENCIES += openssl
> -- 
> 2.24.1
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
