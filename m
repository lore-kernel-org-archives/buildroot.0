From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:59:57 -0700
Subject: [Buildroot] [PATCH 11/15] postgresql: move systemd service file
 to /usr/lib
In-Reply-To: <1426787807-29510-12-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-12-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLjcFxTBPBo6_PinTSLFXfQjYq0gFSk3ZA7zTF6pPTv4qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/postgresql/postgresql.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 7dc3f0b..e904760 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -85,9 +85,9 @@ endef
>
>  define POSTGRESQL_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/postgresql/postgresql.service \
> -               $(TARGET_DIR)/etc/systemd/system/postgresql.service
> +               $(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../postgresql.service \
> +       ln -fs /usr/lib/systemd/system/postgresql.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/postgresql.service
>  endef
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
