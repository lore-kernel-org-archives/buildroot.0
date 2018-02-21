From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 21 Feb 2018 23:17:37 +0000
Subject: [Buildroot] [PATCH 1/1] fs/cpio/init: preserve arguments
In-Reply-To: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
References: <20180221210216.5167-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180221231737.GB22894@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Feb 2018 16:02:16 -0500, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:
> Use "$@" instead of $* to preserve argument.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  fs/cpio/init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cpio/init b/fs/cpio/init
> index a275482177..dbe09ac68e 100755
> --- a/fs/cpio/init
> +++ b/fs/cpio/init
> @@ -4,4 +4,4 @@
>  exec 0</dev/console
>  exec 1>/dev/console
>  exec 2>/dev/console
> -exec /sbin/init $*
> +exec /sbin/init "$@"
> -- 
> 2.16.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180221/538c786a/attachment.asc>
