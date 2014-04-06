From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Apr 2014 18:38:49 +0200
Subject: [Buildroot] [PATCH] external toolchain: add 3.14 choice for
 kernel headers
In-Reply-To: <1396801669-12089-1-git-send-email-s.martin49@gmail.com>
References: <1396801669-12089-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140406163849.GA26684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-06 18:27 +0200, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 3990336..9499629 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -965,6 +965,10 @@ choice
>  	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
>  	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
>  
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
> +	bool "3.14.x"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
>  	bool "3.13.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
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
