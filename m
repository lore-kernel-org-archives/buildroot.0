From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Mar 2020 23:16:51 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/gssdp: enable vala support
 if gobject-introspection is selected
In-Reply-To: <20200327183000.1005676-3-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-3-aduskett@gmail.com>
Message-ID: <20200331211651.GT22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, all,

On 2020-03-27 11:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> gupnp gobject-introspection support requires gssdp built with vala bindings.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master with an extended commit log. Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/gssdp/gssdp.mk | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> index bab3cbe0f7..d91c8acda0 100644
> --- a/package/gssdp/gssdp.mk
> +++ b/package/gssdp/gssdp.mk
> @@ -12,15 +12,13 @@ GSSDP_LICENSE = LGPL-2.0+
>  GSSDP_LICENSE_FILES = COPYING
>  GSSDP_INSTALL_STAGING = YES
>  GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
> -GSSDP_CONF_OPTS = \
> -	-Dexamples=false \
> -	-Dvapi=false
> +GSSDP_CONF_OPTS = -Dexamples=false
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -GSSDP_CONF_OPTS += -Dintrospection=true
> -GSSDP_DEPENDENCIES += gobject-introspection
> +GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
> +GSSDP_DEPENDENCIES += host-vala gobject-introspection
>  else
> -GSSDP_CONF_OPTS += -Dintrospection=false
> +GSSDP_CONF_OPTS += -Dintrospection=false -Dvapi=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGTK3),y)
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
