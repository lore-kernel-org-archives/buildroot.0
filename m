From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 13:30:22 +0100
Subject: [Buildroot] [PATCH v3 2/5] package/qt5/qt5webengine: generate
 chromium-latest.inc automatically
In-Reply-To: <20190217141209.22182-3-thomas.petazzoni@bootlin.com>
References: <20190217141209.22182-1-thomas.petazzoni@bootlin.com>
 <20190217141209.22182-3-thomas.petazzoni@bootlin.com>
Message-ID: <20190223133022.20c1dc05@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Feb 2019 15:12:06 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> As a preparation to the bump of qt5webengine, this commit changes to a
> mechanism where it is generated automatically. We use a fairly
> convoluted 'find' expression to retrieve almost the same list of files
> as the exist ones.
> 
> Two files are removed that are not really license files:
> 
>  - src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/license.py
>  - src/3rdparty/chromium/third_party/WebKit/Source/platform/wtf/NonCopyingSort.h
> 
> Three files are added, which are license files:
> 
>  - src/3rdparty/chromium/third_party/webrtc/LICENSE_THIRD_PARTY
>  - src/3rdparty/chromium/third_party/libxml/src/Copyright
>  - src/3rdparty/chromium/third_party/libxslt/src/Copyright
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
>  package/qt5/qt5webengine/chromium-latest.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
> index 4fc1ae5ecf..9e4b7d6356 100644
> --- a/package/qt5/qt5webengine/chromium-latest.inc
> +++ b/package/qt5/qt5webengine/chromium-latest.inc
> @@ -1,3 +1,8 @@
> +# (echo "QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \\" ; \
> +# 	find src/3rdparty/ -type f \
> +#	\( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) \
> +#	-a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' | \
> +#	sort | sed 's%^\(.*\)$%\t\1 \\%') > package/qt5/qt5webengine/chromium-latest.inc
>  QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
>  	src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE \
> @@ -268,8 +273,10 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/libwebm/source/LICENSE.TXT \
>  	src/3rdparty/chromium/third_party/libwebp/LICENSE \
>  	src/3rdparty/chromium/third_party/libxml/src/COPYING \
> +	src/3rdparty/chromium/third_party/libxml/src/Copyright \
>  	src/3rdparty/chromium/third_party/libXNVCtrl/LICENSE \
>  	src/3rdparty/chromium/third_party/libxslt/linux/COPYING \
> +	src/3rdparty/chromium/third_party/libxslt/src/Copyright \
>  	src/3rdparty/chromium/third_party/libyuv/LICENSE \
>  	src/3rdparty/chromium/third_party/libyuv/LICENSE_THIRD_PARTY \
>  	src/3rdparty/chromium/third_party/lzma_sdk/LICENSE \
> @@ -380,7 +387,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/webdriver/COPYING \
>  	src/3rdparty/chromium/third_party/webdriver/LICENSE \
>  	src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS \
> -	src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/license.py \
>  	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-APPLE \
>  	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2 \
>  	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2.1 \
> @@ -395,7 +401,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/WebKit/Source/devtools/scripts/closure/COPYING \
>  	src/3rdparty/chromium/third_party/WebKit/Source/platform/wtf/dtoa/COPYING \
>  	src/3rdparty/chromium/third_party/WebKit/Source/platform/wtf/dtoa/LICENSE \
> -	src/3rdparty/chromium/third_party/WebKit/Source/platform/wtf/NonCopyingSort.h \
>  	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/mod_pywebsocket/COPYING \
>  	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/LICENSE.md \
>  	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/html5lib/LICENSE \
> @@ -406,6 +411,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
>  	src/3rdparty/chromium/third_party/webrtc/examples/objc/AppRTCMobile/third_party/SocketRocket/LICENSE \
>  	src/3rdparty/chromium/third_party/webrtc/LICENSE \
>  	src/3rdparty/chromium/third_party/webrtc/license_template.txt \
> +	src/3rdparty/chromium/third_party/webrtc/LICENSE_THIRD_PARTY \
>  	src/3rdparty/chromium/third_party/woff2/LICENSE \
>  	src/3rdparty/chromium/third_party/xdg-utils/LICENSE \
>  	src/3rdparty/chromium/third_party/xstream/LICENSE \
