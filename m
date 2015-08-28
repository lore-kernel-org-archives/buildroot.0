From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:47:44 +0200
Subject: [Buildroot] [PATCH v2/next 1/1] package/x11r7/libepoxy: bump to
 version 1.3.1
In-Reply-To: <1439037798-30471-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439037798-30471-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150828194744.3d957ed0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  8 Aug 2015 14:43:17 +0200, Bernd Kuhls wrote:
> Removed call to pkgconf because epoxy configure now uses pkgconf
> itself to find egl headers:
> https://github.com/anholt/libepoxy/commit/d56f21c494b315306215c4730835a9b291360e9b
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Removed pkgconf to find rpi headers
> 
>  package/x11r7/libepoxy/libepoxy.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
> index 58b094a..12ddd03 100644
> --- a/package/x11r7/libepoxy/libepoxy.mk
> +++ b/package/x11r7/libepoxy/libepoxy.mk
> @@ -4,17 +4,13 @@
>  #
>  ################################################################################
>  
> -LIBEPOXY_VERSION = v1.2
> +LIBEPOXY_VERSION = v1.3.1
>  LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
>  LIBEPOXY_INSTALL_STAGING = YES
>  LIBEPOXY_AUTORECONF = YES
>  LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
> -	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
> +	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) host-pkgconf
>  LIBEPOXY_LICENSE = MIT
>  LIBEPOXY_LICENSE_FILES = COPYING
>  
> -# needed for rpi-userland
> -LIBEPOXY_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
> -LIBEPOXY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(LIBEPOXY_CFLAGS)"
> -
>  $(eval $(autotools-package))

This patch currently doesn't apply on next, because next has been
branched before your other libepoxy fixes have been merged. So I will
wait for next to be merged back in master before applying this patch.
This should happen soon, since we're approaching the end of August.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
