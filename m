From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 20 Mar 2015 11:22:47 +0100
Subject: [Buildroot] [PATCH] thttpd: add systemd service file
In-Reply-To: <1426795074-9129-1-git-send-email-mike@mikebwilliams.com>
References: <1426795074-9129-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAHXCMMJfAqC-dLEO4FHR7r--GFcP8RE5qJ28+i1r1ts5GBtcog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Thu, Mar 19, 2015 at 8:57 PM, Mike Williams <mike@mikebwilliams.com> wrote:
> Based on Arch service file, adjust to point to /usr/sbin.
>
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/thttpd/thttpd.mk      |  5 +++++
>  package/thttpd/thttpd.service | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/thttpd/thttpd.service
>
> diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
> index 1a028c8..565ade6 100644
> --- a/package/thttpd/thttpd.mk
> +++ b/package/thttpd/thttpd.mk
> @@ -44,4 +44,9 @@ define THTTPD_INSTALL_INIT_SYSV
>         $(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
>  endef
>
> +define THTTPD_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 0644 package/thttpd/thttpd.service $(TARGET_DIR)/usr/lib/systemd/system/thttpd.service
> +       ln -fs /usr/lib/systemd/system/thttpd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/thttpd.service
Please wrap these long lines.

Regards,

-- 
Samuel
