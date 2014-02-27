From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 21:39:42 +0100
Subject: [Buildroot] [PATCH 1/1] libdrm: remove useless dependencies on
 libpciaccess
In-Reply-To: <1393532288-14691-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1393532288-14691-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <530FA28E.2080602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/14 21:18, Sebastien Bourdelin wrote:
> Since the version 2.4.32, libdrm no longer requires dependencies on
> the libpciaccess unless for the intel-dri.
> 
> For more information :
> http://cgit.freedesktop.org/mesa/drm/commit/?id=be30d350b64c1a83473a9ffbedf8e2c680a65fcd
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/libdrm/Config.in | 3 ---
>  package/libdrm/libdrm.mk | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 205f47c..4ac4e52 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -23,21 +23,18 @@ config BR2_PACKAGE_LIBDRM_INTEL
>  config BR2_PACKAGE_LIBDRM_RADEON
>  	bool "radeon"
>  	select BR2_PACKAGE_LIBATOMIC_OPS
> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
>  	help
>  	  install AMD/ATI graphics driver
>  
>  config BR2_PACKAGE_LIBDRM_NOUVEAU
>  	bool "nouveau"
> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
>  	help
>  	  install Nvidia graphics driver
>  
>  config BR2_PACKAGE_LIBDRM_VMWGFX
>  	bool "vmwgfx"
> -	select BR2_PACKAGE_XLIB_LIBPCIACCESS
>  	depends on BR2_i386 || BR2_x86_64
>  	help
>  	  installs Vmware graphics driver
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index f5efaf1..f2c830c 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -28,21 +28,18 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
>  LIBDRM_CONF_OPT += --enable-radeon
> -LIBDRM_DEPENDENCIES += xlib_libpciaccess
>  else
>  LIBDRM_CONF_OPT += --disable-radeon
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
>  LIBDRM_CONF_OPT += --enable-nouveau
> -LIBDRM_DEPENDENCIES += xlib_libpciaccess
>  else
>  LIBDRM_CONF_OPT += --disable-nouveau
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
>  LIBDRM_CONF_OPT += --enable-vmwgfx
> -LIBDRM_DEPENDENCIES += xlib_libpciaccess
>  else
>  LIBDRM_CONF_OPT += --disable-vmwgfx
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
