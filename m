From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 00:00:38 +0200
Subject: [Buildroot] [PATCH] package/libbdplus: Add missing libgpg arch
 support
In-Reply-To: <1467669466-16341-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467669466-16341-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <4bb56ddf-7710-31a8-e927-e67527ceefdf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

Le 04/07/2016 ? 23:57, Maxime Hadjinlian a ?crit :
> Thanks to Romain Naour for finding the culprit package.
> 
> Fix:
> http://autobuild.buildroot.org/results/d06/d06e3eb9ef48540b71fbec267c534523632b224f/
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/libbdplus/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libbdplus/Config.in b/package/libbdplus/Config.in
> index df5ea27..afde075 100644
> --- a/package/libbdplus/Config.in
> +++ b/package/libbdplus/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBBDPLUS
>  	bool "libbdplus"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_LIBGCRYPT
> @@ -15,4 +16,5 @@ config BR2_PACKAGE_LIBBDPLUS
>  	  http://www.videolan.org/developers/libbdplus.html
>  
>  comment "libbdplus needs a toolchain w/ threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> 
