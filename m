From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Aug 2016 22:06:15 +0200
Subject: [Buildroot] [PATCH 2/2] blktrace: disable on PowerPC
In-Reply-To: <1470521474-16710-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470521474-16710-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807200615.GD5855@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-07 00:11 +0200, Thomas Petazzoni spake thusly:
> This package has been failing to build on PowerPC since March 2016, with
> nobody taking care of the problem, so let's disable this package on
> PowerPC for the time being. PowerPC is the only architecture on which
> blktrace fails to build currently.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5a673c692aeb957cd8beb2c2c10ce5fd882ba4b5/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/blktrace/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
> index c17de80..1b8212d 100644
> --- a/package/blktrace/Config.in
> +++ b/package/blktrace/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_BLKTRACE
>  	# Uses posix_spawn()
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> +	# issue: hidden symbol `_rest32gpr_30_x` is referenced by DSO
> +	depends on !BR2_powerpc
>  	select BR2_PACKAGE_LIBAIO
>  	help
>  	  blktrace is a block layer IO tracing mechanism which provides
> @@ -13,4 +15,5 @@ config BR2_PACKAGE_BLKTRACE
>  
>  comment "blktrace needs a glibc or musl toolchain"
>  	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> +	depends on !BR2_powerpc
>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> -- 
> 2.7.4
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
