From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 18:55:43 +0100
Subject: [Buildroot] [PATCH 4 of 4 v2] infra: remove unused helper
 function pkgparentdir
In-Reply-To: <1ed04f399fb1b71847c1.1391530916@argentina>
References: <patchbomb.1391530912@argentina>
 <1ed04f399fb1b71847c1.1391530916@argentina>
Message-ID: <52F1299F.7070406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 17:21, Thomas De Schampheleire wrote:
> Thanks to the previous patches, no-one is using pkgparentdir anymore, so
> remove it.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/pkg-utils.mk |  1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -60,7 +60,6 @@ endef
>  # package, for which the package directory is an empty string.
>  pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
>  pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
> -pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))

 The comment above mentions pkgdir but that should actually have been
pkgparentdir (it's the reason that pkgparentdir uses patsubst instead of
the usual $(dir ...)). Basically, the last sentence of the comment can be
removed.

 Regards,
 Arnout


>  
>  # Define extractors for different archive suffixes
>  INFLATE.bz2  = $(BZCAT)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
