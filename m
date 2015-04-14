From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Apr 2015 00:31:20 +0200
Subject: [Buildroot] [PATCHv2 20/21] Makefile: implement the 'source'
 target using the package infrastructure
In-Reply-To: <1428856685-4403-21-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-21-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D9538.3020309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:38, Thomas Petazzoni wrote:
> Now that all the bits are in place, switch the global 'source' target
> to use the package infrastructure logic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

with 'make source' (actually together with the next patch).

 Regards,
 Arnout

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 7d94ee8..06a9f05 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -610,7 +610,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
> -source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
> +source: $(foreach p,$(PACKAGES),$(p)-all-source)
>  
>  _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
