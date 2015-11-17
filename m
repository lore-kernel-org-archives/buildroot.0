From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 17 Nov 2015 20:45:13 +0100
Subject: [Buildroot] [PATCH] skeleton: remove unused /etc/issue
In-Reply-To: <1447776985-20087-1-git-send-email-jezz@sysmic.org>
References: <1447776985-20087-1-git-send-email-jezz@sysmic.org>
Message-ID: <CAGduivypxK2BbZ2LcTK0AMqtHcqcPTNyECZ1RKfKVNATLFUzWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me, all

On Tue, Nov 17, 2015 at 5:16 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> /etc/issue is managed with BR2_TARGET_GENERIC_ISSUE. In case
> BR2_TARGET_GENERIC_ISSUE is set (which is default), /etc/issue
> is overwritten. In case BR2_TARGET_GENERIC_ISSUE is not set,
> we don't want /etc/issue exist.
>
> Finaly, remove /etc/issue from skeleton.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  system/skeleton/etc/issue | 3 ---
>  1 file changed, 3 deletions(-)
>  delete mode 100644 system/skeleton/etc/issue
>
> diff --git a/system/skeleton/etc/issue b/system/skeleton/etc/issue
> deleted file mode 100644
> index 90f1779..0000000
> --- a/system/skeleton/etc/issue
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -
> -Welcome to Buildroot
> -
> --
> 2.1.4
Just to clarify the commit log (maybe it's just me that did not get
it), but without this patch, if you empty BR2_TARGET_GENERIC_ISSUE and
you use the default skeleton, you still get an etc/issue with the
"Welcome to Buildroot" message. I think it must be a long standing
bug.
Thanks for fixing this !

Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
