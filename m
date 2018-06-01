From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jun 2018 17:42:09 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/binutils: Cortex-M targets
 require version <2.29
In-Reply-To: <1527772887-31616-3-git-send-email-christophe.priouzeau@st.com>
References: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
 <1527772887-31616-3-git-send-email-christophe.priouzeau@st.com>
Message-ID: <20180601154209.GB3841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe, All,

On 2018-05-31 13:21 +0000, Christophe PRIOUZEAU spake thusly:
> From: Laurent GONZALEZ <br22@gezedo.com>
> 
> binutils 2.29 changed the implementation of adr pseudo instruction
> it breaks linux kernel and impacts Cortex-M targets (eg. stm32)
> 
> Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
>  package/binutils/Config.in.host | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 03b2281..9a4caad 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -2,8 +2,9 @@ comment "Binutils Options"
>  
>  choice
>  	prompt "Binutils Version"
> -	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
> -	default BR2_BINUTILS_VERSION_ARC if BR2_arc
> +	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M

Again, isn't it the fact that a Thumb-mode compilation is attempted, so
we'd trigger the same issue when building in Thumb mode for (e.g.) a
cortex-a CPU as well?

Regards,
Yann E. MORIN.

> +	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc && !BR2_ARM_CPU_ARMV7M
> +	default BR2_BINUTILS_VERSION_ARC if BR2_arc && !BR2_ARM_CPU_ARMV7M
>  	help
>  	  Select the version of binutils you wish to use.
>  
> -- 
> 2.7.4
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
