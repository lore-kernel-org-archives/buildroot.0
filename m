From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Wed, 9 Nov 2016 16:55:22 +0300
Subject: [Buildroot] [PATCH] qt5webkit: Get sources from
	Qt-5-unofficial-builds
In-Reply-To: <6163885.zDEeHnFoFK@sagittea>
References: <1478695085-4210-1-git-send-email-abrodkin@synopsys.com>
 <6163885.zDEeHnFoFK@sagittea>
Message-ID: <CAML3pwVNhmeEXRYxBSpuN4zyzzF6+jcqZ7UCJZ9YbEynMCU6RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

2016-11-09 16:31 GMT+03:00 J?r?me Pouiller <jezz@sysmic.org>:
>
> Hello Alexey,
>
> On Wednesday 09 November 2016 15:38:05 Alexey Brodkin wrote:
> [...]
> > --- a/package/qt5/qt5.mk
> > +++ b/package/qt5/qt5.mk
> > @@ -1,6 +1,7 @@
> >  QT5_VERSION_MAJOR = 5.6
> >  QT5_VERSION = $(QT5_VERSION_MAJOR).2
> >  QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> > +QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
>
> Is it possible to also use snapshots site for official modules?

I think it's possible, see
http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/
But I'd prefer to stick to official release paths for officially
supported submodules.
Just in case "snapshots" stuff gets purged at some point in time.

> [...]
> > --- a/package/qt5/qt5webkit/qt5webkit.mk
> > +++ b/package/qt5/qt5webkit/qt5webkit.mk
> > @@ -4,10 +4,9 @@
> >  #
> >  ################################################################################
> >
> > -QT5WEBKIT_VERSION = b35917bcb44d7f200af0f4ac68a126fa0aa8d93d
> > -# Using GitHub since it supports downloading tarballs from random commits.
> > -# The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
> > -QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
> > +QT5WEBKIT_VERSION = $(QT5_VERSION)
> > +QT5WEBKIT_SITE = $(QT5_SNAPSHOTS_SITE)
> > +QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_EXAMPLES_VERSION).tar.xz
>                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> You mean QT5WEBKIT_VERSION?

Did I send it? Oh boy... I was daydreaming most probably.

That's how people and companies leak their secrets :)
I was trying to bring WebkitExamples back in BR and this one was a prerequisite
that simplifies recovery of WebkitExamples sources. That said the
patch was build-tested
but with another patch on top of it and so I didn't catch this copy-pasta.

Will do a respin now.

-Alexey
