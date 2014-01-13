From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 19:05:20 +0100
Subject: [Buildroot] [PATCH] arch: add support for "jaguar" AMD CPU
 optimisations.
In-Reply-To: <1755668586.279162.1389632820523.JavaMail.root@mail>
References: <1818192605.238804.1389631057174.JavaMail.root@mail>
 <1755668586.279162.1389632820523.JavaMail.root@mail>
Message-ID: <20140113180520.GD3344@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adiren, All,

On 2014-01-13 12:07 -0500, Adrien B?raud spake thusly:
> This new version forces the use of GCC 4.8:

When sending an updated version of a patch:
  - add a 'v2' (or v3, v4...) to the subject, such that it is obvious a
    previous patch was sent:
        [PATCH v2] arch: add support for "jaguar" AMD CPU
    You can do that with: git send-email --annotate

  - keep the initial commit log, and ammend it accordingly, for example:

    AMD Jaguar ( https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29 ) is
    suddenly a popular architecture since it is used in the PS4 and the XBox One.
    Many embedded systems are also likely to use it in the next years.

    This patch adds support for GCC architecture-specific optimizations and
    tuning for these CPUs, and locks it to only gcc-4.8 (since it is the
    earliest version with support for jaguar).

I don't have much more to say about the patch itself.

However...

> Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>
[--SNIP--]
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 41c1213..db14564 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -18,12 +18,12 @@ choice
>  		bool "gcc 4.2.2-avr32-2.1.5"
>  
>  	config BR2_GCC_VERSION_4_3_X
> -		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
> +		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4

... I do not like those very long lines. But that has nothing to do with
your patch per-se...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
