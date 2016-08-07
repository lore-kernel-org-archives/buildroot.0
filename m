From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Aug 2016 22:04:41 +0200
Subject: [Buildroot] [PATCH 1/2] blktrace: add missing dependency on
 Config.in comment
In-Reply-To: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807200441.GC5855@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-07 00:11 +0200, Thomas Petazzoni spake thusly:
> The BR2_PACKAGE_BLKTRACE option "depends on
> BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS", but this architecture dependency was
> not replicated in the Config.in comment. This commit fixes this
> inconsistency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/blktrace/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
> index 958f004..c17de80 100644
> --- a/package/blktrace/Config.in
> +++ b/package/blktrace/Config.in
> @@ -12,4 +12,5 @@ config BR2_PACKAGE_BLKTRACE
>  	  http://git.kernel.dk/?p=blktrace.git;a=summary
>  
>  comment "blktrace needs a glibc or musl toolchain"
> +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
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
