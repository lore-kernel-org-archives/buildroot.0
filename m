From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 08:57:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsvg: add
 gobject-introspection support
In-Reply-To: <20200606223306.3374021-1-fontaine.fabrice@gmail.com>
References: <20200606223306.3374021-1-fontaine.fabrice@gmail.com>
Message-ID: <20200607065744.GK13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-07 00:33 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/librsvg/librsvg.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> index 470910d94c..e124fdd5d3 100644
> --- a/package/librsvg/librsvg.mk
> +++ b/package/librsvg/librsvg.mk
> @@ -10,7 +10,7 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_
>  LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
>  LIBRSVG_INSTALL_STAGING = YES
>  LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> -LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
> +LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools
>  HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
>  LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
>  	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
> @@ -19,5 +19,12 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libgli
>  LIBRSVG_LICENSE = LGPL-2.0+
>  LIBRSVG_LICENSE_FILES = COPYING.LIB
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBRSVG_CONF_OPTS += --enable-introspection
> +LIBRSVG_DEPENDENCIES += gobject-introspection
> +else
> +LIBRSVG_CONF_OPTS += --disable-introspection
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.26.2
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
