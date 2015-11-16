From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 08:01:05 +0100
Subject: [Buildroot] [PATCH] package/gauche: force to use intenal
 libatomic_ops
In-Reply-To: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
References: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
Message-ID: <56497F31.1060406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 11:06, Hiroshi Kawashima wrote:
> Force to use internal libatomic_ops of gauche.
> 
> Fix:
> http://autobuild.buildroot.org/results/a97/a979f6a58f0fbb1896830461d6c384f4a65c9429//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> index b887c6a..95a448b 100644
> --- a/package/gauche/gauche.mk
> +++ b/package/gauche/gauche.mk
> @@ -12,6 +12,7 @@ GAUCHE_LICENSE_FILES = COPYING
>  GAUCHE_DEPENDENCIES = host-gauche
>  
>  HOST_GAUCHE_CONF_OPTS = --without-zlib
> +GAUCHE_CONF_OPTS = --without-libatomic-ops
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GAUCHE_CONF_OPTS += --with-zlib=$(STAGING_DIR)
> ============================================================
>     Hiroshi Kawashima
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
