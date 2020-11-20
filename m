From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 20 Nov 2020 10:36:37 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qt5/qt5coap: new package
In-Reply-To: <20201119231125.369c16bb@windsurf.home>
References: <20201119220142.1054287-1-angelo@amarulasolutions.com>
 <20201119231125.369c16bb@windsurf.home>
Message-ID: <CA+_SqVbEkASp_tHrSLuxOENEBUxgg+KN6gt3yy6vTC7Bz3aXZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 19, 2020 at 11:11 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Angelo,
>
> Thanks a lot those three packages, they obviously look good. I only have one question.
>
> On Thu, 19 Nov 2020 23:01:40 +0100
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > +QT5COAP_VERSION = $(QT5_VERSION)
> > +QT5COAP_SITE = $(call github,qt,qtcoap,v$(QT5_VERSION))
> > +QT5COAP_INSTALL_STAGING = YES
> > +QT5COAP_LICENSE = GPL-3.0, GFDL-1.3
> > +QT5COAP_LICENSE_FILES = LICENSE.GPL3 LICENSE.FDL
> > +QT5COAP_DEPENDENCIES = host-perl
> > +
> > +define QT5COAP_FIX_INCLUDE
> > +     cd $(@D); $(HOST_DIR)/bin/syncqt.pl -module QtCoap -version $(QT5_VERSION)
> > +endef
>
> Why is this syncqt.pl invocation needed for those 3 packages? What
> makes them different from the other Qt5 packages we have?

If you open one of the other packages, you can find the "include"
directory already populated, instead when compiling from source the
folder is missing. qmake runs syncqt.pl automatically when you run
qmake from a cloned repo (when there is a .git folder). This is the
way the qt everywhere source packages are built.
Buildroot removes the .git folder and so the script isn't triggered. I
had to choose if adding a fake .git directory or call the script
manually, I choose the latter because I think it's more clear.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 

Angelo Compagnucci
Amarula Solutions SRL
Embedded Linux Developer
Via Le Canevare 30 31100 Treviso IT
T. +390422435310
[`as] https://www.amarulasolutions.com|
