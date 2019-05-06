From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 May 2019 22:07:23 +0200
Subject: [Buildroot] [PATCH 04/15] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_9
In-Reply-To: <20190506183011.4856-5-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
 <20190506183011.4856-5-romain.naour@gmail.com>
Message-ID: <20190506200723.GD6887@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-05-06 20:30 +0200, Romain Naour spake thusly:
> This new symbol will be used by architectures introduced with gcc 9 and
> by external toolchains based on gcc 9.
> 
> [1] https://gcc.gnu.org/gcc-9/changes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

This must be added after you actually introduce gcc-9.

I.e.:

  - add gcc-9
  - add this new symbol
  - add the ne archs or ocres that need gcc-9

If we apply just this patch, it does not make sense at all: we'd have a
way to specify that we require something that we can't even provide...

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index d82803c828..051d4cdab7 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -302,6 +302,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  	bool
>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  
> +config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
> +	bool
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
> +
>  # The following string values are defined by the individual
>  # Config.in.$ARCH files
>  config BR2_ARCH
> -- 
> 2.14.5
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
