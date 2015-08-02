From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 17:26:45 +0200
Subject: [Buildroot] [PATCH 2/3] package/eflutils: needs argp-standalone
 with musl toolchains
In-Reply-To: <1438448118-26198-2-git-send-email-romain.naour@openwide.fr>
References: <1438448118-26198-1-git-send-email-romain.naour@openwide.fr>
 <1438448118-26198-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150802152645.GE3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-08-01 18:55 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/elfutils/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
> index 6c6856e..ea0ae62 100644
> --- a/package/elfutils/Config.in
> +++ b/package/elfutils/Config.in
> @@ -4,7 +4,7 @@ comment "elfutils needs a toolchain w/ wchar, dynamic library"
>  
>  config BR2_PACKAGE_ELFUTILS
>  	bool "elfutils"
> -	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL

Ditto, you also need to adjust the build dependencies in the .mk .

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
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
