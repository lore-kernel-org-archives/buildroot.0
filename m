From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 5 Jun 2020 09:13:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/libhttpserver: disable examples
In-Reply-To: <20200604213522.12291-1-fontaine.fabrice@gmail.com>
References: <20200604213522.12291-1-fontaine.fabrice@gmail.com>
Message-ID: <25cb34de-5785-233b-94a9-91db52dc0295@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.06.20 um 23:35 schrieb Fabrice Fontaine:
> examples are enabled by default since version 0.17.5 and
> https://github.com/etr/libhttpserver/commit/012d014a7c52ef91a35c521d5d4f83ee11de5068
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  package/libhttpserver/libhttpserver.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
> index 1fd76519f4..2c536cf012 100644
> --- a/package/libhttpserver/libhttpserver.mk
> +++ b/package/libhttpserver/libhttpserver.mk
> @@ -9,7 +9,9 @@ LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
>  LIBHTTPSERVER_LICENSE = LGPL-2.1+
>  LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
>  LIBHTTPSERVER_INSTALL_STAGING = YES
> -LIBHTTPSERVER_CONF_OPTS = --enable-same-directory-build
> +LIBHTTPSERVER_CONF_OPTS = \
> +	--disable-examples \
> +	--enable-same-directory-build
>  LIBHTTPSERVER_AUTORECONF = YES
>  LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
>  


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de Stephan at reLinux.de
