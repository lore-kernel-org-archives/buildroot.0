From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 18:43:10 +0100
Subject: [Buildroot] [PATCH] package/libxcrypt: --disable-werror to fix
 problem with sensitive compilers
In-Reply-To: <20210220173815.28154-1-guillaume.bressaix@gmail.com>
References: <20210220173815.28154-1-guillaume.bressaix@gmail.com>
Message-ID: <20210220174310.GR2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2021-02-20 18:38 +0100, guillaume.bressaix at gmail.com spake thusly:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Fixes: http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f
> 
> Some sensitive compilers may raise warnings that turn into errors.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libxcrypt/libxcrypt.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
> index 63132edd9d..ccbb1a282c 100644
> --- a/package/libxcrypt/libxcrypt.mk
> +++ b/package/libxcrypt/libxcrypt.mk
> @@ -11,4 +11,7 @@ LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
>  LIBXCRYPT_INSTALL_STAGING = YES
>  LIBXCRYPT_AUTORECONF = YES
>  
> +# Some warnings turn into errors with some sensitive compilers
> +LIBXCRYPT_CONF_OPTS = --disable-werror
> +
>  $(eval $(autotools-package))
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
