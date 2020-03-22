From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:45:31 +0100
Subject: [Buildroot] [PATCH 1/5] package/libsoup: add optional
 dependency for gobject-introspection
In-Reply-To: <20200315172459.881615-1-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
Message-ID: <20200322104531.GA2364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-15 10:24 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, explicitly set --with-introspection in
> the configure options and add a dependency for gobject-introspection.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Series applied to master, except for path 4 which had a review by
Fabrice and thus needs some more work. Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/libsoup/libsoup.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
> index 95bd682010..07c9d787bd 100644
> --- a/package/libsoup/libsoup.mk
> +++ b/package/libsoup/libsoup.mk
> @@ -16,6 +16,13 @@ LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no --with-gssapi=no
>  LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
>  	libglib2 libxml2 sqlite host-intltool
>  
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBSOUP_CONF_OPTS += --with-introspection
> +LIBSOUP_DEPENDENCIES += gobject-introspection
> +else
> +LIBSOUP_CONF_OPTS += --without-introspection
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
>  LIBSOUP_CONF_OPTS += --with-gnome
>  else
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
