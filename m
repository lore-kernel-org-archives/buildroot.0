From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 23:50:01 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-download: add optional destination
 filename
In-Reply-To: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
References: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <55357489.3080305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 18:57, Frank Hunleth wrote:
> This adds an optional parameter to the DOWNLOAD macro so that it's
> possible to specify a destination filename that's different from one
> being downloaded.

 In this case, this filename should be used instead of the upstream filename
when downloading from PRIMARY or SECONDARY.

 And perhaps for the time being both should be tried, because current caches
still have the old filenames...

 Regards,
 Arnout

> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/pkg-download.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index e274712..1278018 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -244,13 +244,14 @@ endef
>  # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
>  #
>  # Argument 1 is the source location
> +# Argument 2 is an optional destination filename
>  #
>  # E.G. use like this:
>  # $(call DOWNLOAD,$(FOO_SITE))
>  ################################################################################
>  
>  define DOWNLOAD
> -	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
> +	$(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
>  endef
>  
>  define DOWNLOAD_INNER
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
