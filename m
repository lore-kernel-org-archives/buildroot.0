From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:22:51 +0200
Subject: [Buildroot] [PATCH 04/14] toolchain: remove IPv6 selects
In-Reply-To: <1428754662-27829-4-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412142251.GG21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> There's no need for toolchains or the user to declare IPv6 support since
> it's now mandatory.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  toolchain/Config.in                    |  2 --
>  toolchain/toolchain-external/Config.in | 11 -----------
>  2 files changed, 13 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 32a00a9..a851ce4 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
[--SNIP--]
> @@ -1145,14 +1142,6 @@ endchoice
>  
>  if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
>  
> -config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
> -	bool "Toolchain has IPv6 support?"
> -	select BR2_INET_IPV6
> -	help
> -	  Select this option if your external toolchain supports
> -	  IPv6. If you don't know, leave the default value, Buildroot
> -	  will tell you if it's correct or not.

This hunk should be squashed into your first patch (toolchain/helpers:
make IPv6 mandatory for uclibc toolchains).

Regards,
Yann E. MORIN.

>  config BR2_TOOLCHAIN_EXTERNAL_WCHAR
>  	bool "Toolchain has WCHAR support?"
>  	select BR2_USE_WCHAR
> -- 
> 2.0.5
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
