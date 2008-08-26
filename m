From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 21:27:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pixman x11r7
In-Reply-To: <20080826162725.ACBE63C8AA@busybox.net> (laird@uclibc.org's
	message of "Tue\, 26 Aug 2008 09\:27\:25 -0700 \(PDT\)")
References: <20080826162725.ACBE63C8AA@busybox.net>
Message-ID: <87abez8tky.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2008-08-26 09:27:25 -0700 (Tue, 26 Aug 2008)
 laird> New Revision: 23210

 laird> Log:
 laird> Move pixman from package/x11r7/pixman to package/pixman
 laird> Means we can now bounce cairo to 1.6.x series.
 laird> pixman is not dependant on x libraries what so over so removed
 laird> the dependencies section.

It could be cool if you styled your commits like:

pixman: move from package/x11r7/ to package/

Pixmand doesn't depend on X libraries, so move it out of x11r7 and
remove the X dependencies.

Then you can see right away what the commit is about in git-shortlog.

 laird>  PIXMAN_VERSION = 0.10.0
 laird>  PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 laird>  PIXMAN_SITE = http://cairographics.org/releases/
 laird> @@ -12,6 +11,4 @@
 laird>  PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 laird>  PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install install-data
 

I know you didn't change the above 2 lines, but they look fishy. From
a quick look, it seems install-data only installs a subset of install,
so it's redundant. Also install-strip should be used for target to
strip the libs.

I've fixed it in r23211.

-- 
Bye, Peter Korsgaard
