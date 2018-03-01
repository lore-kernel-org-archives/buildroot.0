From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Mar 2018 23:07:14 +0100
Subject: [Buildroot] [PATCH] qt: mark as obsolete
In-Reply-To: <20180301215606.3788-1-peter@korsgaard.com>
References: <20180301215606.3788-1-peter@korsgaard.com>
Message-ID: <20180301220714.GE2449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-03-01 22:56 +0100, Peter Korsgaard spake thusly:
> qt 4.x is no longer supported upstream since December 2015:
> 
> https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
> 
> So it shouldn't be used for new projects.  Add an obsolete warning to the
> package prompt to make this clear.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Once we eventually ger tid of it, we will be able to greatly simplify
the dependencies that ensure that qt qnd qt5 are mutually exclusive.

In the future... ;-)

Regards,
Yann E. MORIN.

> ---
>  package/qt/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 4804a81537..0ecfafada5 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -3,7 +3,7 @@ comment "qt needs a toolchain w/ C++, threads"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  menuconfig BR2_PACKAGE_QT
> -	bool "Qt"
> +	bool "Qt (obsolete)"
>  	depends on BR2_USE_MMU # fork
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.11.0
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
