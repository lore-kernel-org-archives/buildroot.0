From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Feb 2015 21:44:48 +0100
Subject: [Buildroot] [PATCH 08/16] package/e2fsprogs: make /sbin/fsck
	available
In-Reply-To: <1421684056-5266-9-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-9-git-send-email-maxtram95@gmail.com>
Message-ID: <CAHXCMM+8Z5KCDektWD01R1bysaAsU3QK-satuJta1QLWUKpP2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> systemd looks for fsck in /sbin, so make symlink:
> /sbin/fsck -> /usr/sbin/fsck
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/e2fsprogs/e2fsprogs.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index b4f0950..9f0310d 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -117,5 +117,13 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
>  E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
>  endif
>
> +define E2FSPROGS_TARGET_FSCK_SYMLINK
> +       ln -sf ../usr/sbin/fsck $(TARGET_DIR)/sbin/fsck
> +endef
> +
> +ifeq ($(BR2_PACKAGE_E2FSPROGS_FSCK),y)
> +E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FSCK_SYMLINK
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> --
> 2.2.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
