From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:56:09 -0700
Subject: [Buildroot] [PATCH 04/15] openntpd: move systemd service files
	to /usr/lib
In-Reply-To: <1426787807-29510-5-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-5-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLh7+9zyeZ+Aj6upKt54biWhy4R6nw8nbn_1vPRtX07oYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/openntpd/openntpd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
> index 60f025c..dcd7c7f 100644
> --- a/package/openntpd/openntpd.mk
> +++ b/package/openntpd/openntpd.mk
> @@ -11,9 +11,9 @@ OPENNTPD_LICENSE_FILES = COPYING
>
>  define OPENNTPD_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 0644 package/openntpd/ntpd.service \
> -               $(TARGET_DIR)/etc/systemd/system/ntpd.service
> +               $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../ntpd.service \
> +       ln -fs /usr/lib/systemd/system/ntpd.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
>  endef
>
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
