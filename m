From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 01 Oct 2011 14:21:30 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: bump version
In-Reply-To: <1317385486.15482.3.camel@sven> (Sven Neumann's message of "Fri, 
 30 Sep 2011 14:21:36 +0200")
References: <20110929190333.7F3E78DBD5@busybox.osuosl.org>
 <1317383828.15482.1.camel@sven> <1317385486.15482.3.camel@sven>
Message-ID: <87lit4nbqt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> The following change and a call to autoreconf seems to fix the problem:

 Sven> --- gst-libs/gst/audio/Makefile.am~	2011-06-14 15:18:56.000000000 +0200
 Sven> +++ gst-libs/gst/audio/Makefile.am	2011-09-30 14:16:39.000000000 +0200
 Sven> @@ -53,7 +53,7 @@
 Sven>  noinst_PROGRAMS = testchannels
 Sven>  testchannels_SOURCES = testchannels.c
 Sven>  testchannels_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
 Sven> -testchannels_LDADD =  $(builddir)/libgstaudio-$(GST_MAJORMINOR).la $(GST_LIBS)
 Sven> +testchannels_LDADD =  $(builddir)/libgstaudio-$(GST_MAJORMINOR).la $(builddir)/../interfaces/libgstinterfaces-$(GST_MAJORMINOR).la $(GST_LIBS)
 
 Sven>  include $(top_srcdir)/common/gst-glib-gen.mak
 
 Sven> Not sure though if this is the best way to fix it. If we have to touch
 Sven> the Makefile.am we could as well remove the build of testchannels
 Sven> completely.

Indeed - I think the easiest fix is just to add an #if 0 / #endif in
testchannels.c, then we don't have to autoreconf.

-- 
Bye, Peter Korsgaard
