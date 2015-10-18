From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sun, 18 Oct 2015 09:49:13 +0900
Subject: [Buildroot] [PATCH v1 1/1] gmediarender: new package
In-Reply-To: Your message of Sat, 17 Oct 2015 09:58:03 +0900.
 <201510170058.t9H0w49H006744@ms-omx02.plus.so-net.ne.jp>
Message-ID: <201510180049.t9I0nD00004594@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.
Thank you for your review and comment.

1) This project is old and last update is 2007, so it still depsnds on
   gstreamer 0.10.x.
2) AUTORECONF is not needed actually.

I will send new v2 patch later.

Regards,
Kawashima

> [snip]
> > > +config BR2_PACKAGE_GMEDIARENDER
> > > +	bool "gmediarender"
> > > +	depends on BR2_USE_WCHAR # gstreamer
> > > +	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer, libupnp
> > > +	depends on BR2_USE_MMU # gstreamer
> > > +	select BR2_PACKAGE_GSTREAMER
> > 
> > So it really only supports GStreamer 0.10.x (which is deprecated) and
> > not GStreamer 1.x ?
> Ok, let me check.
> 
> [snip]
> > > +GMEDIARENDER_VERSION = 0.0.6
> > > +GMEDIARENDER_SOURCE = gmediarender-$(GMEDIARENDER_VERSION).tar.bz2
> > > +GMEDIARENDER_SITE = http://savannah.nongnu.org/download/gmrender
> > > +GMEDIARENDER_AUTORECONF = YES
> > 
> > Can you add a justification for the AUTORECONF = YES here (in a comment
> > above the line) ?
> Ok, let me check again if really need this.
============================================================
    Hiroshi Kawashima
