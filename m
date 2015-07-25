From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 21:34:35 +0200
Subject: [Buildroot] [PATCH] Makefile: unexport O
In-Reply-To: <1437851259-4539-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1437851259-4539-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150725193435.GV3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2015-07-25 16:07 -0300, Guido Mart?nez spake thusly:
> After bee5745ccc2 ("Makefile: don't depend on the umask"), any use
> of "make O=<dir>" would leak $O into the enviroment for submakes,
> and it's inherited by package makefiles. Some package makefiles have
> protections to make sure they don't use the value of $O if it comes from
> the enviroment (Linux), but some don't (uClibc).
> 
> This caused build failures when using a different output dir.
> 
> Fix this by unconditionally unexporting the O variable, since we never
> need to have it set in the environment for packages, it should be only
> internally used by BR.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 8b9c5d9..9059884 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -329,6 +329,7 @@ unexport CONFIG_SITE
>  unexport QMAKESPEC
>  unexport TERMINFO
>  unexport MACHINE
> +unexport O
>  
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
> -- 
> 2.1.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
