From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 13:30:55 +0100
Subject: [Buildroot] [PATCH v3 3/5] package/qt5/qt5webengine: generate
 chromium-lts.inc automatically
In-Reply-To: <20190217141209.22182-4-thomas.petazzoni@bootlin.com>
References: <20190217141209.22182-1-thomas.petazzoni@bootlin.com>
 <20190217141209.22182-4-thomas.petazzoni@bootlin.com>
Message-ID: <20190223133055.74ff4402@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Feb 2019 15:12:07 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> As a preparation to the bump of qt5webengine, this commit changes to a
> mechanism where it is generated automatically. We use a fairly
> convoluted 'find' expression to retrieve almost the same list of files
> as the exist ones.
> 
> The following files are added:
> 
>  - src/3rdparty/chromium/third_party/libxml/src/Copyright. This is the
>    file that was pointed to by the
>    src/3rdparty/chromium/third_party/libxslt/linux/COPYING symlink.
> 
>  - src/3rdparty/chromium/third_party/libxml/src/Copyright
> 
> Two license.py scripts that are not license files are removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
>  package/qt5/qt5webengine/chromium-lts.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt5/qt5webengine/chromium-lts.inc b/package/qt5/qt5webengine/chromium-lts.inc
> index 6d27f1a827..fbc1f9b639 100644
> --- a/package/qt5/qt5webengine/chromium-lts.inc
> +++ b/package/qt5/qt5webengine/chromium-lts.inc
> @@ -1,3 +1,9 @@
> +# Generated with:
> +# (echo "QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \\" ; \
> +# 	find src/3rdparty/ -type f \
> +#	     \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \)\
> +#	     -a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' | \
> +#	     sort | sed 's%^\(.*\)$%\t\1 \\%') > package/qt5/qt5webengine/chromium-lts.inc
>  QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
>  	src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE \
> @@ -112,8 +118,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/libvpx_new/source/libvpx/third_party/x86inc/LICENSE \
>  	src/3rdparty/chromium/third_party/libwebm/source/LICENSE.TXT \
>  	src/3rdparty/chromium/third_party/libwebp/LICENSE \
> +	src/3rdparty/chromium/third_party/libxml/src/Copyright \
>  	src/3rdparty/chromium/third_party/libXNVCtrl/LICENSE \
> -	src/3rdparty/chromium/third_party/libxslt/linux/COPYING \
> +	src/3rdparty/chromium/third_party/libxslt/Copyright \
>  	src/3rdparty/chromium/third_party/libyuv/LICENSE \
>  	src/3rdparty/chromium/third_party/libyuv/LICENSE_THIRD_PARTY \
>  	src/3rdparty/chromium/third_party/libyuv/third_party/gflags/LICENSE \
> @@ -124,7 +131,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/mesa/src/docs/COPYING \
>  	src/3rdparty/chromium/third_party/mesa/src/docs/license.html \
>  	src/3rdparty/chromium/third_party/mesa/src/src/gallium/drivers/radeon/LICENSE.TXT \
> -	src/3rdparty/chromium/third_party/mesa/src/src/mapi/glapi/gen/license.py \
>  	src/3rdparty/chromium/third_party/minigbm/LICENSE \
>  	src/3rdparty/chromium/third_party/mocha/LICENSE \
>  	src/3rdparty/chromium/third_party/mockito/LICENSE \
> @@ -206,7 +212,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/webdriver/LICENSE \
>  	src/3rdparty/chromium/third_party/WebKit/LICENSE \
>  	src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS \
> -	src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/license.py \
>  	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-APPLE \
>  	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2 \
>  	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2.1 \
