From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 23:43:40 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <52F2BE9C.1060204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 15:12, J?r?my Rosen wrote:
> When it is set, BR2_DEFCONFIG is saved like any config variable.
> However, at this point it is a completely expanded, absolute path
> It is not a good idea to save absolute paths in defconfig files
> moreover it makes little sense to save the defconfig location
> within the defconfig
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>

 Jeremy, I guess this patch is superseded by mine?

 Regards,
 Arnout

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 4a675d4..f63a058 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,6 +772,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
> +	sed -i '/^BR2_DEFCONFIG=/d' $(DEFCONFIG)
>  
>  # check if download URLs are outdated
>  source-check:
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
