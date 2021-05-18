From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 15:26:42 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: test_glxinfo: switch
 to Gallium swrast
In-Reply-To: <20210513141149.3154510-1-romain.naour@gmail.com>
References: <20210513141149.3154510-1-romain.naour@gmail.com>
Message-ID: <20210518132642.GM2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-13 16:11 +0200, Romain Naour spake thusly:
> Since the mesa3d bump to version 21.0.3 [1], the
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST option is not supported anymore
> since the mesa DRI swrast driver has been removed upstream
> 
> So, switch to Gallium swrast.
> 
> [1]15a2f9b819806d38a7d8172a20f80130b1d60e63
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_glxinfo.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
> index f37236d161..44ac92347a 100644
> --- a/support/testing/tests/package/test_glxinfo.py
> +++ b/support/testing/tests/package/test_glxinfo.py
> @@ -25,7 +25,7 @@ class TestGlxinfo(infra.basetest.BRTest):
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>          BR2_PACKAGE_MESA3D_DEMOS=y
>          BR2_PACKAGE_MESA3D=y
> -        BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
>          BR2_PACKAGE_MESA3D_OPENGL_GLX=y
>          BR2_PACKAGE_XORG7=y
>          BR2_PACKAGE_XSERVER_XORG_SERVER=y
> -- 
> 2.31.1
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
