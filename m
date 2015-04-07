From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Apr 2015 07:19:11 +0300
Subject: [Buildroot] [PATCH] Makefile: remove redundant ifdef V
In-Reply-To: <1428379696-16079-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428379696-16079-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20150407041911.GB2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Masahiro Yamada,

On Tue, Apr 07, 2015 at 01:08:16PM +0900, Masahiro Yamada wrote:
> If "V" is not defined, "$(origin V)" returns "undefined".
> "ifdev V" is redundant.

V is not defined in code but ...

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
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

... as this comment says, you can define V manually on the make invocation 
command line. That is its intended use.

> -ifdef V
> -  ifeq ("$(origin V)", "command line")
> -    KBUILD_VERBOSE = $(V)
> -  endif
> +ifeq ("$(origin V)", "command line")
> +  KBUILD_VERBOSE = $(V)
>  endif
>  ifndef KBUILD_VERBOSE
>    KBUILD_VERBOSE = 0

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
