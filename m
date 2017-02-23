From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 23 Feb 2017 19:32:21 +0100
Subject: [Buildroot] [PATCH] poco: disable for or1k, not supported
In-Reply-To: <20170223182152.GA14039@waldemar-brodkorb.de>
References: <20170223182152.GA14039@waldemar-brodkorb.de>
Message-ID: <20170223183221.GC12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

drop this, haven't seen Baruch's patch :/

Note to myself, first check mailinglist, then start looking into
autobuild errors ;)

best regards
 Waldemar

Waldemar Brodkorb wrote,

> Fixes:
>   http://autobuild.buildroot.net/results/5b3fd6d4a7bdefadba89fdb53de4ba786f4df9e2
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/poco/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index dfdc8d1..b3b247f 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_POCO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
> -		|| BR2_xtensa)
> +		|| BR2_or1k || BR2_xtensa)
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_PCRE
>  	help
> @@ -65,4 +65,4 @@ comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>  	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
> -		|| BR2_xtensa)
> +		|| BR2_or1k || BR2_xtensa)
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
