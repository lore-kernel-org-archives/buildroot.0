From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 22:35:59 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix static build
In-Reply-To: <1416943355-19766-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 25 Nov 2014 20:22:35 +0100")
References: <1416943355-19766-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87r3wrq7y8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > clamav unconditionally includes dlfcn.h which is missing on a uClibc
 > that is configured as a pure-static C library.

 > Thus, the build fails.

 > But the including file does not even makes use of any function from the
 > dlopen() familly, so it does not need to include dlfcn.h to start with.

 > Add a patch to clamav to not include dlfcn.h where not needed.

 > Fixes:
 >     http://autobuild.buildroot.net/results/b49/b491f4e5e1760248adb8d21b404e8aa15f7dbdd1/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/clamav/clamav-0004-fix-static-build.patch | 21 +++++++++++++++++++++
 >  1 file changed, 21 insertions(+)
 >  create mode 100644 package/clamav/clamav-0004-fix-static-build.patch

 > diff --git a/package/clamav/clamav-0004-fix-static-build.patch b/package/clamav/clamav-0004-fix-static-build.patch
 > new file mode 100644
 > index 0000000..97aac2d
 > --- /dev/null
 > +++ b/package/clamav/clamav-0004-fix-static-build.patch
 > @@ -0,0 +1,21 @@
 > +stats: fix static link
 > +
 > +The stats.c file does not use the dlopen() familly of functions, but
 > +includes dlfcn.h, which is missing on uClibc when it is configured as
 > +a static-only C library.
 > +
 > +Do, simply do not include dlfcn.h.

s/Do/So/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
