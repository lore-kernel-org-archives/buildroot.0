From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:06:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xcb-util-renderutil:
 new package
In-Reply-To: <1429365938-12638-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429365938-12638-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150418180647.6e2207db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 18 Apr 2015 16:05:38 +0200, Bernd Kuhls wrote:

> diff --git a/package/x11r7/xcb-util-renderutil/Config.in b/package/x11r7/xcb-util-renderutil/Config.in
> new file mode 100644
> index 0000000..9675278
> --- /dev/null
> +++ b/package/x11r7/xcb-util-renderutil/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_XCB_UTIL_RENDERUTIL
> +	bool "xcb-util-renderutil"
> +	select BR2_PACKAGE_XCB_UTIL

When you "select" something, make sure to propagate the dependencies,
in this case, I added 'depends on BR2_PACKAGE_LIBXCB'. Some warnings
are also displayed by make menuconfig in such situations, make sure to
pay attention to such warnings.

> +	help
> +	  The XCB util modules provides a number of libraries which sit on top
> +	  of libxcb, the core X protocol library, and some of the extension
> +	  libraries. These experimental libraries provide convenience functions
> +	  and interfaces which make the raw X protocol more usable. Some of the
> +	  libraries also provide client-side code which is not strictly part of
> +	  the X protocol but which have traditionally been provided by Xlib.
> +
> +	  XCB util-renderutil module provides the following library:
> +	    - renderutil: Convenience functions for the Render extension.

Lines are slightly too long, so I rewrapped them.

Applied with those two issues fixed. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
