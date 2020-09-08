From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 23:49:29 +0200
Subject: [Buildroot] [PATCH v2 1/6] toolchain/buildroot: allow uclibc-ng
 for riscv
In-Reply-To: <20200908113324.1022230-2-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-2-damien.lemoal@wdc.com>
Message-ID: <20200908214929.GF14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damien, All,

+Petr in Cc as he's working on a the same topic:

    https://patchwork.ozlabs.org/project/buildroot/patch/20200908145346.198693-1-petr.vorel at gmail.com/

On 2020-09-08 20:33 +0900, Damien Le Moal spake thusly:
> uclibcb supports RISC-V architecture since version 1.0.31. Allow its
> selection for that architecture.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
[--SNIP--]
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 418d5cb387..49f67c7348 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -32,7 +32,9 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
>  		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
>  		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
> -		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
> +		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64  || \
> +		   BR2_riscv

Please keep alphabetical ordeing in the architecture list, i.e. riscv
goes between BR2_powerpc and BR2_sh2a

But as I said to Petr, I guess cleanup the layout of that list would
be OK in a separate, preparatory patch, which would make it easier to
properly add riscv in the correct place.

Regards,
Yann E. MORIN.

>  	select BR2_TOOLCHAIN_USES_UCLIBC
>  	help
>  	  This option selects uClibc-ng as the C library for the
> -- 
> 2.26.2
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
