From: Daniel Nicoletti <dantti12@gmail.com>
Date: Tue, 17 Jul 2018 10:23:26 -0300
Subject: [Buildroot] [PATCH] cutelyst: new package
In-Reply-To: <20180717090151.30233d21@windsurf>
References: <20180716204912.8915-1-dantti12@gmail.com>
 <20180717090151.30233d21@windsurf>
Message-ID: <CACo8zOdPnJhMDqcJMp4fdKdLTsuGg9RLMNbjGEZBtxQaXEOeyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Em ter, 17 de jul de 2018 ?s 04:01, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> escreveu:
>
> Hello Daniel,
Hi!

>
> On Mon, 16 Jul 2018 17:49:12 -0300, Daniel Nicoletti wrote:
> > A C++ Web Framework built on top of Qt, using
> > the simple approach of Catalyst (Perl) framework.
> >
> > Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
>
> Thanks for this contribution, see a few comments below.
>
> > diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
> > new file mode 100644
> > index 0000000000..ef59947fc7
> > --- /dev/null
> > +++ b/package/cutelyst/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_CUTELYST
> > +     bool "cutelyst"
> > +     depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5 && BR2_PACKAGE_QT5BASE_SQL
>
> Why do you have a depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE ? This
> dependency is not used by anything in qt5base.
I based on the grantlee package, I actually thought this means QJson..

>
> Also, depending on BR2_PACKAGE_QT5BASE_SQL is not necessary, as this
> option is always true (which makes me wonder why we still have it).
Ok, will remove both deps

>
> > +     select BR2_PACKAGE_QT5BASE_GUI
> > +     help
> > +       A C++ Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework.
>
> This line is too long. Please run your package
> through ./utils/check-package to fix coding style issues.
sure

>
> > diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
> > new file mode 100644
> > index 0000000000..ae3f26c1fa
> > --- /dev/null
> > +++ b/package/cutelyst/cutelyst.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated after checking pgp signature
> > +sha256  781e5da74ff5a03df415c70e9af0290d6aff5731d9f1978bf1bd4052bfe9cf05    cutelyst-2.5.0.tar.gz
>
> We like to have a hash for the license file as well.
a hash of the license file included in the tarball?

>
> > +CUTELYST_VERSION = 2.5.0
> > +CUTELYST_SOURCE = cutelyst-$(CUTELYST_VERSION).tar.gz
> > +CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
> > +CUTELYST_INSTALL_STAGING = YES
> > +CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
> > +CUTELYST_LICENSE = LGPL-2.1+
> > +CUTELYST_LICENSE_FILES = COPYING.LIB
> > +CUTELYST_DEPENDENCIES = qt5base
> > +CUTELYST_MAKE = $(MAKE1)
Oops sorry, was trying to find a build issue yesterday
and forgot to remove.

>
> It really doesn't build in parallel ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Daniel Nicoletti

KDE Developer - http://dantti.wordpress.com
