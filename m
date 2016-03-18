From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Mar 2016 23:30:50 +0100
Subject: [Buildroot] [PATCH v2 01/17] arch/arm: introduce and use
 BR2_ARM_CPU_ARMV7M
In-Reply-To: <1458335299-27409-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160318223050.GB32171@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-18 22:08 +0100, Thomas Petazzoni spake thusly:
> All ARM cores should select a BR2_ARM_CPU_* option. Currently, the
> cortex-m3 does not, which this commit fixes by introducing a
> BR2_ARM_CPU_ARMV7M option.

Tangentially related: those options are not user to sepcify iany of the
gcc options, but to allow packages that have CPU-specific code todepend
on it or to enable such support it.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.arm | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 04f0369..33f763a 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -52,6 +52,9 @@ config BR2_ARM_CPU_ARMV6
>  config BR2_ARM_CPU_ARMV7A
>  	bool
>  
> +config BR2_ARM_CPU_ARMV7M
> +	bool
> +
>  choice
>  	prompt "Target Architecture Variant"
>  	depends on BR2_arm || BR2_armeb
> @@ -171,6 +174,7 @@ config BR2_cortex_m3
>  	bool "cortex-M3"
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7M
>  config BR2_fa526
>  	bool "fa526/626"
>  	select BR2_ARM_CPU_HAS_ARM
> -- 
> 2.6.4
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
