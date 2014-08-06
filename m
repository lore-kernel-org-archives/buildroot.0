From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 22:25:56 +0200
Subject: [Buildroot] [PATCH] toolchain: fix 3.16 selection for custom
 version
In-Reply-To: <1407356267-3005-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407356267-3005-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140806202555.GF1587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-08-06 17:17 -0300, Gustavo Zacarias spake thusly:
> Fix d'oh typo from 911516f1b6dec4b2985a1f454949f8d9d10f6ef5 that
> prevents custom version string 3.16 headers from working properly.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/linux-headers/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 0af5974..4d9378e 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -82,7 +82,7 @@ choice
>  
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
>  	bool "3.16.x"
> -	select BR2_PACKAGE_HEADERS_AT_LEAST_3_16
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
>  
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
>  	bool "3.15.x"
> -- 
> 1.8.5.5
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
