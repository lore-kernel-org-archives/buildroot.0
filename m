From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 17:21:34 +0200
Subject: [Buildroot] [PATCH 2/2] setserial: Disable manpages
In-Reply-To: <1409829526-49853-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 4 Sep 2014 12:18:46 +0100")
References: <1409829526-49853-1-git-send-email-Vincent.Riera@imgtec.com>
 <1409829526-49853-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87a96fs96p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > There is no configure option to disable the manpages, so we use this
 > patch to disable them. Otherwise this package would fail to build on
 > systems without the groff package installed because the build system
 > calls 'nroff' in the Makefile.

 > Fixes:
 >   http://autobuild.buildroot.net/results/c73/c736933d4110865008f2d1e8b531b6e392c68285/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
 > ---
 >  .../setserial-0003-disable-manpages.patch          |   61 ++++++++++++++++++++
 >  1 files changed, 61 insertions(+), 0 deletions(-)
 >  create mode 100644 package/setserial/setserial-0003-disable-manpages.patch

 > diff --git a/package/setserial/setserial-0003-disable-manpages.patch b/package/setserial/setserial-0003-disable-manpages.patch
 > new file mode 100644
 > index 0000000..ebd3cb2
 > --- /dev/null
 > +++ b/package/setserial/setserial-0003-disable-manpages.patch
 > @@ -0,0 +1,61 @@
 > +setserial: Disable manpages
 > +
 > +There is no configure option to disable the manpages, so we use this 
 > +patch to disable them. Otherwise this package would fail to build on 
 > +systems without the groff package installed because the build system 
 > +calls 'nroff' in the Makefile.

Nit: All these lines have a trailing space.

 > +
 > +Fixes:
 > +  http://autobuild.buildroot.net/results/c73/c736933d4110865008f2d1e8b531b6e392c68285/
 > +
 > +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > +--- setserial-2.17/Makefile.in.orig	2014-09-04 11:58:05.685475241 +0100
 > ++++ setserial-2.17/Makefile.in	2014-09-04 11:59:14.508641155 +0100
 > +@@ -17,26 +17,20 @@ DEFS = @DEFS@
 > + INCS = -I.
 > + TAR = tar
 > + 
 > +-all: setserial setserial.cat
 > ++all: setserial

As far as I can see, nroff is only used for setserial.cat, and
setserial.cat is not installed / used anywhere, so just patching this
line is enough and the rest of the patch can get dropped.

-- 
Bye, Peter Korsgaard
