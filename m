From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2015 19:13:31 +0200
Subject: [Buildroot] [PATCH v2] Makefile: remove extra ifdef/endif of
 top Makefile
In-Reply-To: <1428383349-20804-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428383349-20804-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20150407171331.GE4216@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Masahiro, All,

On 2015-04-07 14:09 +0900, Masahiro Yamada spake thusly:
> The GNU make's origin function know undefined variable well,
> so the outer ifdef/endif conditional checking is unneeded.
> 
> From `info make` documentation, origin will return
> 
>   `undefined'
>      if VARIABLE was never defined.
>   `command line'
>      if VARIABLE was defined on the command line.
>    ...
> 
> Therefore, $(origin V) will get a value anyway, killing ifdef/endif
> is viable and safe.
> 
> Furthermore, I've checked the minimal requirements from the top
> Makefile is GNU make 3.81, and that version of GNU make has support
> of origin function well already, so now it's safe to kill the outer
> conditional checking, without upgrading the minimal requirements.
> 
> Signed-off-by: Cheng Renquan <crq@kernel.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> [ Commit description is borrowed from Linux Kernel
>   (commit b8b0618cf6fa) and adjusted for Buildroot ]
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Changes in v2:
>   - Add more detailed explanation
> 
>  Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d6426b3..9db52a8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -184,10 +184,8 @@ endif
>  
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
> -ifdef V
> -  ifeq ("$(origin V)", "command line")
> -    KBUILD_VERBOSE = $(V)
> -  endif
> +ifeq ("$(origin V)", "command line")
> +  KBUILD_VERBOSE = $(V)
>  endif
>  ifndef KBUILD_VERBOSE
>    KBUILD_VERBOSE = 0
> -- 
> 1.9.1
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
