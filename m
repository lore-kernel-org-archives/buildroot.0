From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 07:56:38 +0100
Subject: [Buildroot] [PATCH v2 2/7] libdrm: Remove dependency towards X11
In-Reply-To: <BLU0-SMTP338F1C8C0E0E7FD631BCFC0D9AA0@phx.gbl>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP338F1C8C0E0E7FD631BCFC0D9AA0@phx.gbl>
Message-ID: <52F1E0A6.2060409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 19:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
> v4: rebased v3
> v3: rebased v2
> v2: http://patchwork.ozlabs.org/patch/304116/ (Paul Cercueil)
> v1: http://patchwork.ozlabs.org/patch/278297/ (Spenser Gilliland)

 Oh, something I forgot to mention in the previous patch as well: you
should keep the Signed-off-by of the two previous authors, so they get
their due credit (which is required since they published their patches
under GPL).

 Otherwise looks good to me, but one more remark below.

> 
>  package/libdrm/Config.in |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 4d7646b..e382a3a 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LIBDRM
>  	bool "libdrm"
>  	select BR2_PACKAGE_LIBPTHREAD_STUBS
> -	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_LARGEFILE
>  	help
>  	  Direct Rendering Manager
> @@ -14,6 +13,7 @@ menu "DRM Drivers"
>  
>  config BR2_PACKAGE_LIBDRM_INTEL
>  	bool "intel"
> +	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBATOMIC_OPS
>  	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
> @@ -22,6 +22,7 @@ config BR2_PACKAGE_LIBDRM_INTEL
>  
>  config BR2_PACKAGE_LIBDRM_RADEON
>  	bool "radeon"
> +	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBATOMIC_OPS
>  	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
> @@ -30,6 +31,7 @@ config BR2_PACKAGE_LIBDRM_RADEON
>  
>  config BR2_PACKAGE_LIBDRM_NOUVEAU
>  	bool "nouveau"
> +	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
>  	help
> @@ -37,6 +39,7 @@ config BR2_PACKAGE_LIBDRM_NOUVEAU
>  
>  config BR2_PACKAGE_LIBDRM_VMWGFX
>  	bool "vmwgfx"
> +	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
>  	help

 So only the three experimental ARM drivers work without Xorg?

 Not for this patch, but does libdrm do anything useful when no driver is
selected? Shouldn't it have a dependency on x86 || arm so that at least
one driver can be selected?

 Regards,
 Arnout

> @@ -65,5 +68,4 @@ endmenu
>  endif
>  
>  comment "libdrm needs a toolchain w/ largefile"
> -	depends on BR2_PACKAGE_XORG7
>  	depends on !BR2_LARGEFILE
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
