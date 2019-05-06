From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 May 2019 22:15:13 +0200
Subject: [Buildroot] [PATCH 08/15] package/gcc: switch to gcc 8.x as the
 default
In-Reply-To: <20190506183011.4856-9-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
 <20190506183011.4856-9-romain.naour@gmail.com>
Message-ID: <20190506201513.GF6887@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-05-06 20:30 +0200, Romain Naour spake thusly:
> Even if gcc 8 is still maintained for some time (gcc 7.5 is pending),
             ^^^
I guess you meant '7' here, as in:
    gcc 7 is still maintained (gcc 7.5 is pending)

Regards,
Yann E. MORIN.

> switch to gcc 8.x since it has been released since 2018-05-02 and
> gcc 9.x is available since 2019-05-03.
> 
> We have been having toolchains in the autobuilders with gcc
> 8.x for a while, so the vast majority of the problems should have
> already been solved.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/gcc/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index a9f8492399..1d3af73e69 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -4,7 +4,7 @@ choice
>  	prompt "GCC compiler Version"
>  	default BR2_GCC_VERSION_ARC if BR2_arc
>  	default BR2_GCC_VERSION_OR1K if BR2_or1k
> -	default BR2_GCC_VERSION_7_X
> +	default BR2_GCC_VERSION_8_X
>  	help
>  	  Select the version of gcc you wish to use.
>  
> -- 
> 2.14.5
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
