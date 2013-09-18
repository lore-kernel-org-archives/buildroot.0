From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 15:26:56 +0300
Subject: [Buildroot] [PATCH] gpu-viv-bin-mx6q: select libXdamage and
 libXext when xorg enabled
In-Reply-To: <1379505665-31144-1-git-send-email-fatih.asici@gmail.com>
References: <1379505665-31144-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1379507216.9971.10.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2013-09-18 at 15:01 +0300, Fatih A??c? wrote:
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index e80eae4..a3c2057 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>  	bool "gpu-viv-bin-mx6q"
>  	select BR2_PACKAGE_HAS_OPENGL_EGL
>  	select BR2_PACKAGE_HAS_OPENGL_ES
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>  	depends on BR2_arm # Only relevant for i.MX6
>  	 # Library binaries are linked against libc.so.6
>  	depends on BR2_TOOLCHAIN_USES_GLIBC

Sorry. I forgot to add dependencies in .mk file. We need this to build
packages in order.

I'll send a second patch.
