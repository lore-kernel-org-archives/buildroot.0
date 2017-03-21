From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 21 Mar 2017 09:52:51 -0400
Subject: [Buildroot] [PATCH] package: add qt5virtualkeyboard
In-Reply-To: <20170320213314.394bdb0e@gmx.net>
References: <20170317164628.5029-1-gael.portay@savoirfairelinux.com>
 <20170320213314.394bdb0e@gmx.net>
Message-ID: <20170321135251.bv6ujfdknmeywjdc@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for your review.

On Mon, Mar 20, 2017 at 09:33:14PM +0100, Peter Seiderer wrote:
> Hello Ga?l,
> 
> some additions to your own findings...
> 
> On Fri, 17 Mar 2017 12:46:28 -0400, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:
> 
> > This patch adds the Qt virtualkeyboard package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  package/qt5/Config.in                              |  1 +
> >  package/qt5/qt5virtualkeyboard/Config.in           |  9 +++++++
> >  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 31 ++++++++++++++++++++++
> >  3 files changed, 41 insertions(+)
> >  create mode 100644 package/qt5/qt5virtualkeyboard/Config.in
> >  create mode 100644 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> > 
> > diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
> > new file mode 100644
> > index 0000000..df9e9d6
> > --- /dev/null
> > +++ b/package/qt5/qt5virtualkeyboard/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_QT5VIRTUALKEYBOARD
> > +	bool "qt5virtualkeyboard"
> 
> Needs 
> 
> 	depends on BR2_PACKAGE_QT5_VERSION_LATEST

Done.

> 
> or some non-standard download location in case qt5virtualkeyboard is although
> availabe for qt-5.6.2?
> 

Indeed. VirtualKeyboard is available in Qt since 5.7.

Before it was probably independant. We can find some tags like v2.0.0, v1.3.1
and below in their GitHub repository.

Do you want I make it available for 5.6 as well? Or maybe latter.

> > +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
> > +	select BR2_PACKAGE_QT5SVG
> > +	help
> > +	  Qt Virtual Keyboard is a virtual keyboard framework that consists of a
> > +	  C++ backend supporting custom input methods as well as a UI frontend
> > +	  implemented in QML.

	  This module is licensed under GPLv3.

> > +
> 
> Maybe mention the GPLv3 only license here?

Done.

> 
> And some comment in case the dependencies are not given:
> 
> 	comment "qt5virtualkeyboard needs at least qt-5.8.0 and qt5declarative quick module"
> 	       depends on !BR2_PACKAGE_QT5_VERSION_LATEST || !BR2_PACKAGE_QT5DECLARATIVE_QUICK
> 

Done.

> Regards,
> Peter
> 

Regards,
Gael
