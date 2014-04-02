From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Apr 2014 23:08:46 +0200
Subject: [Buildroot] [PATCH v2 31/41] xbmc: Fix Java dependency check
	(v2)
In-Reply-To: <1396468015-1724-31-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
 <1396468015-1724-31-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140402210846.GD3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Maxime, All,

On 2014-04-02 21:46 +0200, Bernd Kuhls spake thusly:
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> A check for Java has been implemented in dependencies.sh, but during the
> review, the name of the variable had been changed from:
> BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA
> as it is more accurate.
> 
> The change was not made in XBMC and as such, you could start the build
> of XBMC without Java on your system.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: rebased http://patchwork.ozlabs.org/patch/335219/ (Maxime)
> 
>  package/xbmc/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> index e078d2f..cf6a6b9 100644
> --- a/package/xbmc/Config.in
> +++ b/package/xbmc/Config.in
> @@ -9,7 +9,7 @@ comment "xbmc requires an OpenGL ES and EGL backend"
>  
>  menuconfig BR2_PACKAGE_XBMC
>  	bool "xbmc"
> -	select BR2_HOST_NEEDS_JAVA
> +	select BR2_NEEDS_HOST_JAVA
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_THREAD
>  	select BR2_PACKAGE_BZIP2
> -- 
> 1.7.10.4
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
