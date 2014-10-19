From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 12:23:52 +0200
Subject: [Buildroot] [PATCH v2 3/3] Apply --disable-gtk-doc-html to all
 packages
In-Reply-To: <1413712743-21832-3-git-send-email-bernd.kuhls@t-online.de>
References: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
 <1413712743-21832-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019102352.GQ4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-19 11:59 +0200, Bernd Kuhls spake thusly:
> Move this option to package/pkg-autotools.mk so it applies to all packages.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Ditto:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: no changes
> 
>  package/pango/pango.mk   |    2 +-
>  package/pkg-autotools.mk |    2 ++
>  package/webkit/webkit.mk |    1 -
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pango/pango.mk b/package/pango/pango.mk
> index 46490c1..a18a49d 100644
> --- a/package/pango/pango.mk
> +++ b/package/pango/pango.mk
> @@ -40,7 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
>  		ac_use_included_regex=no gl_cv_c_restrict=no \
>  		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
>  
> -PANGO_CONF_OPTS = --enable-explicit-deps=no --disable-gtk-doc-html
> +PANGO_CONF_OPTS = --enable-explicit-deps=no
>  
>  PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
>  	host-pkgconf \
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 80adc8b..dbb8d96 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -137,6 +137,7 @@ define $(2)_CONFIGURE_CMDS
>  		--localstatedir=/var \
>  		--program-prefix="" \
>  		--disable-gtk-doc \
> +		--disable-gtk-doc-html \
>  		--disable-doc \
>  		--disable-docs \
>  		--disable-documentation \
> @@ -170,6 +171,7 @@ define $(2)_CONFIGURE_CMDS
>  		--localstatedir="$$(HOST_DIR)/var" \
>  		--enable-shared --disable-static \
>  		--disable-gtk-doc \
> +		--disable-gtk-doc-html \
>  		--disable-doc \
>  		--disable-docs \
>  		--disable-documentation \
> diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
> index 77b533a..0694a5b 100644
> --- a/package/webkit/webkit.mk
> +++ b/package/webkit/webkit.mk
> @@ -45,7 +45,6 @@ WEBKIT_CONF_OPTS += \
>  	--disable-webkit2 \
>  	--disable-glibtest \
>  	--disable-video \
> -	--disable-gtk-doc-html \
>  	--disable-tests
>  
>  # Xorg Dependencies
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
