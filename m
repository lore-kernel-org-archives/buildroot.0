From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 21:36:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix comment
 dependencies
In-Reply-To: <1417727462-10875-1-git-send-email-romain.naour@openwide.fr>
References: <1417727462-10875-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141207203652.GD3902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-12-04 22:11 +0100, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/binutils/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils/Config.in b/package/binutils/Config.in
> index 50c38b6..fb037ef 100644
> --- a/package/binutils/Config.in
> +++ b/package/binutils/Config.in
> @@ -22,5 +22,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
>  endif
>  
>  comment "binutils needs a toolchain w/ wchar"
> -	depends on !BR2_aarch64 && !BR2_nios2
> -	depends on BR2_USE_WCHAR
> +	depends on !BR2_aarch64 || !BR2_nios2

Nope. Architecture dependency must be the same as for the package
symbol, so we must keep the '&&' here, like there is for
BR2_PACKAGE_BINUTILS.

> +	depends on !BR2_USE_WCHAR

Yes.

Regards,
Yann E. MORIN.

> -- 
> 1.9.3
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
