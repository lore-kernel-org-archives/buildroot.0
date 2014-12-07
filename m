From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 23:34:26 +0100
Subject: [Buildroot] [PATCH] arch/Config.in: Drop unused BR2_BINFMT_ELF
In-Reply-To: <da642e089b9c4f19e755d4ef1f3b7477ac7a7201.1416476239.git.baruch@tkos.co.il>
References: <da642e089b9c4f19e755d4ef1f3b7477ac7a7201.1416476239.git.baruch@tkos.co.il>
Message-ID: <20141207223426.GL10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-11-20 11:37 +0200, Baruch Siach spake thusly:
> The BR2_BINFMT_ELF symbol (introduced in commit 57133825c930) can't possibly
> be selected because it depends on (!BR2_bfin && !BR2_m68k), while the
> surrounding choice depends on (BR2_bfin || BR2_m68k). This symbol is never
> used.
> 
> Cc: Sonic Zhang <sonic.zhang@analog.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

As Thomas P. said, he has a series that needs this symbol, and he now
has posted that series to the list:
    http://lists.busybox.net/pipermail/buildroot/2014-December/114192.html

So I've marked this patch "Superseded" in Patchowrk.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index d62d8872b3f3..966046aa4b84 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -257,14 +257,6 @@ choice
>  	depends on BR2_bfin || BR2_m68k
>  	default BR2_BINFMT_FDPIC
>  
> -config BR2_BINFMT_ELF
> -	bool "ELF"
> -	depends on !BR2_bfin && !BR2_m68k
> -	help
> -	  ELF (Executable and Linkable Format) is a format for libraries and
> -	  executables used across different architectures and operating
> -	  systems.
> -
>  config BR2_BINFMT_FDPIC
>  	bool "FDPIC"
>  	depends on BR2_bfin || BR2_m68k
> -- 
> 2.1.3
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
