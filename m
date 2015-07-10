From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 11:19:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/libepoxy: Fix OpenGL /
 EGL dependencies
In-Reply-To: <1430943308-13319-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430943308-13319-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150710111952.5787d499@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed,  6 May 2015 22:15:08 +0200, Bernd Kuhls wrote:

> diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
> index c4f5794..1b1ca3f 100644
> --- a/package/x11r7/libepoxy/Config.in
> +++ b/package/x11r7/libepoxy/Config.in
> @@ -1,7 +1,13 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "epoxy"
> -	depends on BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XUTIL_UTIL_MACROS

This doesn't make a lot of sense to me. Either you use EGL and you
don't X, or you have X and you don't EGL.

Can you explain a bit more what's going on here?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
