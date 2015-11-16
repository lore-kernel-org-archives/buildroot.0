From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 16 Nov 2015 09:22:53 +0100
Subject: [Buildroot] [PATCH] package/gauche: force to use intenal
 libatomic_ops
In-Reply-To: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
References: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
Message-ID: <5649925D.5070604@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hiroshi,

> Force to use internal libatomic_ops of gauche.
>
> Fix:
> http://autobuild.buildroot.org/results/a97/a979f6a58f0fbb1896830461d6c384f4a65c9429//
> W dniu 13.11.2015 o 11:06, Hiroshi Kawashima pisze:r
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
> diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> index b887c6a..95a448b 100644
> --- a/package/gauche/gauche.mk
> +++ b/package/gauche/gauche.mk

Subject typo

intenal -> internal

Regards,
Jerzy

> @@ -12,6 +12,7 @@ GAUCHE_LICENSE_FILES = COPYING
>   GAUCHE_DEPENDENCIES = host-gauche
>   
>   HOST_GAUCHE_CONF_OPTS = --without-zlib
> +GAUCHE_CONF_OPTS = --without-libatomic-ops
>   
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
>   GAUCHE_CONF_OPTS += --with-zlib=$(STAGING_DIR)
> ============================================================
>      Hiroshi Kawashima
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
