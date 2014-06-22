From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 18:38:47 +0200
Subject: [Buildroot] [PATCH] faifa: needs threads
In-Reply-To: <1403440065-19554-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403440065-19554-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140622163847.GA18122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-22 09:27 -0300, Gustavo Zacarias spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/a93/a93395c656169e0f08f471f12bc05f29c9ea2976/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/faifa/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/faifa/Config.in b/package/faifa/Config.in
> index 2acd505..23133b7 100644
> --- a/package/faifa/Config.in
> +++ b/package/faifa/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_FAIFA
>  	bool "faifa"
>  	select BR2_PACKAGE_LIBPCAP
>  	depends on !BR2_PREFER_STATIC_LIB
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Faifa can configure any Intellon-based Power Line
>  	  Communication device using Intellon INT5000 and INT6000
> @@ -11,5 +12,5 @@ config BR2_PACKAGE_FAIFA
>  
>  	  https://dev.open-plc.org
>  
> -comment "faifa needs a toolchain w/ dynamic library"
> -	depends on BR2_PREFER_STATIC_LIB
> +comment "faifa needs a toolchain w/ dynamic library, threads"
> +	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
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
