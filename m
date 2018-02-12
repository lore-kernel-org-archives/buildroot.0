From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 12 Feb 2018 16:19:54 -0500
Subject: [Buildroot] [RFC 2/2] qt5webengine: select libnss
In-Reply-To: <20180211161320.8864-3-gael.portay@savoirfairelinux.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-3-gael.portay@savoirfairelinux.com>
Message-ID: <20180212211954.qcnlrisf6trqve2q@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Feb 11, 2018 at 11:13:20AM -0500, Ga?l PORTAY wrote:
> ...
> 
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 387ce0a76e..c231ad2993 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -38,6 +38,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64 # v8/chromium
>  	select BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBNSS if !BR2_PACKAGE_QT5_VERSION_5_6
>  	select BR2_PACKAGE_LIBVPX
>  	select BR2_PACKAGE_OPUS
>  	select BR2_PACKAGE_WEBP
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 31d625d06c..69b7356a51 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -7,7 +7,7 @@
>  QT5WEBENGINE_VERSION = $(QT5_VERSION)
>  QT5WEBENGINE_SITE = $(QT5_SITE)
>  QT5WEBENGINE_SOURCE = $(call qt5source,qtwebengine,$(QT5WEBENGINE_VERSION))
> -QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
> +QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libnss libvpx opus webp qt5base \
>  	qt5declarative qt5webchannel host-bison host-flex host-gperf \
>  	host-pkgconf host-python
>  QT5WEBENGINE_INSTALL_STAGING = YES

In the next version of the patch, I will move the libnss dependency into
a ifneq/endif block, since this depedency is a requirement of the latest
(5.10) version of Qt WebEngine.

> -- 
> 2.15.1
> 

Regards,
Gael
