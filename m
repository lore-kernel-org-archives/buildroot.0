From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 09:08:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: needs threads
In-Reply-To: <20210520065826.154984-1-fontaine.fabrice@gmail.com>
References: <20210520065826.154984-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520070859.GS2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-20 08:58 +0200, Fabrice Fontaine spake thusly:
> Build without threads fails because demo apps are not disabled since
> commit 5f154799b6ed772a0c028072996e110fac131508
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9db945ce0709f4116d2c1c7544322144b6e473bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bullet/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bullet/Config.in b/package/bullet/Config.in
> index 1f632b8931..0c420e8212 100644
> --- a/package/bullet/Config.in
> +++ b/package/bullet/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_BULLET
>  	bool "bullet"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
>  	help
>  	  Bullet is a Collision Detection and Rigid Body Dynamics
> @@ -9,6 +10,6 @@ config BR2_PACKAGE_BULLET
>  
>  	  http://bulletphysics.org
>  
> -comment "bullet needs a toolchain w/ C++, dynamic library, wchar"
> +comment "bullet needs a toolchain w/ C++, dynamic library, threads, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> -		!BR2_USE_WCHAR
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
