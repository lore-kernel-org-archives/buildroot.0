From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:58:04 -0700
Subject: [Buildroot] [PATCH 07/15] irqbalance: move systemd service file
 to /usr/lib
In-Reply-To: <1426787807-29510-8-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-8-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLiBNQ7Xarb1Q9S=uDi8wnV0BUquRk=g9AGPfLm-8sUgkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/irqbalance/irqbalance.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
> index e3ef0bb..536d0e0 100644
> --- a/package/irqbalance/irqbalance.mk
> +++ b/package/irqbalance/irqbalance.mk
> @@ -26,9 +26,9 @@ endef
>
>  define IRQBALANCE_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/irqbalance/irqbalance.service \
> -               $(TARGET_DIR)/etc/systemd/system/irqbalance.service
> +               $(TARGET_DIR)/usr/lib/systemd/system/irqbalance.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../irqbalance.service \
> +       ln -fs /usr/lib/systemd/system/irqbalance.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/irqbalance.service
>  endef
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
