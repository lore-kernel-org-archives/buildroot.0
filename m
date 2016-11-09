From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 09 Nov 2016 14:31:06 +0100
Subject: [Buildroot] [PATCH] qt5webkit: Get sources from
	Qt-5-unofficial-builds
In-Reply-To: <1478695085-4210-1-git-send-email-abrodkin@synopsys.com>
References: <1478695085-4210-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <6163885.zDEeHnFoFK@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

On Wednesday 09 November 2016 15:38:05 Alexey Brodkin wrote:
[...]
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -1,6 +1,7 @@
>  QT5_VERSION_MAJOR = 5.6
>  QT5_VERSION = $(QT5_VERSION_MAJOR).2
>  QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> +QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules

Is it possible to also use snapshots site for official modules?

[...]
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -4,10 +4,9 @@
>  #
>  ################################################################################
>  
> -QT5WEBKIT_VERSION = b35917bcb44d7f200af0f4ac68a126fa0aa8d93d
> -# Using GitHub since it supports downloading tarballs from random commits.
> -# The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
> -QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
> +QT5WEBKIT_VERSION = $(QT5_VERSION)
> +QT5WEBKIT_SITE = $(QT5_SNAPSHOTS_SITE)
> +QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_EXAMPLES_VERSION).tar.xz
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
You mean QT5WEBKIT_VERSION?

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
