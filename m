From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Sep 2014 00:09:28 +0200
Subject: [Buildroot] [PATCH 4/4] arch: remove BR2_GCC_TARGET_ARCH
	definitions on ARM
In-Reply-To: <1410814919-11523-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140915220928.GA22581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-15 23:01 +0200, Thomas Petazzoni spake thusly:
> On ARM, we were defining both the CPU type and the architecture
> variant. However, depending on the version of gcc, a given combination
> of (CPU, architecture) may not be the same. Since the architecture
> variant is implied by the CPU type, given the former is not necessary,
> and we can simply specify the latter.
> 
> From the gcc documentation:
> 
>   This specifies the name of the target ARM processor. GCC uses this
>   name to derive the name of the target ARM architecture (as if
>   specified by -march) and the ARM processor type for which to tune
>   for performance (as if specified by -mtune). Where this option is
>   used in conjunction with -march or -mtune, those options take
>   precedence over the appropriate part of this option.
> 
> Note that we verified that for all BR2_GCC_TARGET_ARCH value that
> existed, a proper BR2_GCC_TARGET_CPU value is defined.

I guess we'll keep this one in limbo until we have a final answer on
switching from -mcpu to -mtune for ARM.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 6e3c4e6..68f6370 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -352,25 +352,6 @@ config BR2_GCC_TARGET_CPU
>  	default "xscale"	if BR2_xscale
>  	default "iwmmxt"	if BR2_iwmmxt
>  
> -config BR2_GCC_TARGET_ARCH
> -	default "armv4t"	if BR2_arm920t
> -	default "armv4t"	if BR2_arm922t
> -	default "armv5te"	if BR2_arm926t
> -	default "armv6j"	if BR2_arm1136jf_s
> -	default "armv6zk"	if BR2_arm1176jz_s
> -	default "armv6zk"	if BR2_arm1176jzf_s
> -	default "armv7-a"	if BR2_cortex_a5
> -	default "armv7-a"	if BR2_cortex_a7
> -	default "armv7-a"	if BR2_cortex_a8
> -	default "armv7-a"	if BR2_cortex_a9
> -	default "armv7-a"	if BR2_cortex_a12
> -	default "armv7-a"	if BR2_cortex_a15
> -	default "armv4"		if BR2_fa526
> -	default "armv7-a"	if BR2_pj4
> -	default "armv4"		if BR2_strongarm
> -	default "armv5te"	if BR2_xscale
> -	default "iwmmxt"	if BR2_iwmmxt
> -
>  config BR2_GCC_TARGET_ABI
>  	default "aapcs-linux"
>  
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
