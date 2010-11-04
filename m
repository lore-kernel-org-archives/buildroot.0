From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 4 Nov 2010 10:10:10 +0200
Subject: [Buildroot] [PATCH 06/12] gdk-pixbuf/libgtk2: move gdk-pixbuf
 loader cache setup script
In-Reply-To: <1288839031-24277-7-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-7-git-send-email-llandwerlin@gmail.com>
Message-ID: <AANLkTim29pJsaP9u=BMjL+vtxxF-BZan7TYof1FFOntH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 4, 2010 at 4:50 AM,  <llandwerlin@gmail.com> wrote:
> From: Lionel Landwerlin <llandwerlin@gmail.com>
>
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---

[...]

> diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
> index 4c3e108..c54f0a6 100644
> --- a/package/gdk-pixbuf/gdk-pixbuf.mk
> +++ b/package/gdk-pixbuf/gdk-pixbuf.mk
> @@ -40,6 +40,10 @@ endif
>
>  GDK_PIXBUF_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 libiconv
>
> +define GDK_PIXBUF_POST_INSTALL_TWEAKS
> +       $(INSTALL) -m 755 package/gdk-pixbuf/S26gdk-pixbuf $(TARGET_DIR)/etc/init.d/
> +endef
> +

Oh... come on!.. Don't break it the third time in these couple months :)
You defined the hook - OK, but who will call it?
- Hide quoted text -

>  $(eval $(call AUTOTARGETS,package,gdk-pixbuf))
>
>  HOST_GDK_PIXBUF_CONF_OPT = \
