From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 19:19:49 +0100
Subject: [Buildroot] [PATCH 1/1] packages/glibc: Fix mcontext_t error
 that breaks RISC-V package builds
In-Reply-To: <20190204154959.26237-1-mark.corbin@embecosm.com> (Mark Corbin's
 message of "Mon, 4 Feb 2019 15:49:59 +0000")
References: <20190204154959.26237-1-mark.corbin@embecosm.com>
Message-ID: <874l9jtnzu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > The riscv-glibc repository version of glibc 2.26 will build for
 > RISC-V 32bit, but when many packages are built against the resulting
 > library an 'unknown type name mcontext_t' error is reported. The
 > definition of mcontext_h in the ucontext.h header file needs to be
 > moved outside of the '#ifdef __USE_MISC' structure to fix this
 > issue.

 > Fixes:
 >   http://autobuild.buildroot.net/results/5aa9cb29c459f511dc9c4fcf218dc9a842505aa3

 > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
 > ---
 >  ...rror-that-breaks-RISC-V-architecture.patch | 39 +++++++++++++++++++
 >  1 file changed, 39 insertions(+)
 >  create mode 100644 package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch

 > diff --git a/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
 > new file mode 100644
 > index 0000000000..e0875a4590
 > --- /dev/null
 > +++ b/package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch
 > @@ -0,0 +1,39 @@
 > +From 6b4520e13c2ed7fca725d5f5c879854cd7c96c19 Mon Sep 17 00:00:00 2001
 > +From: Mark Corbin <mark.corbin@embecosm.com>
 > +Date: Mon, 4 Feb 2019 10:35:27 +0000
 > +Subject: [PATCH 1/1] Fix mcontext_t error that breaks RISC-V architecture
 > + package builds

check-package warns about this:

Applying: packages/glibc: Fix mcontext_t error that breaks RISC-V package builds
tpackage/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch:4: generate your patches with 'git format-patch -N'

Committed with that fixed, thanks. Do not forget to submit the patch
upstream.

-- 
Bye, Peter Korsgaard
