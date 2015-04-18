From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 18 Apr 2015 15:49:55 +0200
Subject: [Buildroot] [PATCH 01/32] package/x11r7/xcb-util-renderutil:
 new package
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <55326103.6050807@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 18/04/2015 14:40, Bernd Kuhls a ?crit :
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/Config.in                                 |    1 +
>  package/x11r7/xcb-util-renderutil/Config.in             |   15 +++++++++++++++
>  .../x11r7/xcb-util-renderutil/xcb-util-renderutil.hash  |    2 ++
>  .../x11r7/xcb-util-renderutil/xcb-util-renderutil.mk    |   15 +++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/x11r7/xcb-util-renderutil/Config.in
>  create mode 100644 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
>  create mode 100644 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
> 
> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> index 608837f..4166a96 100644
> --- a/package/x11r7/Config.in
> +++ b/package/x11r7/Config.in
> @@ -19,6 +19,7 @@ if BR2_PACKAGE_XORG7
>  		source package/x11r7/xcb-util/Config.in
>  		source package/x11r7/xcb-util-image/Config.in
>  		source package/x11r7/xcb-util-keysyms/Config.in
> +		source package/x11r7/xcb-util-renderutil/Config.in
>  		source package/x11r7/xcb-util-wm/Config.in
>  		source package/x11r7/xlib_libFS/Config.in
>  		source package/x11r7/xlib_libICE/Config.in
> diff --git a/package/x11r7/xcb-util-renderutil/Config.in b/package/x11r7/xcb-util-renderutil/Config.in
> new file mode 100644
> index 0000000..9675278
> --- /dev/null
> +++ b/package/x11r7/xcb-util-renderutil/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_XCB_UTIL_RENDERUTIL
> +	bool "xcb-util-renderutil"
> +	select BR2_PACKAGE_XCB_UTIL
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
> +
> +	  http://xcb.freedesktop.org/
> diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
> new file mode 100644
> index 0000000..e5c47ca
> --- /dev/null
> +++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
> @@ -0,0 +1,2 @@
> +# From http://lists.x.org/archives/xorg-announce/2015-March/002555.html
> +sha1	b55a92cd96c3ec1be9a26963df6d5f16e68fffea	xcb-util-cursor-0.1.2.tar.bz2

Should be:
# from http://permalink.gmane.org/gmane.comp.freedesktop.xorg.announce/2176
sha256 c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b
xcb-util-renderutil-0.3.9.tar.bz2

Otherwise, looks good.
I added the same package locally for updating the efl package to 1.14.0-beta1
release.

Best regards,
Romain

> diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
> new file mode 100644
> index 0000000..9e6683b
> --- /dev/null
> +++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# xcb-util-renderutil
> +#
> +################################################################################
> +
> +XCB_UTIL_RENDERUTIL_VERSION = 0.3.9
> +XCB_UTIL_RENDERUTIL_SITE = http://xcb.freedesktop.org/dist
> +XCB_UTIL_RENDERUTIL_SOURCE = xcb-util-renderutil-$(XCB_UTIL_RENDERUTIL_VERSION).tar.bz2
> +XCB_UTIL_RENDERUTIL_LICENSE = MIT
> +XCB_UTIL_RENDERUTIL_LICENSE_FILES = COPYING
> +XCB_UTIL_RENDERUTIL_INSTALL_STAGING = YES
> +XCB_UTIL_RENDERUTIL_DEPENDENCIES = xcb-util
> +
> +$(eval $(autotools-package))
> 
