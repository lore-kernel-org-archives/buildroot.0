From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:32:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: needs python3
In-Reply-To: <20200715202515.819362-1-fontaine.fabrice@gmail.com>
References: <20200715202515.819362-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715233253.3fa2508c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 22:25:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python3 is mandatory since version 2.3 and
> https://github.com/networkx/networkx/commit/8f4845e94709dd62a4ebf3775fe02ca777ec49f2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c34d9c92cadbfb0e333eba91c9fae3baac53d0a2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for fixing this!

> diff --git a/package/setools/Config.in b/package/setools/Config.in
> index 56a85b01c8..668a4efecc 100644
> --- a/package/setools/Config.in
> +++ b/package/setools/Config.in
> @@ -4,8 +4,7 @@ config BR2_PACKAGE_SETOOLS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_USE_MMU
> -	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> -	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_NETWORKX # runtime
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS
>  	select BR2_PACKAGE_LIBSELINUX
> @@ -24,3 +23,6 @@ comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
>  		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> +
> +comment "setools needs python3"

This needed a:

	depends on BR2_USE_MMU

> +	depends on !BR2_PACKAGE_PYTHON3

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
