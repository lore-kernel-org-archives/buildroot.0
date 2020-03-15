From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 15:49:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: disable
 introspection
In-Reply-To: <20200311191918.2488-1-fontaine.fabrice@gmail.com>
References: <20200311191918.2488-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315144941.GB19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-11 20:19 +0100, Fabrice Fontaine spake thusly:
> Build will fail if host-gobject-introspection is built before
> host-gdk-pixbuf:
> 
> Writing a loaders.cache file to use when running examples before installing gdk-pixbuf.
> Couldn't find include 'GModule-2.0.gir' (search path: '['/home/fabrice/buildroot/output/host/share', '/usr/share/gnome/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/fabrice/buildroot/output/host/share/gir-1.0', '/usr/share/gir-1.0']')
> 
> So disable introspection on target and host variant
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdk-pixbuf/gdk-pixbuf.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
> index 33de2e3d3a..59e0d5f454 100644
> --- a/package/gdk-pixbuf/gdk-pixbuf.mk
> +++ b/package/gdk-pixbuf/gdk-pixbuf.mk
> @@ -23,7 +23,10 @@ GDK_PIXBUF_CONF_ENV = \
>  HOST_GDK_PIXBUF_CONF_ENV = \
>  	gio_can_sniff=no
>  
> -GDK_PIXBUF_CONF_OPTS = --disable-glibtest
> +GDK_PIXBUF_CONF_OPTS = \
> +	--disable-glibtest \
> +	--disable-introspection
> +HOST_GDK_PIXBUF_CONF_OPTS = --disable-introspection
>  
>  ifneq ($(BR2_PACKAGE_LIBPNG),y)
>  GDK_PIXBUF_CONF_OPTS += --without-libpng
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
