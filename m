From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 23:19:25 +0200
Subject: [Buildroot] [PATCH 02/11] arch: MIPS: Add config option
 BR2_GCC_TARGET_TUNE
In-Reply-To: <1396558881-29631-2-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-2-git-send-email-paul@crapouillou.net>
Message-ID: <20140403211925.GC17328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
> This option is actually already used in GCC's package.
> 
> This allows to optimize the toolchain for a specific MIPS processor
> while supporting more than one family of processors.

Is that really needed? man gcc says:

    When this option is not used, GCC optimizes for the processor
    specified by -march.

Since this patch would pass the same value to --with-arch and
--with-tune, and since this is the default of gcc, is it really
needed?

Neither ACKing nor NAKing this patch. Can you explain a bit more why we
would want that, given the above explanations?

Regards,
Yann E. MORIN.

> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/Config.in.mips | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index 20951e0..e4160a2 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -83,6 +83,16 @@ config BR2_GCC_TARGET_ARCH
>  	default "mips64"	if BR2_mips_64
>  	default "mips64r2"	if BR2_mips_64r2
>  
> +config BR2_GCC_TARGET_TUNE
> +	default "mips1"		if BR2_mips_1
> +	default "mips2"		if BR2_mips_2
> +	default "mips3"		if BR2_mips_3
> +	default "mips4"		if BR2_mips_4
> +	default "mips32"	if BR2_mips_32
> +	default "mips32r2"	if BR2_mips_32r2
> +	default "mips64"	if BR2_mips_64
> +	default "mips64r2"	if BR2_mips_64r2
> +
>  config BR2_MIPS_OABI32
>  	bool
>  	default y		if BR2_mips || BR2_mipsel
> -- 
> 1.9.0
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
