From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 25 Nov 2020 22:11:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/efl: fix build with wepb
In-Reply-To: <20201124170323.691734-1-fontaine.fabrice@gmail.com>
References: <20201124170323.691734-1-fontaine.fabrice@gmail.com>
Message-ID: <f675eca5-4047-26c0-4bad-64eebf8e1276@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Le 24/11/2020 ? 18:03, Fabrice Fontaine a ?crit?:
> webpdemux support in webp is mandatory since version 1.25.0 and
> https://github.com/Enlightenment/efl/commit/df06418b6f39f3b8d73631bda33308b67736bb9d
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/736357e669c35bd56e818c0c7fabd1b455f40a5f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index e4e4c72161..d4a8762de0 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -256,6 +256,7 @@ config BR2_PACKAGE_EFL_TIFF
>  config BR2_PACKAGE_EFL_WEBP
>  	bool "libevas webp image loader"
>  	select BR2_PACKAGE_WEBP
> +	select BR2_PACKAGE_WEBP_DEMUX

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  	help
>  	  This enables the loader code that loads images using WebP.
>  
> 
