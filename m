From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 18:18:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: hide "glibc utils" if
 glibc is not selected
In-Reply-To: <20191219111024.308479-1-arthur.courtel@smile.fr>
References: <20191219111024.308479-1-arthur.courtel@smile.fr>
Message-ID: <20191219171832.GH26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arthur, All,

On 2019-12-19 12:10 +0100, Arthur Courtel spake thusly:
> BR2_PACKAGE_GLIBC_UTILS config must not exist if we use other libc than glibc
> 
> Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 7b2f246947..cc178468b5 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -7,10 +7,11 @@ config BR2_PACKAGE_GLIBC
>  	select BR2_TOOLCHAIN_HAS_SSP if BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
>  	help
>  	  https://www.gnu.org/software/libc/
> -endif
>  
>  config BR2_PACKAGE_GLIBC_UTILS
>  	bool "Install glibc utilities"
>  	help
>  	  Enabling this option will compile and install the getconf,
>  	  ldconfig, ldd and locale glibc utilities for the target.
> +
> +endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
> -- 
> 2.23.0
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
