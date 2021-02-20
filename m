From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 18:20:32 +0100
Subject: [Buildroot] [PATCH/next] package/libxcrypt: install to staging
 instead of target
In-Reply-To: <20210220163215.5529-1-guillaume.bressaix@gmail.com>
References: <20210220163215.5529-1-guillaume.bressaix@gmail.com>
Message-ID: <20210220172032.GP2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2021-02-20 17:32 +0100, guillaume.bressaix at gmail.com spake thusly:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

I tweaked the commit title to read "also install to staging", because we
still want to, and still do, install to target.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libxcrypt/libxcrypt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
> index f9799ac006..63132edd9d 100644
> --- a/package/libxcrypt/libxcrypt.mk
> +++ b/package/libxcrypt/libxcrypt.mk
> @@ -8,6 +8,7 @@ LIBXCRYPT_VERSION = 4.4.17
>  LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
>  LIBXCRYPT_LICENSE = LGPL-2.1+
>  LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
> +LIBXCRYPT_INSTALL_STAGING = YES
>  LIBXCRYPT_AUTORECONF = YES
>  
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
