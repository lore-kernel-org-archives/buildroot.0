From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 01:48:48 +0200
Subject: [Buildroot] [PATCH v2 3/3] Makefile: do not add to targets
	common dependencies
In-Reply-To: <1403252778-19761-4-git-send-email-fabio.porcedda@gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <53A4C860.7090601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 10:26, Fabio Porcedda wrote:
> Remove the rule that add common dependencies to every targets in the
> "TARGETS" variable because all those targets are packages that use the package
> framework that already add common dependencies.

 There are still two targets that don't:

- target-generatelocales - should probably be converted to a
TARGET_FINALIZE_HOOK as well;

- toolchain-eclipse-register - doesn't need to depend on anything I think, but
anyway could also be converted to a TARGET_FINALIZE_HOOK.


 So neither of these are really critical.

 Also, you forgot you Sob.


 Regards,
 Arnout

> ---
>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9de4806..c028cf8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -433,10 +433,6 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>  
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  
> -# Add base dependencies to all targets even on those not based on the
> -# package framework.
> -$(TARGETS): dirs prepare dependencies
> -
>  world: target-post-image
>  
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
