From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:34:50 -0500
Subject: [Buildroot] [PATCH 14/15] package/targetcli-fb: adapt to
 preset-all
In-Reply-To: <20191103165640.21819-15-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-15-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4qBkUmLAHS1ASaWM=VMJM8VRtVkmEgxfg9f1s5O+FC7+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> the service was not enabled, we now need to disable it explicitly
Is there a reason we should not have this enabled? It not being enable looks to
be a bug.
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/targetcli-fb/50-targetcli-fb.preset | 1 +
>  package/targetcli-fb/targetcli-fb.mk        | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 package/targetcli-fb/50-targetcli-fb.preset
>
> diff --git a/package/targetcli-fb/50-targetcli-fb.preset b/package/targetcli-fb/50-targetcli-fb.preset
> new file mode 100644
> index 0000000000..572ee4fb93
> --- /dev/null
> +++ b/package/targetcli-fb/50-targetcli-fb.preset
> @@ -0,0 +1 @@
> +disable target.service.service
> diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> index 75643446d2..5e50643bc9 100644
> --- a/package/targetcli-fb/targetcli-fb.mk
> +++ b/package/targetcli-fb/targetcli-fb.mk
> @@ -21,6 +21,8 @@ endef
>  define TARGETCLI_FB_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -m 0644 -D package/targetcli-fb/target.service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/target.service
> +       $(INSTALL) -D -m 644 package/targetcli-fb/50-targetcli-fb.preset \
> +               $(TARGET_DIR)/usr/lib/systemd/system-preset/50-targetcli-fb.preset
>  endef
>
>  # Targetcli stores its configuration in /etc/target/saveconfig.json
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
