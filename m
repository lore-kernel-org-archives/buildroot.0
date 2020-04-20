From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 17:29:10 +0200
Subject: [Buildroot] [PATCH] package/qt5/Config.in: fix typo
In-Reply-To: <20200420151024.41482-1-b.bilas@grinn-global.com>
References: <20200420151024.41482-1-b.bilas@grinn-global.com>
Message-ID: <20200420152910.GI5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-04-20 17:10 +0200, Bartosz Bilas spake thusly:
> There is no BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 option
> but BR2_TOOLCHAIN_GCC_AT_LEAST_5.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

I also fixed pinentry and wireshark, which had the incorrect version
introduced with the same commit as qt5. Adapted the commit log and
pushed to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qt5/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index cd9c93735d..c716919476 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -16,14 +16,14 @@ comment "Qt5 needs a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
>  	depends on !BR2_arc
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5_0
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  menuconfig BR2_PACKAGE_QT5
>  	bool "Qt5"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_0 # C++11, GCC_BUG_57694
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
>  	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
>  	# no built-in double-conversion support
>  	depends on !BR2_arc
> -- 
> 2.26.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
