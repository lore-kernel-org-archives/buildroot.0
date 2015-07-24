From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 24 Jul 2015 09:01:14 +0200
Subject: [Buildroot] [PATCH v2] qt/qt5base: Fix INCLUDE_PATH when no
 JPEG/PNG support
In-Reply-To: <1437717100-13749-1-git-send-email-corjon.j@ecagroup.com>
References: <1437717100-13749-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <CAGm1_kutYYKVCHqpV=hBzYggRfbLDBzYUtDVEAgmdmcn1Ewf6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 24, 2015 at 7:51 AM, Julien Corjon <corjon.j@ecagroup.com> wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/4be77432390c4cfb557c3f2cc52cf732de037949/
>   http://autobuild.buildroot.net/results/255a77e01d8af4090e03acb82f9ad93b7c4dd212/
>   http://autobuild.buildroot.net/results/7844e6a3eeecf67dc29277b73bfe714e4d8f0d85/
>   http://autobuild.buildroot.net/results/b941f35b6c8e1cf3b2c4b046dfcce98700d8f408/
>   http://autobuild.buildroot.net/results/c64b640a39285f59cde47cb8d06ab70a5ac97c8b/
>   http://autobuild.buildroot.net/results/f6d24b50f58251c8051d39bc1d09b5b43f81f441/
>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> v1 -> v2 :
>   - Add autobuild references (suggested by thomas)
>
>  ...008-QtGui-force-image-dir-in-include_path.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
>
> diff --git a/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
> new file mode 100644
> index 0000000..4e5068b
> --- /dev/null
> +++ b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
> @@ -0,0 +1,33 @@
> +From 6065be41dbd04690236418098fca504140fc205c Mon Sep 17 00:00:00 2001
> +From: Julien Corjon <corjon.j@ecagroup.com>
> +Date: Thu, 23 Jul 2015 13:32:47 +0200
> +Subject: [PATCH 1/1] QtGui: force image directory in INCLUDE_PATH
> +
> +If PNG/JPEG/GIF support is not set qplaformpixmap inclusion then
> +image/qplatformpixmap.h cannot be found from painting/qbrush.cpp
> +
> +Change-Id: I165c888b2afc51de47267607883615d3aa3bae40
> +
> +Upstream-Status: https://bugreports.qt.io/browse/QTBUG-47400
> +
> +Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> +---
> + src/gui/image/image.pri | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/gui/image/image.pri b/src/gui/image/image.pri
> +index 8db944e..af6e0fa 100644
> +--- a/src/gui/image/image.pri
> ++++ b/src/gui/image/image.pri
> +@@ -3,6 +3,8 @@
> +
> + # Qt kernel module
> +
> ++INCLUDEPATH *= $$PWD
> ++
> + HEADERS += \
> +         image/qbitmap.h \
> +         image/qimage.h \
> +--
> +2.1.0
> +
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
