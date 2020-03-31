From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Mar 2020 23:17:28 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/gupnp: Depend on host-vala
 if gobject-introspection is selected.
In-Reply-To: <20200327183000.1005676-6-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-6-aduskett@gmail.com>
Message-ID: <20200331211728.GU22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-27 11:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Because there is no way to select host-vala explicitly and some packages may
> require the vala bindings, it is better to unconditionally build the vala
> bindings into the .gir and .typelib files.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master with a tweaked comit log, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/gupnp/gupnp.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index 612359ba55..c86eb6db2c 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -14,10 +14,10 @@ GUPNP_INSTALL_STAGING = YES
>  GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -GUPNP_CONF_OPTS += -Dintrospection=true
> -GUPNP_DEPENDENCIES += gobject-introspection
> +GUPNP_CONF_OPTS += -Dintrospection=true -Dvapi=true
> +GUPNP_DEPENDENCIES += host-vala gobject-introspection
>  else
> -GUPNP_CONF_OPTS += -Dintrospection=false
> +GUPNP_CONF_OPTS += -Dintrospection=false -Dvapi=false
>  endif
>  
>  $(eval $(meson-package))
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
