From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 15 Oct 2014 10:22:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump to version 1.9.5
In-Reply-To: <1413357933-10973-1-git-send-email-jkrause@posteo.de>
References: <1413357933-10973-1-git-send-email-jkrause@posteo.de>
Message-ID: <543E2EC6.1000205@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

> * bump to version 1.9.5
> * fix version and site symbol
>
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>   package/libnfs/libnfs.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
> index a17d8c3..f2d7938 100644
> --- a/package/libnfs/libnfs.mk
> +++ b/package/libnfs/libnfs.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBNFS_VERSION = libnfs-1.8.0
> -LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
> +LIBNFS_VERSION = 1.9.5
> +LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))

Since the tag of libnfs version 1.9.5 is libnfs-1.9.5
so this should be:

+LIBNFS_VERSION = libnfs-1.9.5
+LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))


Regards,
Jerzy

>   LIBNFS_INSTALL_STAGING = YES
>   LIBNFS_AUTORECONF = YES
>   LIBNFS_MAKE = $(MAKE1)
