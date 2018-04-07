From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 7 Apr 2018 17:21:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/llvm: add dependency on shared
 libraries
In-Reply-To: <20180407083106.7772-1-valentin.korenblit@smile.fr>
References: <20180407083106.7772-1-valentin.korenblit@smile.fr>
Message-ID: <29cbc900-fa80-78d5-ee4f-1c5bcc4863bd@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

Le 07/04/2018 ? 10:31, Valentin Korenblit a ?crit?:
> llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set

You can add a link to the report [1] or copy past it.

[1] http://lists.busybox.net/pipermail/buildroot/2018-April/218296.html

Best regards,
Romain

> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/llvm/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 15f2507ef2..e007397fa7 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -19,6 +19,7 @@ config BR2_PACKAGE_LLVM
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  The LLVM Project is a collection of modular and reusable
>  	  compiler and toolchain technologies.
> @@ -35,10 +36,11 @@ config BR2_PACKAGE_LLVM_AMDGPU
>  
>  endif
>  
> -comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
> +comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
>  	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		|| BR2_STATIC_LIBS
>  
>  comment "llvm needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> 
