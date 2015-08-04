From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Aug 2015 22:21:53 +0200
Subject: [Buildroot] [PATCH 8/9] libupnpp: update to use the gcc version
 dependency mechanism
In-Reply-To: <1438711241-31792-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150804202153.GA3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-04 20:00 +0200, Thomas Petazzoni spake thusly:
> This commit changes the libupnp Config.in to use the gcc version
> dependency mechanism. The only reverse dependency of libupnpp is
> upmpdcli, which has already been updated, and requires >= 4.6, while
> libupnpp only requires >= 4.5.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libupnpp/Config.in | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
> index a0565fe..8af0cda 100644
> --- a/package/libupnpp/Config.in
> +++ b/package/libupnpp/Config.in
> @@ -5,9 +5,7 @@ config BR2_PACKAGE_LIBUPNPP
>  	select BR2_PACKAGE_LIBUPNP
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	# Triggers the _gp link issue
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
> @@ -17,10 +15,7 @@ config BR2_PACKAGE_LIBUPNPP
>  
>  	  http://www.lesbonscomptes.com/upmpdcli/
>  
> -comment "libupnpp needs a toolchain w/ C++, threads"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
> +comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.5"
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
