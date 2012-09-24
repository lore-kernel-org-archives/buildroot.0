From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Sep 2012 22:26:44 +0200
Subject: [Buildroot] [PATCH] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
In-Reply-To: <1348515532-4855-1-git-send-email-baruch@tkos.co.il>
References: <1348515532-4855-1-git-send-email-baruch@tkos.co.il>
Message-ID: <201209242226.44541.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Monday 24 September 2012 21:38:52 Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/toolchain-external/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index f86ed74..911fea4 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -664,7 +664,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
> -	bool "glibc"
> +	bool "glibc/eglibc"
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC

For all practical purposes, that's true.

Although eglibc can be configured to include/exclude parts of the features,
it seems to not be in wide use, if at all.

So, I'd like that to be at least mentionned in the commit log, and maybe
as a help entry for BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC.

With that:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
