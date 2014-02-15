From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Fri, 14 Feb 2014 18:46:01 -0800
Subject: [Buildroot] [PATCH 1/1] systemd: fix sed line in "sanitize path
	in units" hook
In-Reply-To: <1392432177-13204-1-git-send-email-vsergeev@kumunetworks.com>
References: <1392432177-13204-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <CAPyrzo21KU4UnEOb+Mgc0m3Y9XiVzSs9VgkCKqVveH1uZBVj2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please note that this is intended for the next branch with the systemd v207
bump (which I am very happy about! thanks!).


On Fri, Feb 14, 2014 at 6:42 PM, Ivan Sergeev <vsergeev@kumunetworks.com>wrote:

> The expanded SED variable already contains -e, so the extra -e was being
> interpreted as the sed command and causing sed to fail.
>
> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> ---
>  package/systemd/systemd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 9086045..36ef704 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -103,7 +103,7 @@ endef
>
>  define SYSTEMD_SANITIZE_PATH_IN_UNITS
>         find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
> -               -exec $(SED) -e 's,$(HOST_DIR),,g' {} \;
> +               -exec $(SED) 's,$(HOST_DIR),,g' {} \;
>  endef
>
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> --
> 1.8.5.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140214/3a8108e5/attachment.html>
