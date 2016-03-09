From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Mar 2016 00:10:20 +0100
Subject: [Buildroot] [PATCH v7 02/18] core: use $(CURDIR) to set TOPDIR
In-Reply-To: <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20160309231020.GD5634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2016-03-09 23:58 +0100, Samuel Martin spake thusly:
> This changes saves a shell call and uses a variable automatically set
> by make [1].
> 
> [1] http://www.gnu.org/software/make/manual/make.html#Quick-Reference
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> 
> ---
> changes v6->v7:
> - none
> 
> changes v5->v6:
> - new patch
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index f2822a2..98c8dc7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -69,7 +69,7 @@ endif
>  .NOTPARALLEL:
>  
>  # absolute path
> -TOPDIR := $(shell pwd)
> +TOPDIR := $(CURDIR)
>  CONFIG_CONFIG_IN = Config.in
>  CONFIG = support/kconfig
>  DATE := $(shell date +%Y%m%d)
> -- 
> 2.7.2
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
