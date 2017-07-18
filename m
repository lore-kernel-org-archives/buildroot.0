From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 18 Jul 2017 13:32:08 -0400
Subject: [Buildroot] [v3 1/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170718095113.2cc0b24c@windsurf>
References: <20170717160939.3159-1-gael.portay@savoirfairelinux.com>
 <20170717160939.3159-2-gael.portay@savoirfairelinux.com>
 <20170718095113.2cc0b24c@windsurf>
Message-ID: <20170718173208.fotvzrbpnlu7kcnp@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 18, 2017 at 09:51:13AM +0200, Thomas Petazzoni wrote:
> > diff --git a/package/rpi-userland/0001-Add-OpenGL-library-versioning.patch b/package/rpi-userland/0001-Add-OpenGL-library-versioning.patch
> > new file mode 100644
> > index 0000000000..ea708f9559
> > --- /dev/null
> > +++ b/package/rpi-userland/0001-Add-OpenGL-library-versioning.patch
> > @@ -0,0 +1,35 @@
> > +From bf388550943afc70798c497e3fc706303394cfdc Mon Sep 17 00:00:00 2001
> > +From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
> > +Date: Fri, 3 Mar 2017 17:28:41 -0500
> > +Subject: [PATCH] Add OpenGL library versioning
> > +
> > +Some applications like QtWebEngine dynamically load libraries using
> > +dlopen. The library name is hardcoded, and it includes the library
> > +version [1].
> > +
> > +This patch creates symlinks for EGL and GLES libraries.
> > +
> > +	libEGL.so.1 -> libEGL.so
> > +	libGLESv2.so.2 -> libGLESv2.so
> > +
> > +[1] https://github.com/qt/qtwebengine/blob/dev/src/core/surface_factory_qt.cpp#L76-L86
> 
> Missing Signed-off-by line here.
> 

I will add it in v4.

> Has this patch been submitted upstream ?
> 

Yes, I made a PR[1] couple of month ago.

I will ping popcormix.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Regards,
Gael

1: https://github.com/raspberrypi/userland/pull/379
