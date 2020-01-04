From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 4 Jan 2020 13:01:33 +0100
Subject: [Buildroot] [PATCH 3/3] toolchain-external: update Arm AArch64
 BE toolchain 9.2-2019.12
In-Reply-To: <20200104114331.336812-3-romain.naour@gmail.com>
References: <20200104114331.336812-1-romain.naour@gmail.com>
 <20200104114331.336812-3-romain.naour@gmail.com>
Message-ID: <628f6632-3cd2-5bad-1b83-38ac99837a6e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/01/2020 ? 12:43, Romain Naour a ?crit?:
> Update to gcc 9.2.1, gdb 8.3.0, binutils 2.33.1.
> 
> See "Release Note":
> https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-arm-aarch64-be/Config.in             | 6 +++---
>  .../toolchain-external-arm-aarch64-be/Config.in.options     | 2 +-
>  .../toolchain-external-arm-aarch64-be.hash                  | 6 +++---
>  .../toolchain-external-arm-aarch64-be.mk                    | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> index 130eca89d5..ea63687c5b 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
> -	bool "Arm AArch64 BE 2019.03"
> +	bool "Arm AArch64 BE 2019.12"
>  	depends on BR2_aarch64_be
>  	depends on BR2_HOSTARCH = "x86_64"
>  	depends on !BR2_STATIC_LIBS
> @@ -7,8 +7,8 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
>  	help
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options
> index add4adad2a..745af8a29e 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options
> @@ -1,7 +1,7 @@
>  if BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
>  
>  config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> -	default "aarch64_be-linux-gnu"
> +	default "aarch64_be-none-linux-gnu"
>  
>  config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
>  	default "toolchain-external-arm-aarch64-be"
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
> index e20885e43e..956c02354a 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
> @@ -1,4 +1,4 @@
> -# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64_be-linux-gnu.tar.xz.asc
> -md5 51301481db36aa743213e8cd16dfa1e7 gcc-arm-8.3-2019.03-x86_64-aarch64_be-linux-gnu.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
> +md5 4c1bbac7ff9afde4b492adb3831d32fd gcc-arm-9.2-2019.12-x86_64-aarch64_be-none-linux-gnu.tar.xz
>  # locally calculated
> -sha256 5689d3cbb019144e55162c6b414ee1fc8362d9a21fbedadc49951ae97f95e62c gcc-arm-8.3-2019.03-x86_64-aarch64_be-linux-gnu.tar.xz
> +sha256 5689d3cbb019144e55162c6b414ee1fc8362d9a21fbedadc49951ae97f95e62c gcc-arm-9.2-2019.12-x86_64-aarch64_be-none-linux-gnu.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
> index 9aed38a8ca..e06f122991 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2019.03
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2019.12
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
>  
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-8.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-linux-gnu.tar.xz
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-9.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz

This patch is ok as is but the url provided on the web site is broken for now.

Best regards,
Romain

>  
>  $(eval $(toolchain-external-package))
> 
