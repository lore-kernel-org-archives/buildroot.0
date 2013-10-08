From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Oct 2013 18:28:19 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-userland: needs threads
In-Reply-To: <1381221408-15700-1-git-send-email-phil@zankapfel.net>
References: <1381221408-15700-1-git-send-email-phil@zankapfel.net>
Message-ID: <20131008162819.GA3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-10-08 10:36 +0200, Phil Eichinger spake thusly:
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/rpi-userland/Config.in |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> index da5726f..d4e28a1 100644
> --- a/package/rpi-userland/Config.in
> +++ b/package/rpi-userland/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_RPI_USERLAND
>  	depends on BR2_arm
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_HAS_OPENGL_EGL
>  	select BR2_PACKAGE_HAS_OPENGL_ES
>  	select BR2_PACKAGE_HAS_OPENVG
> @@ -16,5 +17,5 @@ config BR2_PACKAGE_RPI_USERLAND
>  
>  	  https://github.com/raspberrypi/userland/
>  
> -comment "rpi-userland requires a toolchain with C++ and LARGEFILE support"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
> +comment "rpi-userland requires a toolchain with C++, LARGEFILE and threads support"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
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
