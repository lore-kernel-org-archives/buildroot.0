From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 12:10:44 +0100
Subject: [Buildroot] [PATCH v7 22/33] package/dbus-cpp: switch to libefl
In-Reply-To: <1449523775-6582-23-git-send-email-romain.naour@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-23-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151208111044.GI4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> The libecore package will be removed in a followup
> patch, so switch to libefl package which contain an
> updated version of libecore.
> 
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v6: new patch
> ---
>  package/dbus-cpp/dbus-cpp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
> index 37d12e7..9236ba7 100644
> --- a/package/dbus-cpp/dbus-cpp.mk
> +++ b/package/dbus-cpp/dbus-cpp.mk
> @@ -26,9 +26,9 @@ DBUS_CPP_AUTORECONF = YES
>  DBUS_CPP_LICENSE = LGPLv2.1+
>  DBUS_CPP_LICENSE_FILES = COPYING
>  
> -ifeq ($(BR2_PACKAGE_LIBECORE),y)
> +ifeq ($(BR2_PACKAGE_EFL),y)
>  DBUS_CPP_CONF_OPTS += --enable-ecore
> -DBUS_CPP_DEPENDENCIES += libecore
> +DBUS_CPP_DEPENDENCIES += libefl
>  else
>  DBUS_CPP_CONF_OPTS += --disable-ecore
>  endif
> -- 
> 2.4.3
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
