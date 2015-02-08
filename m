From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 12:00:54 +0100
Subject: [Buildroot] [PATCH] qt5/qt5base: Fix build on big endian systems
In-Reply-To: <1423233617-33387-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423233617-33387-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150208110054.GC4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-02-06 14:40 +0000, Vicente Olivert Riera spake thusly:
> Backporting an upstream patch to fix a qt5base build failure fails to on
> big endian systems. This is the error message:
> 
> image/qimage_conversions.cpp:2257:9: error: expected '}' before numeric
> constant
> 
> Upstream commit:
> 
>   https://qt.gitorious.org/qt/qtbase/commit/404f4281fda764cafdaa5635db995dabc4f1de8c
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...ersions.cpp-Fix-build-on-big-endian-syste.patch |   51 ++++++++++++++++++++
>  1 files changed, 51 insertions(+), 0 deletions(-)
>  create mode 100644 package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
> 
> diff --git a/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch b/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
> new file mode 100644
> index 0000000..1e493ca
> --- /dev/null
> +++ b/package/qt5/qt5base/0004-qimage_conversions.cpp-Fix-build-on-big-endian-syste.patch
> @@ -0,0 +1,51 @@
> +qimage_conversions.cpp: Fix build on big endian systems
> +
> +Backporting an upstream patch to fix a qt5base build failure fails to on
> +big endian systems. This is the error message:
> +
> +image/qimage_conversions.cpp:2257:9: error: expected '}' before numeric 
> +constant
> +
> +Upstream commit:
> +
> +  https://qt.gitorious.org/qt/qtbase/commit/404f4281fda764cafdaa5635db995dabc4f1de8c
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +
> +From 404f4281fda764cafdaa5635db995dabc4f1de8c Mon Sep 17 00:00:00 2001
> +From: Dmitry Shachnev <mitya57@gmail.com>
> +Date: Tue, 9 Dec 2014 09:27:53 +0300
> +Subject: [PATCH] qimage_conversions.cpp: Fix build on big endian systems
> +
> +Change-Id: I8149eb2deaa101daf85a957ff48c3a7140c43bbc
> +Reviewed-by: Timo Jyrinki <timo.jyrinki@canonical.com>
> +Reviewed-by: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
> +---
> + src/gui/image/qimage_conversions.cpp |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/gui/image/qimage_conversions.cpp b/src/gui/image/qimage_conversions.cpp
> +index 17563b1..858a0d9 100644
> +--- a/src/gui/image/qimage_conversions.cpp
> ++++ b/src/gui/image/qimage_conversions.cpp
> +@@ -2252,7 +2252,7 @@ Image_Converter qimage_converter_map[QImage::NImageFormats][QImage::NImageFormat
> +         convert_ARGB_to_ARGB_PM,
> + #else
> +         0,
> +-        0
> ++        0,
> + #endif
> +         0, 0, 0, 0
> +     }, // Format_RGBA8888
> +@@ -2281,7 +2281,7 @@ Image_Converter qimage_converter_map[QImage::NImageFormats][QImage::NImageFormat
> + #else
> +         0,
> +         0,
> +-        0
> ++        0,
> + #endif
> +         0, 0, 0, 0
> +     }, // Format_RGBA8888_Premultiplied
> +-- 
> +1.7.1
> +
> -- 
> 1.7.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
