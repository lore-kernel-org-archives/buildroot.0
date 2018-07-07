From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:27:54 +0200
Subject: [Buildroot] [PATCH 1/1] wampcc: needs C++
In-Reply-To: <20180707153546.20047-1-fontaine.fabrice@gmail.com>
References: <20180707153546.20047-1-fontaine.fabrice@gmail.com>
Message-ID: <ddbc0e99-07c2-0f8d-fd27-b93d4b6031ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-18 17:35, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/b47daa2f7df44109b839b07d282d4f5b5123533c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wampcc/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
> index d9d82df3ef..9cf7d99dfe 100644
> --- a/package/wampcc/Config.in
> +++ b/package/wampcc/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_WAMPCC
>  	bool "wampcc"
> +	depends on BR2_INSTALL_LIBSTDCPP

 A few lines lower it says that it's a C++ package, so duh...


 Applied to master, thanks.

 Regards,
 Arnout


>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
>  	depends on BR2_USE_MMU # libuv
>  	depends on !BR2_STATIC_LIBS # libuv
> @@ -14,10 +15,11 @@ config BR2_PACKAGE_WAMPCC
>  
>  	  https://github.com/darrenjs/wampcc
>  
> -comment "wampcc needs a toolchain w/ NPTL, dynamic library"
> +comment "wampcc needs a toolchain w/ C++, NPTL, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>  
>  comment "wampcc needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_USE_MMU
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
