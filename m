From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 21:50:19 +0200
Subject: [Buildroot] [PATCH 1/1] packages/x11r7/libepoxy - fix
 compilation issue
In-Reply-To: <1438544742-3372-1-git-send-email-brendanheading@gmail.com>
References: <1438544742-3372-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150802195019.GI3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan, All,

On 2015-08-02 20:45 +0100, Brendan Heading spake thusly:
> Fixes http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e/
> 
> libepoxy expects to find EGL/eglplatform.h which is provided by
> mesa3d when --enable-egl is passed.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  package/x11r7/libepoxy/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
> index c4f5794..eb6fa85 100644
> --- a/package/x11r7/libepoxy/Config.in
> +++ b/package/x11r7/libepoxy/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "epoxy"
>  	depends on BR2_PACKAGE_MESA3D
> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL

Nope, becasue mesa3d is not the only EGL provider.

Instead, there's a patch pending, from Bernd, that addresses the same
issue:
    https://patchwork.ozlabs.org/patch/502831/

I'll mark your patch as Rejected on Patchwork.

Regards,
Yann E. MORIN.

>  	help
>  	  Epoxy is a library for handling OpenGL function pointer management for you.
>  
> -- 
> 2.4.3
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
