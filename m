From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Thu, 10 Jul 2014 09:17:50 +0300
Subject: [Buildroot] [PATCH 1/1] New package: qt5webkit-examples
In-Reply-To: <1404915318.71876.YahooMailNeo@web172306.mail.ir2.yahoo.com>
References: <1404915318.71876.YahooMailNeo@web172306.mail.ir2.yahoo.com>
Message-ID: <201407100917.50185.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Massimo,

On Wednesday 09 July 2014 17:15:18 Massimo Callegari wrote:
> Amend the previous. There were minor things missing
> 
> Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>

You should include a changelog in the new revisions of your patches as 
described in here:

  http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

> ---
>  package/qt5/Config.in                              |  1 +
>  package/qt5/qt5webkit-examples/Config.in           | 10 +++++
>  .../qt5webkit-examples-0001-build.patch            | 21 ++++++++++
>  .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 46
> ++++++++++++++++++++++ 4 files changed, 78 insertions(+)
>  create mode 100644 package/qt5/qt5webkit-examples/Config.in
>  create mode 100644
> package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch create
> mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index efdd9d4..1f6920a 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -40,6 +40,7 @@ source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5webkit/Config.in"
> +source "package/qt5/qt5webkit-examples/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
>  source "package/qt5/qt5xmlpatterns/Config.in"
> diff --git a/package/qt5/qt5webkit-examples/Config.in
> b/package/qt5/qt5webkit-examples/Config.in new file mode 100644
> index 0000000..2840733
> --- /dev/null
> +++ b/package/qt5/qt5webkit-examples/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
> +bool "qt5webkit examples"
> +depends on BR2_PACKAGE_QT5WEBKIT
> +help
> +  Qt is a cross-platform application and UI framework for
> +  developers using C++.
> +
> +  This package corresponds to the qt5webkit examples module.

What about this:

  This package contains examples for the qt5webkit module.

> +
> +  http://qt-project.org
> diff --git
> a/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
> b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch new

Each patch must include a "Signed-off-by" line:

  http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches


> file mode 100644
> index 0000000..505f40c
> --- /dev/null
> +++ b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
> @@ -0,0 +1,21 @@
> +diff -Naur a/examples/webkitwidgets/webkitwidgets.pro
> b/examples/webkitwidgets/webkitwidgets.pro +---
> a/examples/webkitwidgets/webkitwidgets.pro2014-06-19 12:08:33.000000000
> +0200 ++++ b/examples/webkitwidgets/webkitwidgets.pro2014-07-09
> 14:14:20.247975538 +0200 +@@ -8,5 +8,6 @@
> +             framecapture \
> +             browser \
> +             embedded \
> +-            scroller \
> +-            xmlpatterns
> ++            scroller
> ++            
> ++qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
> +diff -Naur a/qtwebkit-examples.pro b/qtwebkit-examples.pro
> +--- a/qtwebkit-examples.pro2014-06-19 12:08:33.000000000 +0200
> ++++ b/qtwebkit-examples.pro2014-07-09 14:14:09.095975663 +0200
> +@@ -3,3 +3,4 @@
> + load(qt_parts)
> + 
> + SUBDIRS += doc
> ++SUBDIRS += examples
> +
> diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk new file mode
> 100644
> index 0000000..fd66941
> --- /dev/null
> +++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> @@ -0,0 +1,46 @@
> +##########################################################################
> ###### +#
> +# qt5webkitexamples

Nit pick: s/qt5webkitexamples/qt5webkit-examples/

> +#
> +##########################################################################
> ###### +
> +QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
> +QT5WEBKIT_EXAMPLES_SITE = $(QT5_SITE)
> +QT5WEBKIT_EXAMPLES_SOURCE =
> qtwebkit-examples-opensource-src-$(QT5WEBKIT_EXAMPLES_VERSION).tar.xz
> +QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit

If qt5xmlpatterns package is selected, you must add it to _DEPENDENCIES.
