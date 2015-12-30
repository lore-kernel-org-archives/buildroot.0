From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 00:49:38 +0100
Subject: [Buildroot] [PATCH 20/84 RFC] package/nodejs: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <bae1ef1a003831c66a32feff9ae88d8d33abe62a.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <bae1ef1a003831c66a32feff9ae88d8d33abe62a.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56846D92.5010107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nodejs/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 008fbbf..000e0fb 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -5,7 +5,7 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
>  	depends on !BR2_ARM_CPU_ARMV4
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
>  
> -config BR2_PACKAGE_NODEJS
> +menuconfig BR2_PACKAGE_NODEJS
>  	bool "nodejs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -62,7 +62,7 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
>  	default "0.10.41"	if BR2_PACKAGE_NODEJS_0_10_X
>  	default "5.3.0"		if BR2_PACKAGE_NODEJS_5_X
>  
> -menu "Module Selection"
> +comment "Module Selection"

 Comment not needed.

 Regards,
 Arnout

>  
>  config BR2_PACKAGE_NODEJS_NPM
>  	bool "NPM for the target"
> @@ -118,6 +118,4 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
>  	  'libcurl' here, to ensure that buildroot builds the libcurl package,
>  	  and does so before building your node modules.
>  
> -endmenu
> -
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
