From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jun 2019 00:18:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/poppler: needs wchar
In-Reply-To: <20190610215733.17107-1-fontaine.fabrice@gmail.com>
References: <20190610215733.17107-1-fontaine.fabrice@gmail.com>
Message-ID: <aab9ef9d-5bcb-e283-2a95-5a5d763cea31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 23:57, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/2c8695b75c3241359e739d88726430cbfe47a5bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/poppler/Config.in | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/poppler/Config.in b/package/poppler/Config.in
> index 6ff6215e29..521e3e65a8 100644
> --- a/package/poppler/Config.in
> +++ b/package/poppler/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_POPPLER
>  	bool "poppler"
> +	depends on BR2_USE_WCHAR
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> @@ -29,6 +30,7 @@ config BR2_PACKAGE_POPPLER_UTILS
>  
>  endif
>  
> -comment "poppler needs a toolchain w/ C++, threads, dynamic library, gcc >= 5"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +comment "poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 5"
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> 
