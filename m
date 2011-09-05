From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 5 Sep 2011 23:20:50 +0200
Subject: [Buildroot] [git commit] util-linux: bump version
In-Reply-To: <20110905201638.DE7BA8D3F6@busybox.osuosl.org>
References: <20110905201638.DE7BA8D3F6@busybox.osuosl.org>
Message-ID: <CAGm1_kth2O=4ODt-QznuRNyQaVNkgvoy00L8RGNuDnk=m2-=9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 5, 2011 at 10:16 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=8a124c78edea6e4c5d80f739575c71af4fe9abce
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?package/util-linux/util-linux-script-libintl.patch | ? 30 ++++++++++++++++++++
> ?package/util-linux/util-linux.mk ? ? ? ? ? ? ? ? ? | ? ?4 +-
> ?2 files changed, 32 insertions(+), 2 deletions(-)
> ?create mode 100644 package/util-linux/util-linux-script-libintl.patch
>
> diff --git a/package/util-linux/util-linux-script-libintl.patch b/package/util-linux/util-linux-script-libintl.patch
> new file mode 100644
> index 0000000..0700aa4
> --- /dev/null
> +++ b/package/util-linux/util-linux-script-libintl.patch
> @@ -0,0 +1,30 @@
> +From 075f251b19509f588d828a81d91b40f47e63e3de Mon Sep 17 00:00:00 2001
> +From: Peter Korsgaard <jacmet@sunsite.dk>
> +Date: Mon, 5 Sep 2011 21:46:25 +0200
> +Subject: [PATCH] script.c: drop libintl.h include
> +
> +Commit 8fb810ff26 (script: include-what-you-use header check) added a
> +<libintl.h> #include, which isn't needed as nls.h includes it (if
> +enabled) - But worse, breaks the build for systems without libintl.h
> +(like some uClibc configurations).
> +
> +Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> +---
> + term-utils/script.c | ? ?1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/term-utils/script.c b/term-utils/script.c
> +index d96ca2f..f708e91 100644
> +--- a/term-utils/script.c
> ++++ b/term-utils/script.c
> +@@ -55,7 +55,6 @@
> + #include <getopt.h>
> + #include <unistd.h>
> + #include <fcntl.h>
> +-#include <libintl.h>
> + #include <limits.h>
> + #include <locale.h>
> + #include <stddef.h>
> +--
> +1.7.5.4
> +
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 9d2f9be..49c528a 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -3,8 +3,8 @@
> ?# util-linux
> ?#
> ?#############################################################
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
> -UTIL_LINUX_VERSION_MAJOR = 2.19
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
> +UTIL_LINUX_VERSION_MAJOR = 2.20
> ?UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
> ?UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
> ?UTIL_LINUX_AUTORECONF = YES
> --
> 1.7.3.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

I have found an issue with 2.20 version and "Ext2 Filesystems
Utilities". See here
http://sourceforge.net/projects/e2fsprogs/forums/forum/7053/topic/4639484

Yegor
