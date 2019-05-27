From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 19:28:32 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/ecryptfs-utils: allow
 building with GCC_BUG_85862 and on Microblaze
In-Reply-To: <20190522135906.30796-6-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-6-giulio.benetti@micronovasrl.com>
Message-ID: <77c2dccf-73ae-a78f-c0d8-28842e103440@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 22/05/2019 15:59, Giulio Benetti ha scritto:
> libnss gcc bug 85862 has been worked around and that caused build
> failure on Microblaze.
> 
> Remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862' and 'depends on
> !BR2_microblaze' from Config.in allowing this package to build.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/ecryptfs-utils/Config.in | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
> index 6652d33e0e..68a659d33d 100644
> --- a/package/ecryptfs-utils/Config.in
> +++ b/package/ecryptfs-utils/Config.in
> @@ -2,12 +2,10 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
>   	bool "ecryptfs-utils"
>   	depends on BR2_USE_WCHAR # gettext
>   	depends on BR2_USE_MMU # keyutils
> -	depends on !BR2_microblaze # keyutils
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
>   	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
>   	depends on !BR2_MIPS_NABI32 # libnss
>   	depends on !BR2_STATIC_LIBS # libnss, keyutils
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # microblaze specific & GCC < 7.x
>   	select BR2_PACKAGE_KEYUTILS
>   	select BR2_PACKAGE_LIBNSS
>   	# runtime dependency only, some scripts are using the
> @@ -31,11 +29,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
>   	  http://ecryptfs.org
>   
>   comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
> -	depends on !BR2_microblaze
>   	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
>   	depends on BR2_USE_MMU
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
>   		BR2_STATIC_LIBS
> -
> -comment "ecryptfs needs a toolchain not affected by GCC bug 85862"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
> 

I've seen you've tagged this as Changes Requested:
https://patchwork.ozlabs.org/patch/1103358/

It is because of dependency to "keyutils" still not fixed right?

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
