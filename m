From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:52:10 +0100
Subject: [Buildroot] [PATCH 11/15] boot/gummiboot: drop largefile depends
In-Reply-To: <1426270934-15499-12-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314225210.GO4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Ditto comment about the commit log:  BR2_LARGEFILE=y always...

Otherwise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  boot/gummiboot/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
> index 8d70680..ad49793 100644
> --- a/boot/gummiboot/Config.in
> +++ b/boot/gummiboot/Config.in
> @@ -4,7 +4,6 @@ config BR2_TARGET_GUMMIBOOT
>  	select BR2_PACKAGE_GNU_EFI
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -	depends on BR2_LARGEFILE # util-linux
>  	depends on BR2_USE_WCHAR # util-linux
>  	help
>  	  gummiboot is a simple UEFI boot manager which executes
> @@ -24,5 +23,5 @@ config BR2_TARGET_GUMMIBOOT
>  
>  	  http://freedesktop.org/wiki/Software/gummiboot/
>  
> -comment "gummiboot needs a toolchain w/ largefile, wchar"
> -	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> +comment "gummiboot needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
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
