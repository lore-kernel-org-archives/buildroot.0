From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 10:48:06 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/cmake: disable on
 unsupported architectures
In-Reply-To: <1426584639-22786-1-git-send-email-s.martin49@gmail.com>
References: <1426584639-22786-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150317104806.72c43637@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 17 Mar 2015 10:30:38 +0100, Samuel Martin wrote:

> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> index 0b5bba9..9c0b75a 100644
> --- a/package/cmake/Config.in
> +++ b/package/cmake/Config.in
> @@ -10,6 +10,13 @@ config BR2_PACKAGE_CMAKE_CTEST
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_XZ
> +	depends on BR2_arm || BR2_armeb || \
> +		BR2_aarch64 || \
> +		BR2_m68k || \
> +		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +		BR2_sparc || \
> +		BR2_i386 || BR2_x86_64
>  	depends on BR2_USE_WCHAR # libarchive
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	help
> @@ -22,4 +29,11 @@ config BR2_PACKAGE_CMAKE_CTEST
>  	  http://www.cmake.org/
>  
>  comment "ctest needs a toolchain w/ C++, wchar"
> +	depends on BR2_arm || BR2_armeb || \
> +		BR2_aarch64 || \
> +		BR2_m68k || \
> +		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +		BR2_sparc || \
> +		BR2_i386 || BR2_x86_64

Lots of code duplication -> introduce a BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
hidden variable.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
