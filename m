From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 08:58:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add
 gobject-introspection support
In-Reply-To: <20200606223649.3408185-1-fontaine.fabrice@gmail.com>
References: <20200606223649.3408185-1-fontaine.fabrice@gmail.com>
Message-ID: <20200607065809.GL13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-07 00:36 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvips/libvips.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index 001a148a7e..169fda9b10 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -21,7 +21,6 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
>  	LIBS=$(TARGET_NLS_LIBS)
>  
>  LIBVIPS_CONF_OPTS = \
> -	--disable-introspection \
>  	--without-dmalloc \
>  	--without-gsf \
>  	--without-magick \
> @@ -41,6 +40,13 @@ LIBVIPS_DEPENDENCIES = \
>  	host-pkgconf expat libglib2 \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBVIPS_CONF_OPTS += --enable-introspection
> +LIBVIPS_DEPENDENCIES += gobject-introspection
> +else
> +LIBVIPS_CONF_OPTS += --disable-introspection
> +endif
> +
>  ifeq ($(BR2_PACKAGE_JPEG),y)
>  LIBVIPS_CONF_OPTS += --with-jpeg
>  LIBVIPS_DEPENDENCIES += jpeg
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
