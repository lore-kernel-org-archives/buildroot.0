From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 00:13:35 +0100
Subject: [Buildroot] [PATCH 08/30] jpeg: convert to a real package
In-Reply-To: <CAHXCMMLphnmd1K_xMX3QR2pga-ptZK9+vRJ2O-4KeJM8BHTjuA@mail.gmail.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362007582-14753-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMLphnmd1K_xMX3QR2pga-ptZK9+vRJ2O-4KeJM8BHTjuA@mail.gmail.com>
Message-ID: <20130301001335.2dbd4b21@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 28 Feb 2013 23:13:03 +0100, Samuel Martin wrote:

> > Instead to implement such a make target manually, make jpeg a normal
> > generic-package, except that it doesn't have any source.
> Nice, it also prevents from fault positive match (about the
> infrastructure) in the autobuilder stats :)

Yes, the point is that by re-using the package infrastructure, we are
much cleaner in terms of integration with the download stuff, the
licensing feature and so on.

> > diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
> > index 3caacaa..962908d 100644
> > --- a/package/jpeg/jpeg.mk
> > +++ b/package/jpeg/jpeg.mk
> > @@ -1,10 +1,24 @@
> >  #############################################################
> >  #
> > -# jpeg
> > +# Virtual jpeg package
> >  #
> >  #############################################################
> >
> > -jpeg: $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo,libjpeg)
> > +JPEG_SOURCE =
> >
> > -host-jpeg: host-libjpeg
> Does this change break few packages?
> AFAICS, libeet and libevas seem depend on host-jpeg.

Looks like I miss a $(eval $(host-generic-package)) at the end of the
file, and maybe a few more things. I'll look into this. Good point,
thanks for raising it!

> A bit off-topic: this is the first virtual package, it'd be good to
> have a clean and known way of handling virtual packages.

Yes. I would maybe wait that we have a few of them to see what is the
real pattern between them, but then documenting it will definitely be
useful, of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
