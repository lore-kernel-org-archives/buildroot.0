From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 27 Aug 2015 20:26:55 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add mips64 for uClibc-ng
In-Reply-To: <20150811052205.GA24260@waldemar-brodkorb.de>
References: <20150811052205.GA24260@waldemar-brodkorb.de>
Message-ID: <20150827182655.GZ8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

ping...

Waldemar Brodkorb wrote,

> Filter out all other uClibc versions, as they containing
> serious bugs for mips64.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Changes v1 -> v2:
>   - filter out uClibc versions as requested by Thomas Petazzoni
> 
> ---
>  package/uclibc/Config.in                |    4 ++--
>  toolchain/toolchain-buildroot/Config.in |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index bf40a13..72e85ed 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -27,7 +27,7 @@ choice
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
>  		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL if !BR2_x86_i386
> -		depends on !(BR2_arc || BR2_xtensa)
> +		depends on !(BR2_arc || BR2_mips64 || BR2_mips64el || BR2_xtensa)
>  
>  	config BR2_UCLIBC_VERSION_ARC_GIT
>  		bool "uClibc Git ARC"
> @@ -50,7 +50,7 @@ choice
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
>  		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
>  		       if !BR2_x86_i386 && !BR2_xtensa
> -		depends on !(BR2_arc)
> +		depends on !(BR2_arc || BR2_mips64 || BR2_mips64el)
>  
>  endchoice
>  
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 13e2b15..6d74819 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -24,7 +24,7 @@ choice
>  	prompt "C library"
>  	default BR2_TOOLCHAIN_UCLIBC
>  	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_aarch64_be \
> -		|| BR2_microblaze || BR2_mips64 || BR2_mips64el || BR2_powerpc64
> +		|| BR2_microblaze || BR2_powerpc64
>  
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc"
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
