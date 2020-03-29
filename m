From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 23:16:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable examples
In-Reply-To: <20200329210110.4101545-1-fontaine.fabrice@gmail.com>
References: <20200329210110.4101545-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329211609.GQ22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-29 23:01 +0200, Fabrice Fontaine spake thusly:
> Disable examples through the new meson option (they are enabled by
> default)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gupnp/gupnp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index 612359ba55..66a6e76574 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -12,6 +12,7 @@ GUPNP_LICENSE = LGPL-2.0+
>  GUPNP_LICENSE_FILES = COPYING
>  GUPNP_INSTALL_STAGING = YES
>  GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
> +GUPNP_CONF_OPTS = -Dexamples=false
>  
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  GUPNP_CONF_OPTS += -Dintrospection=true
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
