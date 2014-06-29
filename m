From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Jun 2014 20:57:03 +0200
Subject: [Buildroot] [PATCH] blackbox: deprecate package due to dead
 upstream
In-Reply-To: <1404057878-28939-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404057878-28939-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140629185703.GA30509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-29 18:04 +0200, Thomas Petazzoni spake thusly:
> There has been no Blackbox release since 2005, which indicates that
> the upstream project is dead. Since there are many other maintained
> and alive window manager projects around, I'd like to nominate
> Blackbox for deprecation.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/blackbox/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
> index e908655..8b61c73 100644
> --- a/package/blackbox/Config.in
> +++ b/package/blackbox/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_BLACKBOX
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_MMU # fork()
> +	# upstream dead since 2005
> +	depends on BR2_DEPRECATED_SINCE_2014_08
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	help
> -- 
> 2.0.0
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
