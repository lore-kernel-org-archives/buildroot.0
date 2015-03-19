From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 13:00:47 -0700
Subject: [Buildroot] [PATCH 14/15] kodi: move systemd service file to
	/usr/lib
In-Reply-To: <1426787807-29510-15-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-15-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLg_2UPF=Ka+Z=p18sGNdozne4pyYqdkDpm1x+MdGDjc9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/kodi/kodi.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index f40fc31..7ad4988 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -256,11 +256,11 @@ endef
>
>  define KODI_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/kodi/kodi.service \
> -               $(TARGET_DIR)/etc/systemd/system/kodi.service
> +               $(TARGET_DIR)/usr/lib/systemd/system/kodi.service
>
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>
> -       ln -fs ../kodi.service \
> +       ln -fs /usr/lib/systemd/system/kodi.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/kodi.service
>  endef
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
