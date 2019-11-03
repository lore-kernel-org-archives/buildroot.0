From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:17:39 -0500
Subject: [Buildroot] [PATCH 08/15] package/dante: adapt to preset-all
In-Reply-To: <20191103165640.21819-9-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-9-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4oEPjykbrgRk6Q98v07u2A6JXGO0H4MpUBhzg70gu3U2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> dante was not enabled, we now need to disable it explicitly
Isn't it a bug that dante was not enabled previously? Is there a
reason it should
not be enabled?
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/dante/50-dante.preset | 1 +
>  package/dante/dante.mk        | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 package/dante/50-dante.preset
>
> diff --git a/package/dante/50-dante.preset b/package/dante/50-dante.preset
> new file mode 100644
> index 0000000000..9fc7ab171a
> --- /dev/null
> +++ b/package/dante/50-dante.preset
> @@ -0,0 +1 @@
> +disable dante.service
> diff --git a/package/dante/dante.mk b/package/dante/dante.mk
> index 0bd036d37e..82b7b9629f 100644
> --- a/package/dante/dante.mk
> +++ b/package/dante/dante.mk
> @@ -31,6 +31,8 @@ DANTE_POST_INSTALL_TARGET_HOOKS += DANTE_INSTALL_CONFIG_FILE
>  define DANTE_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/dante/dante.service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/dante.service
> +       $(INSTALL) -D -m 644 package/dante/50-dante.preset \
> +               $(TARGET_DIR)/usr/lib/systemd/system-preset/50-dante.preset
>  endef
>
>  define DANTE_INSTALL_INIT_SYSV
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
