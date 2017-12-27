From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Dec 2017 23:17:00 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5scxml: needs
 qt5declarative package
In-Reply-To: <20171227224206.37fef60a@windsurf.home>
References: <20171227210731.11EFE83571@busybox.osuosl.org>
 <20171227222616.6f4dd5de@gmx.net>
 <20171227224206.37fef60a@windsurf.home>
Message-ID: <20171227231700.4b3cfadf@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 27 Dec 2017 22:42:06 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 27 Dec 2017 22:26:16 +0100, Peter Seiderer wrote:
> 
> 
> > > diff --git a/package/qt5/qt5scxml/Config.in b/package/qt5/qt5scxml/Config.in
> > > index 4ae6a5b..469bdc1 100644
> > > --- a/package/qt5/qt5scxml/Config.in
> > > +++ b/package/qt5/qt5scxml/Config.in
> > > @@ -1,7 +1,9 @@
> > >  config BR2_PACKAGE_QT5SCXML
> > >  	bool "qt5scxml"
> > >  	depends on BR2_PACKAGE_QT5_VERSION_LATEST
> > > +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE    
> > 
> > Better:
> > 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative  
> 
> True.
> 
> > >  	select BR2_PACKAGE_QT5BASE    
> > 
> > Not sure if an explicit select is needed, but qt5declarative selects the following:
> > 
> > 	select BR2_PACKAGE_QT5BASE_GUI # qt5declarative
> > 	select BR2_PACKAGE_QT5XMLPATTERNS # qt5declarative  
> 
> So why does your patch also selects them, if they are already
> implicitly selected by qt5declarative ?

Thanks for the reasoning, but one more question: with this logic
the above 'select BR2_PACKAGE_QT5BASE' could be removed (but the
below dependency on qt5base without the corresponding select seems
ugly)?

> 
> > diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
> > index 4b1f97973d..3deef99aaf 100644
> > --- a/package/qt5/qt5scxml/qt5scxml.mk
> > +++ b/package/qt5/qt5scxml/qt5scxml.mk
> > @@ -7,7 +7,7 @@
> >  QT5SCXML_VERSION = $(QT5_VERSION)
> >  QT5SCXML_SITE = $(QT5_SITE)
> >  QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
> > -QT5SCXML_DEPENDENCIES = qt5base
> > +QT5SCXML_DEPENDENCIES = qt5base qt5xmlpatterns qt5declarative  
> 
> True for qt5declarative. But for qt5xmlpatterns? Is it directly used by
> qt5scxml? If not, then adding it is not necessary, as qt5declarative
> already has a dependency on it.
> 
> Could you send a follow-up patch doing the remaining fixes?

O.k, will do...

Regards,
Peter

> 
> Thanks a lot!
> 
> Thomas
