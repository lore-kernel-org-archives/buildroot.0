From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 23:46:19 +0200
Subject: [Buildroot] [PATCHv2 16/21] pkg-download: get rid of DL_MODE
In-Reply-To: <1428856685-4403-17-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-17-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D8AAB.5090106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:38, Thomas Petazzoni wrote:
> The DL_MODE variable is now no longer used with any other value than
> "DOWNLOAD", so it no longer makes sense to have this variable at
> all. Therefore, this commit gets rid of it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

By doing 'make source'.

 Regards,
 Arnout

> ---
>  package/pkg-download.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 829b54d..8cd168a 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -20,10 +20,6 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>  
>  DL_WRAPPER = support/download/dl-wrapper
>  
> -# Default spider mode is 'DOWNLOAD'. Other possible value is
> -# 'SOURCE_CHECK' used by the _source-check target.
> -DL_MODE = DOWNLOAD
> -
>  # DL_DIR may have been set already from the environment
>  ifeq ($(origin DL_DIR),undefined)
>  DL_DIR ?= $(call qstrip,$(BR2_DL_DIR))
> @@ -209,7 +205,7 @@ endef
>  ################################################################################
>  
>  define DOWNLOAD
> -	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),$(DL_MODE))
> +	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
>  endef
>  
>  define SOURCE_CHECK
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
