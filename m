From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Apr 2014 00:55:22 +0200
Subject: [Buildroot] [PATCH 3/9] boot/syslinux: remove 'default y' in
 sub-options
In-Reply-To: <d3ab10dd08d3a1f70c0f7c79a5104d17a503579f.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <d3ab10dd08d3a1f70c0f7c79a5104d17a503579f.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <5359965A.2040101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/04/14 00:29, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Remove the 'default y' from sub-options, but ensure at least one
> is enabled anyway.
> 
> We keep the 'default y' to the default option, so that the menuconfig
> behaviour is not too surprising.

 The "surprising" part is that isolinux will be unselected when one of
the other options is selected. If you really want both isolinux and
pxelinux, that indeed is surprising. But I think you usually want either,
not both. So in that case the fact that you first have to select pxelinux
and then unselect isolinux doesn't seem appropriate to me.

 Otherwise, looks good to me.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Lundquist <thomasez@redpill-linpro.com>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  boot/syslinux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> index 5b1122d..1b8c527 100644
> --- a/boot/syslinux/Config.in
> +++ b/boot/syslinux/Config.in
> @@ -2,6 +2,7 @@ config BR2_TARGET_SYSLINUX
>  	bool "syslinux"
>  	depends on BR2_i386 || BR2_x86_64
>  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
> +	select BR2_TARGET_SYSLINUX_ISOLINUX if !BR2_TARGET_SYSLINUX_PXELINUX
>  	help
>  	  The syslinux bootloader for x86 systems.
>  	  This includes: syslinux, pxelinux, extlinux.
> @@ -16,6 +17,5 @@ config BR2_TARGET_SYSLINUX_ISOLINUX
>  
>  config BR2_TARGET_SYSLINUX_PXELINUX
>  	bool "Install pxelinux"
> -	default y
>  
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
