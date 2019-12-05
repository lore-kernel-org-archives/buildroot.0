From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:43:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: libargon2 needs dynamic
 library
In-Reply-To: <20191204181141.2185407-1-fontaine.fabrice@gmail.com>
References: <20191204181141.2185407-1-fontaine.fabrice@gmail.com>
Message-ID: <20191205224332.376232b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 19:11:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/72412a68da44d7ecc87656436a17542cafcf1f95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/php/Config.ext | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index d5c723ca39..b3d6088f54 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -70,8 +70,12 @@ config BR2_PACKAGE_PHP_EXT_HASH
>  	help
>  	  HASH message digest framework
>  
> +comment "libargon2 needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>  config BR2_PACKAGE_PHP_EXT_LIBARGON2
>  	bool "libargon2"
> +	depends on !BR2_STATIC_LIBS # libargon2

You forgot to propagate the BR2_USE_MMU dependency of libargon2, so I
fixed that as well when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
