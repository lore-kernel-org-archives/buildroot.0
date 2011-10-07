From: vignesh rajendran <vickylinuxer@gmail.com>
Date: Fri, 7 Oct 2011 12:59:54 +0000
Subject: [Buildroot] [PATCH] libnfc
In-Reply-To: <CAG7bwAK-Wg9OeNByvTh9ZahSE8zMyKYGJujOvZOufMw1TPVJrw@mail.gmail.com>
References: <1310544945-1245-1-git-send-email-ruckuus@gmail.com>
 <CAG7bwAK-Wg9OeNByvTh9ZahSE8zMyKYGJujOvZOufMw1TPVJrw@mail.gmail.com>
Message-ID: <CALoDM-HEB-98oiWHf+yW4wqcBqYQuKTXOeWraZ1id0_VLGzsYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dependency as readline  also.

Regards
Vignesh Rajendran

On Wed, Jul 13, 2011 at 8:19 AM, Dwi Sasongko Supriyadi
<ruckuus@gmail.com>wrote:

> On Wed, Jul 13, 2011 at 3:15 PM,  <ruckuus@gmail.com> wrote:
> > From: Dwi Sasongko S <ruckuus@gmail.com>
> >
> > Public platform independent Near Field Communication (NFC)
> > library.
> >
> > For more info, visit project homepage:
> > http://www.libnfc.org
> >
> > Compatibility:
> > http://www.libnfc.org/documentation/hardware/compatibility
> >
> > Signed-off-by: Dwi Sasongko S <ruckuus@gmail.com>
> > ---
> >  package/Config.in        |    1 +
> >  package/libnfc/Config.in |    5 +++++
> >  package/libnfc/libnfc.mk |   13 +++++++++++++
> >  3 files changed, 19 insertions(+), 0 deletions(-)
> >  create mode 100644 package/libnfc/Config.in
> >  create mode 100644 package/libnfc/libnfc.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index d6767d6..7ab69d4 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -339,6 +339,7 @@ source "package/liboil/Config.in"
> >  source "package/libsigc/Config.in"
> >  source "package/startup-notification/Config.in"
> >  source "package/ccid/Config.in"
> > +source "package/libnfc/Config.in"
> >  endmenu
> >
> >  menu "Text and terminal handling"
> > diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
> > new file mode 100644
> > index 0000000..2f62691
> > --- /dev/null
> > +++ b/package/libnfc/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_LIBNFC
> > +       bool "libnfc"
> > +       help
> > +               Middleware to be used with PC/SC
> > +
> > diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
> > new file mode 100644
> > index 0000000..608f8fc
> > --- /dev/null
> > +++ b/package/libnfc/libnfc.mk
> > @@ -0,0 +1,13 @@
> > +##########################################################
> > +#
> > +# libnfc
> > +#
> > +##########################################################
> > +LIBNFC_VERSION = 1.4.2
> > +LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.gz
> > +LIBNFC_SITE = http://libnfc.googlecode.com/files
> > +LIBNFC_INSTALL_STAGING = YES
> > +LIBNFC_INSTALL_TARGET = YES
> > +LIBNFC_DEPENDENCIES = host-pkg-config pcsc-lite libusb
> > +
> > +$(eval $(call AUTOTARGETS,package,libnfc))
> > --
> > 1.7.0.4
> >
> >
>
> I am sorry,
>
> This patch should *not* have been sent.
>
> I will take care for further submission.
>
>
> --
> Dwi Sasongko S
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111007/7d5385fb/attachment.html>
