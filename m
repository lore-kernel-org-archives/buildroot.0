From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:38:07 +0200
Subject: [Buildroot] [PATCH 01/12] package/libsecret: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200406203807.GT22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-31 17:21 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, add the gobject-introspection package to
> the dependency list and set the conf opt --enable-introspection.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Except for patch 2, on which Thomas asked a question that was not
answered, I have applied the entire series to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/libsecret/libsecret.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
> index b48d2e7086..f87df47097 100644
> --- a/package/libsecret/libsecret.mk
> +++ b/package/libsecret/libsecret.mk
> @@ -15,11 +15,17 @@ LIBSECRET_CONF_OPTS = \
>  	--disable-manpages \
>  	--disable-strict \
>  	--disable-coverage \
> -	--enable-introspection=no \
>  	--enable-vala=no
>  LIBSECRET_LICENSE = LGPL-2.1+
>  LIBSECRET_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBSECRET_CONF_OPTS += --enable-introspection=yes
> +LIBSECRET_DEPENDENCIES += gobject-introspection
> +else
> +LIBSECRET_CONF_OPTS += --enable-introspection=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  LIBSECRET_DEPENDENCIES += libgcrypt
>  LIBSECRET_CONF_OPTS += --enable-gcrypt \
> -- 
> 2.25.1
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
