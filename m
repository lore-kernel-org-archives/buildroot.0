From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 14:59:01 +0200
Subject: [Buildroot] [PATCH 28/32] package/x11r7/xlib_libXpresent: new
 package
In-Reply-To: <1429360844-12625-28-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
 <1429360844-12625-28-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150418145901.7849d444@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 18 Apr 2015 14:40:40 +0200, Bernd Kuhls wrote:

> diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
> new file mode 100644
> index 0000000..f9cad60
> --- /dev/null
> +++ b/package/x11r7/xlib_libXpresent/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_XLIB_LIBXPRESENT
> +	bool "libXpresent"
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXFIXES
> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	select BR2_PACKAGE_XPROTO_PRESENTPROTO
> +	select BR2_PACKAGE_XPROTO_XPROTO
> +	help
> +	  X Present Extension C Library
> +	  This package contains header files and documentation for the Present
> +	  extension.  Library and server implementations are separate.

This seems weird. The package is named "xlib_libXpresent", but it does
not contain the library? This description looks more like a xproto*
description than a xlib* description.

> +$(eval $(host-autotools-package))

Why is a host package needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
