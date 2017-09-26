From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:42:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/poco: needs NPTL
In-Reply-To: <20170925083001.9818-1-bernd.kuhls@t-online.de>
References: <20170925083001.9818-1-bernd.kuhls@t-online.de>
Message-ID: <29b13c92-1b4d-daf0-1ce0-51b42181fd27@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-17 10:30, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/609/6090f5a0f4bf96b9dc2b3e48eb2e33c83d2ba7d2/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> v2: updated comment
> 
>  package/poco/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index b3b247f906..9199b54f0c 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -2,7 +2,8 @@ config BR2_PACKAGE_POCO
>  	bool "poco"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# pthread_condattr_setclock
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
>  		|| BR2_or1k || BR2_xtensa)
> @@ -61,8 +62,8 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
>  
>  endif # BR2_PACKAGE_POCO
>  
> -comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
> +comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>  	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
>  		|| BR2_or1k || BR2_xtensa)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
