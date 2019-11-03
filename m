From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:15:38 -0500
Subject: [Buildroot] [PATCH 06/15] package/avahi: adapt to preset-all
In-Reply-To: <20191103165640.21819-7-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-7-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4r_o-HqfRQUOpi+6h92R=AX9kLN5yQr3y-pV8LSGKoYxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> avahi was not enabled, we now need to disable it explicitly
Isn't avahi not being enabled a bug? Why do we want to have it disabled?
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/avahi/50-avahi.preset | 3 +++
>  package/avahi/avahi.mk        | 2 ++
>  2 files changed, 5 insertions(+)
>  create mode 100644 package/avahi/50-avahi.preset
>
> diff --git a/package/avahi/50-avahi.preset b/package/avahi/50-avahi.preset
> new file mode 100644
> index 0000000000..998772ea96
> --- /dev/null
> +++ b/package/avahi/50-avahi.preset
> @@ -0,0 +1,3 @@
> +disable avahi-daemon.service
> +disable avahi-daemon.socket
> +disable avahi-dnsconfd.service
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 53021f6b6d..2df63c5273 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -198,6 +198,8 @@ endef
>  endif
>
>  define AVAHI_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/avahi/50-avahi.preset \
> +               $(TARGET_DIR)/usr/lib/systemd/system-preset/50-avahi.preset
>         $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
>                 $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
>
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
