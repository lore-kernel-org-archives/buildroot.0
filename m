From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Nov 2013 15:53:12 +0100
Subject: [Buildroot] [PATCH] perf: libelf is required to compile perf
In-Reply-To: <1383660387-31193-1-git-send-email-andi@etezian.org>
References: <1383660387-31193-1-git-send-email-andi@etezian.org>
Message-ID: <CAAXf6LVJ7r6mK40v=az-h5p8g8ykwaOsC0RXCZSY6wT9Dh9gmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andi,

On Tue, Nov 5, 2013 at 3:06 PM, Andi Shyti <andi@etezian.org> wrote:
> Point this out in the related Config.in in the perf directory.
>
> Mute the following error by selecting BR2_PACKAGE_LIBELF:
>
> The perf tool in your kernel cannot be built without libelf.
> Either upgrade your kernel to >= 3.7, or enable the elfutils package.
> make: *** [/home/andi/repo/buildroot-snowball/output/build/perf-stable-linux-ux500-3.4/.stamp_built] Error 1
>
> Signed-off-by: Andi Shyti <andi@etezian.org>
> ---
>  package/perf/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/perf/Config.in b/package/perf/Config.in
> index 88dce93..4b651b3 100644
> --- a/package/perf/Config.in
> +++ b/package/perf/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PERF
>         bool "perf"
>         depends on BR2_LINUX_KERNEL
>         depends on BR2_LARGEFILE
> +       depends on BR2_PACKAGE_LIBELF
>         help
>           perf (sometimes "Perf Events" or perf tools, originally
>           "Performance Counters for Linux") - is a performance

This doesn't look right. As the error indicates, if your kernel is
recent enough you don't need libelf.
Have you tried enabling libelf manually?

Best regards,
Thomas

> --
> 1.8.4.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
