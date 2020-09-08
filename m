From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 23:45:45 +0200
Subject: [Buildroot] [PATCH] package/uclibc: reenable riscv64
In-Reply-To: <20200908145346.198693-1-petr.vorel@gmail.com>
References: <20200908145346.198693-1-petr.vorel@gmail.com>
Message-ID: <20200908214545.GE14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

+Damien in Cc as he's also working on the same topic:

    https://patchwork.ozlabs.org/project/buildroot/patch/20200908113324.1022230-2-damien.lemoal at wdc.com/

On 2020-09-08 16:53 +0200, Petr Vorel spake thusly:
> Missing __riscv_flush_icache() (reason for the revert) was implemented
> in 1.0.35 in commit 8b1f6b2e0 "riscv64: add __riscv_flush_icache".
> 
> Revert "Revert "toolchain/toolchain-buildroot: enable uclibc for riscv64""
> This reverts commit e7d631c0df1698b4edc94f148e7247869430e108.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
[--SNIP--]
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 418d5cb387..068f91c875 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -27,12 +27,13 @@ choice
>  
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc-ng"
> -	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
> -		   BR2_arm     || BR2_armeb    || \
> -		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
> -		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> -		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
> -		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
> +	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle      || BR2_arceb    || \
> +		   BR2_arm     || BR2_armeb      || \
> +		   BR2_i386    || BR2_m68k       || BR2_microblaze || \
> +		   BR2_mips    || BR2_mipsel     || BR2_mips64     || BR2_mips64el || \
> +		   BR2_or1k    || BR2_powerpc    || BR2_RISCV_64   || \
> +		   BR2_sh2a    || BR2_sh4	 || BR2_sh4eb      || BR2_sparc    || \
> +		   BR2_xtensa  || BR2_x86_64

Please do not reindent eveything just to add the new arch, especially
since the existing code is not all properly indented already.

(but if you really don;t like the existing mess ;-) , a separate cleanup
patch is OK)

Regards,
Yann E. MORIN.

>  	select BR2_TOOLCHAIN_USES_UCLIBC
>  	help
>  	  This option selects uClibc-ng as the C library for the
> -- 
> 2.27.0.rc0
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
