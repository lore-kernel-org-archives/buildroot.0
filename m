From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 16:33:02 +0100
Subject: [Buildroot] [PATCH 1/3] package/openblas: fix build failure due
 to forced FFLAGS
In-Reply-To: <20210305134839.30612-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 5 Mar 2021 14:48:36 +0100")
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
Message-ID: <8735x89u1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Buildroot specifies a value for FFLAGS on the make command-line.
 > While the openblas makefiles allowed this principle for the most part by
 > using 'override FFLAGS += ....', the make.inc file generated for the shipped
 > 'lapack' sources just used a 'FFLAGS = ...' statement, whose value is then
 > eclipsed by the command-line FFLAGS.

 > This meant that -fPIC may be passed to the link step but not to all relevant
 > source files, causing relocation failures.

 > Fixes: http://autobuild.buildroot.net/results/d530db0f37e1e0462e3af1e1787e15f94ff21884/
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  ...port-for-passing-FFLAGS-on-the-make-.patch | 47 +++++++++++++++++++
 >  1 file changed, 47 insertions(+)
 >  create mode 100644
 > package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch


 > As the openblas patch is fixing a generic problem, I will attempt to upstream it.

 > diff --git
 > a/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
 > b/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
 > new file mode 100644
 > index 0000000000..c6c73bb0fd
 > --- /dev/null
 > +++ b/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
 > @@ -0,0 +1,47 @@
 > +From 4d3829fa52240c2b7e48770ab19584db33ba7863 Mon Sep 17 00:00:00 2001
 > +From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > +Date: Fri, 5 Mar 2021 11:17:59 +0100
 > +Subject: [PATCH 2/2] Makefile: fix support for passing FFLAGS on the make
 > + command line

NIT: Use the -N option for git format-patch to get rid of the 2/2 as
pointed out by ./utils/check-package:

Applying: package/openblas: fix build failure due to forced FFLAGS
package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch:4:
generate your patches with 'git format-patch -N'



 > +
 > +When openblas is build while passing FFLAGS on the make command line, the

s/build/built/

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
