From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 17:25:42 +0200
Subject: [Buildroot] [PATCH 1/3] package/rng-tools: needs
 argp-standalone with musl toolchains
In-Reply-To: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
References: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150802152542.GD3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-08-01 18:55 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/rng-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
> index 43c5a1c..469b60e 100644
> --- a/package/rng-tools/Config.in
> +++ b/package/rng-tools/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_RNG_TOOLS
>  	bool "rng-tools"
> -	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL

You also need to adjust the build dependencies in the .mk .

Regards,
Yann E. MORIN.

>  	# For rdrand ligcrypt is required and it's not obvious to users
>  	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
>  	help
> -- 
> 2.4.3
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
