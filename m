From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 13 Oct 2015 20:30:34 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: Add option to build OSMesa
In-Reply-To: <56100EB3.2000300@dawncrow.de>
References: <56100EB3.2000300@dawncrow.de>
Message-ID: <561D4DCA.6070009@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Just wanted to note that this patch was tested with various other mesa3d options and on different archs and toolchains (uclibc, glibc, musl, extern, intern)
since I submitted it

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Am 03.10.2015 um 19:21 schrieb Andr? Hentschel:
> Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
> ---
>  package/mesa3d/Config.in | 7 +++++++
>  package/mesa3d/mesa3d.mk | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index a658986..fdeb599 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -117,6 +117,13 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>  
>  endif # BR2_PACKAGE_XORG7
>  
> +comment "Off-screen Rendering"
> +
> +config BR2_PACKAGE_MESA3D_OSMESA
> +	bool "OSMesa library"
> +	help
> +	  The OSMesa API provides functions for making off-screen renderings.
> +
>  if BR2_PACKAGE_MESA3D_DRIVER
>  
>  comment "Additional API Support"
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f7feb0f..70ec2ec 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -110,6 +110,12 @@ endif
>  
>  # APIs
>  
> +ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
> +MESA3D_CONF_OPTS += --enable-osmesa
> +else
> +MESA3D_CONF_OPTS += --disable-osmesa
> +endif
> +
>  # Always enable OpenGL:
>  #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
>  #   - but if no DRI driver is enabled, then libgl is not built,
> 
