From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 18:43:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/squeezelite: fix musl build
In-Reply-To: <1454262247-30214-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454262247-30214-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207184337.0affb88c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 18:44:07 +0100, Bernd Kuhls wrote:
> The build error was not yet found by the autobuilders:
> 
> output_alsa.c: In function ?output_init_alsa?:
> output_alsa.c:865:10: error: ?M_TRIM_THRESHOLD? undeclared (first use in this function)
>   mallopt(M_TRIM_THRESHOLD, -1);
>           ^
> output_alsa.c:865:10: note: each undeclared identifier is reported only once for each function it appears in
> output_alsa.c:866:10: error: ?M_MMAP_MAX? undeclared (first use in this function)
>   mallopt(M_MMAP_MAX, 0);
>           ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...02-only-run-glibc-specific-hacks-on-glibc.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/squeezelite/0002-only-run-glibc-specific-hacks-on-glibc.patch

Applied with some changes:

    [Thomas: only enclose the mallopt() call in __GLIBC__, use Git to
    format the patch, improve the commit log.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
