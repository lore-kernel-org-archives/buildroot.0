From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Apr 2015 17:34:13 +0200
Subject: [Buildroot] [git commit] uboot: deprecate
 BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
In-Reply-To: <20150419090719.42BAD80094@busybox.osuosl.org>
References: <20150419090719.42BAD80094@busybox.osuosl.org>
Message-ID: <5533CAF5.9020401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 11:06, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=14f1a83ee3bd4728765b63976c5ec21b34e59c35
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Users should use BR2_TARGET_UBOOT_PATCH instead.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/uboot/Config.in |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8769296..4f01499 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -72,6 +72,7 @@ config BR2_TARGET_UBOOT_VERSION
>  
>  config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>  	string "custom patch dir"
> +	depends on BR2_DEPRECATED_SINCE_2015_05
>  	help
>  	  If your board requires custom patches, add the path to the
>  	  directory containing the patches here. The patches must be
> @@ -79,6 +80,8 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
>  
>  	  Most users may leave this empty
>  
> +	  NOTE: Use BR2_TARGET_UBOOT_PATCH instead.
> +
>  config BR2_TARGET_UBOOT_PATCH
>  	string "Custom U-Boot patches"

 To make the deprecation smoother, we could add

	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR

 Regards,
 Arnout

>  	help
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
