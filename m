From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 1 Apr 2018 19:07:51 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/piglit: new package
In-Reply-To: <20180211162136.15605-3-romain.naour@gmail.com>
References: <20180211162136.15605-1-romain.naour@gmail.com>
 <20180211162136.15605-3-romain.naour@gmail.com>
Message-ID: <61aa0fcc-a82c-8b95-13a9-febead284293@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 11/02/2018 ? 17:21, Romain Naour a ?crit?:
> Piglit is an open-source test suite for OpenGL implementations.
> It's an python3 script based around several tools like glxinfo,
> wflinfo, dmesg.
> 
> Even though waffle support can be replaced by freeglut,
> using pliglit with waffle is recommended since freeglut
> will be replaced by waffle.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Bernd, I'm Cc you since you're probably interested by piglit to
> test new mesa3d version.
> 
> v2: bump version
> ---

[...]

> diff --git a/package/piglit/Config.in b/package/piglit/Config.in
> new file mode 100644
> index 0000000000..eaa19c17ba
> --- /dev/null
> +++ b/package/piglit/Config.in
> @@ -0,0 +1,35 @@
> +config BR2_PACKAGE_PIGLIT
> +	bool "piglit"
> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_PYTHON3 # python3 only script
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS

Missing "depends on BR2_PACKAGE_HAS_LIBGLES" introduced in waffle package with
the last respin.

> +	select BR2_PACKAGE_MESA3D_DEMOS # glxinfo
> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XPROTO_GLPROTO if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_PYTHON_MAKO
> +	select BR2_PACKAGE_PYTHON_NUMPY
> +	select BR2_PACKAGE_PYTHON_SIX
> +	select BR2_PACKAGE_PYTHON3_BZIP2
> +	select BR2_PACKAGE_PYTHON3_PYEXPAT
> +	select BR2_PACKAGE_PYTHON3_XZ
> +	select BR2_PACKAGE_PYTHON3_ZLIB
> +	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES # require real dmesg tool
> +	select BR2_PACKAGE_WAFFLE # wflinfo
> +	help
> +	  Piglit is an open-source test suite for OpenGL
> +	  implementations.
> +
> +	  https://piglit.freedesktop.org
> +
> +comment "piglit needs an OpenGL GL or EGL provider"
> +	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBEGL

The dependency comment should be updated accordingly.

Any reviewer ?

Best regards,
Romain
