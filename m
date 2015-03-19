From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:59:42 -0700
Subject: [Buildroot] [PATCH 10/15] dropbear: move systemd service file
	to /usr/lib
In-Reply-To: <1426787807-29510-11-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-11-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLi83AZM-bQHdi+eyUkNQz9_iUi4dQdwWL-hQFqh2bQULA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/dropbear/dropbear.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index f2ae403..760fff2 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -53,9 +53,9 @@ endef
>
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/dropbear/dropbear.service \
> -               $(TARGET_DIR)/lib/systemd/system/dropbear.service
> +               $(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs /lib/systemd/system/dropbear.service \
> +       ln -fs /usr/lib/systemd/system/dropbear.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
>  endef
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
