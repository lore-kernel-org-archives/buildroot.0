From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:53:38 -0700
Subject: [Buildroot] [PATCH 01/15] ntp: move systemd service file to
	/usr/lib
In-Reply-To: <1426787807-29510-2-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-2-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLjNgPitwXZR=DD=L1SCqNqzihEBYCyd=fJ4YqtmiWsCtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  package/ntp/ntp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index 7d5644a..0e42f15 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -71,9 +71,9 @@ define NTP_INSTALL_INIT_SYSV
>  endef
>
>  define NTP_INSTALL_INIT_SYSTEMD
> -       $(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/etc/systemd/system/ntpd.service
> +       $(INSTALL) -D -m 644 package/ntp/ntpd.service $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
> +       ln -fs /usr/lib/systemd/system/ntpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ntpd.service
>  endef
>  endif
>
