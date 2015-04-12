From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:10:26 +0200
Subject: [Buildroot] [PATCH 05/14] toolchain-external: remove CS sh2
 toolchains
In-Reply-To: <1428754662-27829-5-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412141026.GE21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> Normally we'd deprecate them, but:
> 
> 1) They don't support IPv6 and it's being removed so it makes no sense.
> 2) They're based on uClibc 0.9.30-ish which is very old and surely has
> package build breakage all over it.

This should go in before patch 3 (toolchain-common: default to Y for IPv6)
otherwise you can enable IPv6-dependent packages even with those
toolchains.

Regards,
Yann E. MORIN.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  toolchain/toolchain-external/Config.in | 38 ----------------------------------
>  1 file changed, 38 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index a8949c5..97619d4 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -630,44 +630,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
>  	    - SH4A, uClibc, big endian
>  	      Not usable in Buildroot yet.
>  
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
> -	bool "Sourcery CodeBench SH 2011.03"
> -	depends on BR2_sh2a
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_USE_WCHAR
> -	select BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	# kernel headers: 2.6.38
> -	help
> -	  Sourcery CodeBench toolchain for the SuperH architecture,
> -	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
> -	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.38. It has
> -	  support for the following variants:
> -	    - SH2A, uClibc, big endian
> -
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
> -	bool "Sourcery CodeBench SH 2010.09"
> -	depends on BR2_sh2a
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_USE_WCHAR
> -	select BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	# kernel headers: 2.6.35
> -	help
> -	  Sourcery CodeBench toolchain for the SuperH architecture,
> -	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
> -	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.35.2. It
> -	  has support for the following variants:
> -	    - SH2A, uClibc, big endian
> -
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
>  	bool "Sourcery CodeBench AMD64 2014.05"
>  	depends on BR2_x86_64
> -- 
> 2.0.5
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
