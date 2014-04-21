From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 19:46:22 +0200
Subject: [Buildroot] [PATCH v2] libdrm: needs threads
In-Reply-To: <1398102235-32101-1-git-send-email-romain.naour@openwide.fr>
References: <1398102235-32101-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140421174622.GH3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-04-21 19:43 +0200, Romain Naour spake thusly:
> libdrm select libpthread-stubs that needs threads support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1da/1dad13110312a44b40b9ee4050b265de1f3c8a42/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: Fix display comment (Yann)
> ---
>  package/libdrm/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 72cf5f8..df95eec 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBDRM
>  	bool "libdrm"
>  	select BR2_PACKAGE_LIBPTHREAD_STUBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
>  	depends on BR2_LARGEFILE
>  	help
>  	  Direct Rendering Manager
> @@ -59,5 +60,5 @@ endmenu
>  
>  endif
>  
> -comment "libdrm needs a toolchain w/ largefile"
> -	depends on !BR2_LARGEFILE
> +comment "libdrm needs a toolchain w/ largefile, threads"
> +	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 1.9.0
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
