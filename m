From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 May 2021 22:05:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: xtensa needs headers >=
 5.0
In-Reply-To: <20210529174846.2844268-1-fontaine.fabrice@gmail.com>
References: <20210529174846.2844268-1-fontaine.fabrice@gmail.com>
Message-ID: <20210529200549.GC3858765@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-29 19:48 +0200, Fabrice Fontaine spake thusly:
> xtensa support needs user_pt_regs since version 5.6 and
> https://github.com/strace/strace/commit/2429c69961e2598902bded9c02dd601b362b66b4
> 
> However user_pt_regs is only available since kernel 5.0 and
> https://github.com/torvalds/linux/commit/06fbac8e8971f2fa526e189304dd95ee62f39dbe
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c6c4fb3b9098c5fc5dbe4415e2a9757fc775b746
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/strace/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/strace/Config.in b/package/strace/Config.in
> index 5b33dad392..c394d4c398 100644
> --- a/package/strace/Config.in
> +++ b/package/strace/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_STRACE
>  	bool "strace"
>  	# needs at least kernel headers 4.0 on nios2
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
> +	# needs at least kernel headers 5.0 on xtensa
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
>  	depends on !BR2_nds32 && !BR2_RISCV_32
>  	help
>  	  A useful diagnostic, instructional, and debugging tool.
> @@ -16,3 +18,7 @@ config BR2_PACKAGE_STRACE
>  comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
>  	depends on BR2_nios2
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
> +
> +comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
> +	depends on BR2_xtensa
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> -- 
> 2.30.2
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
