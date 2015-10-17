From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 17 Oct 2015 09:58:03 +0900
Subject: [Buildroot] [PATCH v1 1/1] gmediarender: new package
In-Reply-To: Your message of Fri, 16 Oct 2015 16:50:23 +0200.
 <20151016165023.2765d196@free-electrons.com>
Message-ID: <201510170058.t9H0w49H006744@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.
Thank you for your comment.

Thomas Petazzoni writes:
> Hello,
> 
> Thanks for this new contribution! It looks pretty good, but as usual I
> have some comments/questions.
> 
> First, can you fix your e-mail client or git send-email configuration
> so that your "From:" is:
> 
> 	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> 
> instead of just:
> 
> 	kei-k at ca2.so-net.ne.jp
> 
> The From: field is used to indicate the author of the patch in the Git
> history, so it's nicer when there's a full name rather than just the
> e-mail address.
Sure.
I think fixed it since this e-mail.

[snip]
> > +config BR2_PACKAGE_GMEDIARENDER
> > +	bool "gmediarender"
> > +	depends on BR2_USE_WCHAR # gstreamer
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer, libupnp
> > +	depends on BR2_USE_MMU # gstreamer
> > +	select BR2_PACKAGE_GSTREAMER
> 
> So it really only supports GStreamer 0.10.x (which is deprecated) and
> not GStreamer 1.x ?
Ok, let me check.

[snip]
> > +GMEDIARENDER_VERSION = 0.0.6
> > +GMEDIARENDER_SOURCE = gmediarender-$(GMEDIARENDER_VERSION).tar.bz2
> > +GMEDIARENDER_SITE = http://savannah.nongnu.org/download/gmrender
> > +GMEDIARENDER_AUTORECONF = YES
> 
> Can you add a justification for the AUTORECONF = YES here (in a comment
> above the line) ?
Ok, let me check again if really need this.

> > +GMEDIARENDER_LICENSE = GPLv2
> 
> License is actually GPLv2+.
Thank you, I will correct this.

> > +GMEDIARENDER_LICENSE_FILES = COPYING
> > +GMEDIARENDER_DEPENDENCIES = gstreamer libupnp
> > +GMEDIARENDER_CONF_OPTS = --with-libupnp=$(STAGING_DIR)/usr LIBS="-lixml"
> 
> Which package provides the ixml library ?
libixml is provided by libupnp package.

Regards,
Kawashima
============================================================
    Hiroshi Kawashima
