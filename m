From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 20 Jan 2015 15:00:54 +0100
Subject: [Buildroot] [PATCH 06/11 v5] package/nvidia-driver: add
	NVidia's OpenGL binary blob
In-Reply-To: <38defbca2c222a8bbcc2a3bb5a87c2e97282ee6e.1421699898.git.yann.morin.1998@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <38defbca2c222a8bbcc2a3bb5a87c2e97282ee6e.1421699898.git.yann.morin.1998@free.fr>
Message-ID: <1543651.dEYKR9f3t7@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Monday 19 January 2015 21:40:36 Yann E. MORIN wrote:
[...]
> --- /dev/null
> +++ b/package/nvidia-driver/Config.in
> @@ -0,0 +1,51 @@
> +comment "nvidia-driver needs an (e)glibc toolchain and a modular Xorg server"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC \
> +		|| !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> +
> +config BR2_PACKAGE_NVIDIA_DRIVER
> +	bool "nvidia-driver"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> +	select BR2_PACKAGE_OPENGL_REGISTRY
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGLES
> +	help
> +	  The binary-only driver blob for NVidia cards.
> +	  This is the userland part only.
> +
> +	  http://www.nvidia.com/
> +
> +if BR2_PACKAGE_NVIDIA_DRIVER
> +
> +config BR2_PACKAGE_PROVIDES_LIBGL
> +	default "nvidia-driver"
If I understand right, mesa3d cannot be selected in same time than 
nvidia-driver. Consequently, xorg-xserver will be built with 
"--disable-dri --disable-glx". 
It does not produce error when loading nvidia-driver? In add, I 
suppose it is not possible to use OpenGL application if xserver
is compiled --disable-glx, no?

I am currently trying to compile xorg-xserver with dri/glx but without
using mesa3d (using opengl-registry and nvidia-driver instead).


[...]
-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
