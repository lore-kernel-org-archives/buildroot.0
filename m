From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:47:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: enable
 compilation with x11 dri3
In-Reply-To: <20200214154350.31588-1-lpdev@cordier.org>
References: <20200214154350.31588-1-lpdev@cordier.org>
Message-ID: <20200322224706.5106de39@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis-Paul,

On Fri, 14 Feb 2020 16:43:50 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> ---
>  package/intel-mediasdk/Config.in         | 1 +
>  package/intel-mediasdk/intel-mediasdk.mk | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
> index 05293d7604..0bfaf1272b 100644
> --- a/package/intel-mediasdk/Config.in
> +++ b/package/intel-mediasdk/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_INTEL_MEDIASDK
>  	depends on BR2_PACKAGE_XORG7  # intel-mediadriver
>  	select BR2_PACKAGE_INTEL_MEDIADRIVER
>  	select BR2_PACKAGE_LIBDRM_INTEL
> +	select BR2_PACKAGE_XORGPROTO
>  	help
>  	  Intel(R) Media SDK provides an API to access
>  	  hardware-accelerated video decode, encode and filtering on
> diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
> index 368e108308..b040729506 100644
> --- a/package/intel-mediasdk/intel-mediasdk.mk
> +++ b/package/intel-mediasdk/intel-mediasdk.mk
> @@ -10,8 +10,8 @@ INTEL_MEDIASDK_LICENSE = MIT
>  INTEL_MEDIASDK_LICENSE_FILES = LICENSE
>  
>  INTEL_MEDIASDK_INSTALL_STAGING = YES
> -INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver
> +INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver xorgproto
>  
> -INTEL_MEDIASDK_CONF_OPTS = -DMFX_INCLUDE="$(@D)/api/include"
> +INTEL_MEDIASDK_CONF_OPTS = -DMFX_INCLUDE="$(@D)/api/include" -DENABLE_X11_DRI3=ON

Why are you making xorgproto a mandatory dependency ? intel-mediasdk
doesn't build without it ? If it does build and work without it, then
this is an optional dependency, and should be treated as such.

Could you confirm this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
