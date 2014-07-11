From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 11 Jul 2014 12:27:33 +0300
Subject: [Buildroot] [PATCH 1/1] New package: qt5webkit-examples
In-Reply-To: <1404980939.30074.YahooMailNeo@web172304.mail.ir2.yahoo.com>
References: <1404915318.71876.YahooMailNeo@web172306.mail.ir2.yahoo.com>
 <201407100917.50185.fatih.asici@gmail.com>
 <1404980939.30074.YahooMailNeo@web172304.mail.ir2.yahoo.com>
Message-ID: <201407111227.33554.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 10 July 2014 11:28:59 Massimo Callegari wrote:
> Hi,

Hi,

> going to submit a new patch.
> Please guys, don't be too picky. I don't have much time to decorate this
> patch with flowers and unicorns. I do it while I work so please bare with
> me. If you don't like something I guess it's faster if you change it
> yourself. I don't care about the ownership of this change.

I'll submit your patch with some additional fixes.

> 
> Massimo
> 
> >________________________________
> >
> > Da: Fatih A??c? <fatih.asici@gmail.com>
> >
> >A: Massimo Callegari <massimocallegari@yahoo.it>
> >Cc: buildroot at busybox.net
> >Inviato: Gioved? 10 Luglio 2014 8:17
> >Oggetto: Re: [Buildroot] [PATCH 1/1] New package: qt5webkit-examples
> >
> >
> >Hi Massimo,
> >
> >On Wednesday 09 July 2014 17:15:18 Massimo Callegari wrote:
> >> Amend the previous. There were minor things missing
> >> 
> >> Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
> >
> >You should include a changelog in the new revisions of your patches as
> >described in here:
> >
> > 
> >http://buildroot.org/downloads/manual/manual.html#_patch_revision_changel
> >og
> >
> >Since the previous patch wasn't reviewed, I guessed it was not necessary.
> >
> >> ---
> >>
> >>  package/qt5/Config.in                              |  1 +
> >>  package/qt5/qt5webkit-examples/Config.in           | 10 +++++
> >>  .../qt5webkit-examples-0001-build.patch            | 21 ++++++++++
> >>  .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 46
> >>
> >> ++++++++++++++++++++++ 4 files changed, 78 insertions(+)
> >>
> >>  create mode 100644 package/qt5/qt5webkit-examples/Config.in
> >>  create mode 100644
> >>
> >> package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
> >> create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> >> 
> >> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> >> index efdd9d4..1f6920a 100644
> >> --- a/package/qt5/Config.in
> >> +++ b/package/qt5/Config.in
> >> @@ -40,6 +40,7 @@ source "package/qt5/qt5sensors/Config.in"
> >>
> >>  source "package/qt5/qt5serialport/Config.in"
> >>  source "package/qt5/qt5svg/Config.in"
> >>  source "package/qt5/qt5webkit/Config.in"
> >>
> >> +source "package/qt5/qt5webkit-examples/Config.in"
> >>
> >>  source "package/qt5/qt5websockets/Config.in"
> >>  source "package/qt5/qt5x11extras/Config.in"
> >>  source "package/qt5/qt5xmlpatterns/Config.in"
> >>
> >> diff --git a/package/qt5/qt5webkit-examples/Config.in
> >> b/package/qt5/qt5webkit-examples/Config.in new file mode 100644
> >> index 0000000..2840733
> >> --- /dev/null
> >> +++ b/package/qt5/qt5webkit-examples/Config.in
> >> @@ -0,0 +1,10 @@
> >> +config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
> >> +bool "qt5webkit examples"
> >> +depends on BR2_PACKAGE_QT5WEBKIT
> >> +help
> >> +  Qt is a cross-platform application and UI framework for
> >> +  developers using C++.
> >> +
> >> +  This package corresponds to the qt5webkit examples module.
> >
> >What about this:
> >
> >  This package contains examples for the qt5webkit module.
> >
> >
> >
> >No, it is exactly what is described. The original package name is
> > qtwebkit-examples-opensource-src-5.3.1

This package does not include a new qt module. It contains just examples. It 
will be better to mention it in help text.

> >> +
> >> +  http://qt-project.org
> >> diff --git
> >> a/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
> >> b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch new
> >
> >Each patch must include a "Signed-off-by" line:
> >
> > 
> >http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_o
> >f_the_package_patches
> >
> >OK
> >
> >> file mode 100644
> >> index 0000000..505f40c
> >> --- /dev/null
> >> +++ b/package/qt5/qt5webkit-examples/qt5webkit-examples-0001-build.patch
> >> @@ -0,0 +1,21 @@
> >> +diff -Naur a/examples/webkitwidgets/webkitwidgets.pro
> >> b/examples/webkitwidgets/webkitwidgets.pro +---
> >> a/examples/webkitwidgets/webkitwidgets.pro2014-06-19 12:08:33.000000000
> >> +0200 ++++ b/examples/webkitwidgets/webkitwidgets.pro2014-07-09
> >> 14:14:20.247975538 +0200 +@@ -8,5 +8,6 @@
> >> +             framecapture \
> >> +             browser \
> >> +             embedded \
> >> +-            scroller \
> >> +-            xmlpatterns
> >> ++            scroller
> >> ++           
> >> ++qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
> >> +diff -Naur a/qtwebkit-examples.pro b/qtwebkit-examples.pro
> >> +--- a/qtwebkit-examples.pro2014-06-19 12:08:33.000000000 +0200
> >> ++++ b/qtwebkit-examples.pro2014-07-09 14:14:09.095975663 +0200
> >> +@@ -3,3 +3,4 @@
> >> + load(qt_parts)
> >> +
> >> + SUBDIRS += doc
> >> ++SUBDIRS += examples
> >> +
> >> diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> >> b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk new file mode
> >> 100644
> >> index 0000000..fd66941
> >> --- /dev/null
> >> +++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> >> @@ -0,0 +1,46 @@
> >> +#######################################################################
> >> ### ###### +#
> >> +# qt5webkitexamples
> >
> >Nit pick: s/qt5webkitexamples/qt5webkit-examples/
> >
> >Don't understand

I wanted to point out the missing dash in package name.

> >> +#
> >> +#######################################################################
> >> ### ###### +
> >> +QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
> >> +QT5WEBKIT_EXAMPLES_SITE = $(QT5_SITE)
> >> +QT5WEBKIT_EXAMPLES_SOURCE =
> >> qtwebkit-examples-opensource-src-$(QT5WEBKIT_EXAMPLES_VERSION).tar.xz
> >> +QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit
> >
> >If qt5xmlpatterns package is selected, you must add it to _DEPENDENCIES.
> >
> >
> >
> >qt5xmlpatterns is no more a dependency

It is optional; but if you do not add that dependency, there might be cases 
that qt5webkit-examples is built before qt5xmlpatterns. So the result is 
unpredictable. To ensure that qt5xmlpatterns is built before this package, we 
add it to _DEPENDENCIES list like this:

ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)                                             
QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns                                  
endif                                                                              


Thanks,
Fatih
