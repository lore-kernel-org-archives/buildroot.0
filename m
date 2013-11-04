From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Nov 2013 22:35:48 +0100
Subject: [Buildroot] [PATCH] libsigsegv: fix avr32 build
In-Reply-To: <1383557629-13227-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 4 Nov 2013 09:33:49 +0000")
References: <1383557629-13227-1-git-send-email-spdawson@gmail.com>
Message-ID: <878ux3q28b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The libsigsegv configure step fails to correctly figure out the direction of
 > stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
 > build failures such as the following.

 >   http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  .../libsigsegv-0001-fix-avr32-build.patch          | 32 ++++++++++++++++++++++
 >  1 file changed, 32 insertions(+)
 >  create mode 100644 package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch

 > diff --git a/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch b/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
 > new file mode 100644
 > index 0000000..daccabb
 > --- /dev/null
 > +++ b/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
 > @@ -0,0 +1,32 @@
 > +The libsigsegv configure step fails to correctly figure out the direction of
 > +stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
 > +build failures such as the following.
 > +
 > +  http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33
 > +
 > +Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > +
 > +diff -Nurp a/configure b/configure

Doesn't autoreconf work? I prefer to regenerate configure instead of
patching it if possible.

-- 
Bye, Peter Korsgaard
