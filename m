From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 19:43:20 +0200
Subject: [Buildroot] [PATCH 2/2] ti-gfx: select fbset as it is a runtime
 dependency
In-Reply-To: <1401644248-27612-2-git-send-email-hadrien.boutteville@gmail.com>
References: <1401644248-27612-1-git-send-email-hadrien.boutteville@gmail.com>
 <1401644248-27612-2-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140601174320.GL3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien, All,

On 2014-06-01 19:37 +0200, Hadrien Boutteville spake thusly:
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ti-gfx/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> index 3e8648e..4ee8622 100644
> --- a/package/ti-gfx/Config.in
> +++ b/package/ti-gfx/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_TI_GFX
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_HAS_POWERVR
> +	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
>  	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
>  	help
>  	  Graphics libraries for TI boards.
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
