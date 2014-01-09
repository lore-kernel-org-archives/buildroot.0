From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 11:27:50 +0100
Subject: [Buildroot] [PATCH] libfreefare: Fix build on static
In-Reply-To: <1386267434-7144-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 5 Dec 2013 18:17:14 +0000")
References: <1386267434-7144-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87ha9dmoux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This patch makes this package building correctly on static.
 > Fixes:

 >    http://autobuild.buildroot.net/results/f09/f09d515f0e7b6d78010f1ce624336ceaef624989/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  .../libfreefare-001-fix-static-build.patch         |   10 ++++++++++
 >  1 files changed, 10 insertions(+), 0 deletions(-)
 >  create mode 100644 package/libfreefare/libfreefare-001-fix-static-build.patch

 > diff --git a/package/libfreefare/libfreefare-001-fix-static-build.patch b/package/libfreefare/libfreefare-001-fix-static-build.patch
 > new file mode 100644
 > index 0000000..31dfa30
 > --- /dev/null
 > +++ b/package/libfreefare/libfreefare-001-fix-static-build.patch
 > @@ -0,0 +1,10 @@
 > +--- libfreefare-0.3.4/examples/Makefile.am.orig	2013-12-05 17:08:16.058185440 +0000
 > ++++ libfreefare-0.3.4/examples/Makefile.am	2013-12-05 17:14:02.270548090 +0000
 > +@@ -2,6 +2,7 @@
 > + 
 > + AM_CFLAGS = -I. -I$(top_srcdir)/libfreefare @LIBNFC_CFLAGS@
 > + AM_LDFLAGS = @LIBNFC_LIBS@
 > ++LIBS = -lcrypto -lz

Thanks, but it's nicer to just pass LIBS= to configure instead of
patching the Makefile.am (and running autoreconf).

As far as I can see from the autobuild error (and local testing), it's
only missing -lz, so I left out -lcrypto.

-- 
Bye, Peter Korsgaard
