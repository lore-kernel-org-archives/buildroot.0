From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:07:40 +0200
Subject: [Buildroot] [PATCH] package/lvm2: default standard install to y
In-Reply-To: <20210616173303.2234867-1-arnout@mind.be>
References: <20210616173303.2234867-1-arnout@mind.be>
Message-ID: <20210616190740.GN2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-06-16 19:33 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Until commit 5c07dfcc1a52e2804011574a3e022523a20546c8
> BR2_PACKAGE_LVM2_STANDARD_INSTALL would default to y. Indeed, the
> default read:
> 
>       default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
> 
> Since the legacy symbol is normally not selected, this defaults to y.
> 
> Commit 5c07dfcc1a52e2804011574a3e022523a20546c8 inadvertedly removed the
> entire line instead of just the condition.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=13846
> For-stable: 2021.02, 2021.05
> Cc: dominique.tronche at atos.net
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> --
> As an experiment, I added the For-stable tag (which I invented myself).
> Peter, is this useful? Should we propose this in the documentation?
> ---
>  package/lvm2/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index 317027929e..cc740dd40c 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -26,6 +26,7 @@ if BR2_PACKAGE_LVM2
>  
>  config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>  	bool "standard install instead of only dmsetup"
> +	default y
>  	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	help
> -- 
> 2.31.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
