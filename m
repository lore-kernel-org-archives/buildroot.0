From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:34:04 +0100
Subject: [Buildroot] [PATCH] bash re-enable parallel builds
In-Reply-To: <1457720871-10472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457720871-10472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160312223404.GE3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2016-03-11 15:27 -0300, Gustavo Zacarias spake thusly:
> They don't seem to be causing any issues after bumping to the 4.3.x
> series and several tests.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bash/bash.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 97d7182..3cd8d82 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -22,10 +22,6 @@ BASH_CONF_ENV += \
>  	bash_cv_func_sigsetjmp=present \
>  	bash_cv_printf_a_format=yes
>  
> -# Parallel build sometimes fails because some of the generator tools
> -# are built twice (i.e. while executing).
> -BASH_MAKE = $(MAKE1)
> -
>  # The static build needs some trickery
>  ifeq ($(BR2_STATIC_LIBS),y)
>  BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
> -- 
> 2.4.10
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
