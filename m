From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:12:27 +0100
Subject: [Buildroot] [PATCH] support / toolchain: use consistent code
 style for C code
In-Reply-To: <20200208194400.18754-1-peter@korsgaard.com>
References: <20200208194400.18754-1-peter@korsgaard.com>
Message-ID: <20200208211227.GA23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-08 20:44 +0100, Peter Korsgaard spake thusly:
> Most, but not all our C code follows the Linux kernel code style (as
> documented in Documentation/process/coding-style.rst).  Adjust the few
> places doing differently:
> 
> - Braces:
>   ..but the preferred way, as shown to us by the prophets Kernighan
>   and Ritchie, is to put the opening brace last on the line
> 
> - Spaces after keywords:
>   Use a space after (most) keywords
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I just dropped the 'support /' from the title, because both really are
pretty much about the toolchain "infra".

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/check-kernel-headers.sh | 3 +--
>  toolchain/toolchain-wrapper.c           | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index d1864cb05e..841df98b64 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -53,8 +53,7 @@ int main(int argc __attribute__((unused)),
>      int l = LINUX_VERSION_CODE & ~0xFF;
>      int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
>  
> -    if(l != h)
> -    {
> +    if (l != h) {
>          printf("Incorrect selection of kernel headers: ");
>          printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
>                 ((LINUX_VERSION_CODE>>16) & 0xFF),
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index b7705a4cbf..8cfc963ccd 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -434,7 +434,7 @@ int main(int argc, char **argv)
>  		/* Both args below can be set at compile/link time
>  		 * and are ignored correctly when not used
>  		 */
> -		if(i == argc)
> +		if (i == argc)
>  			*cur++ = "-fPIE";
>  
>  		if (!found_shared)
> -- 
> 2.20.1
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
