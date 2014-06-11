From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 19:52:36 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/mesa3d: depend on udev
In-Reply-To: <1402508508-437-4-git-send-email-bernd.kuhls@t-online.de>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
 <1402508508-437-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140611175236.GC3472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-11 19:41 +0200, Bernd Kuhls spake thusly:
> checking for LIBUDEV... no
> configure: error: libudev-dev required for building DRI
> 
> Fixes
> http://autobuild.buildroot.net/results/16d/16d12b986051db884eae86e9658e6c4fc0f28885/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This is a stop-gap fix until we have a proper libudev package.
This shoudl be independent from the previous patches, so can go in
as-is:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/Config.in |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index fc96cc5..d3ded82 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -10,6 +10,7 @@ menuconfig BR2_PACKAGE_MESA3D
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> @@ -125,6 +126,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
>  
>  endif # BR2_PACKAGE_MESA3D
>  
> -comment "mesa3d needs a toolchain w/ C++, largefile, NPTL"
> +comment "mesa3d needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
>  	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
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
