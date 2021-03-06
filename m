From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 16:34:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/openblas: strip any
 optimization flag where needed
In-Reply-To: <20210305134839.30612-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 5 Mar 2021 14:48:37 +0100")
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
 <20210305134839.30612-2-patrickdepinguin@gmail.com>
Message-ID: <87y2f08fe2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > openblas strips off -O1-O3 for certain source files, but forgets to handle
 > -Os, -Og and -O. This means that the intended effect of 'no optimization' is
 > not always reached.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  ...nsider-Os-when-determining-LAPACK_NO.patch | 31 +++++++++++++++++++
 >  1 file changed, 31 insertions(+)
 >  create mode 100644
 > package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch

 > As the openblas patch is fixing a generic problem, I will attempt to upstream it.

 > diff --git
 > a/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
 > b/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
 > new file mode 100644
 > index 0000000000..0ff9051ae4
 > --- /dev/null
 > +++ b/package/openblas/0003-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
 > @@ -0,0 +1,31 @@
 > +From ced08de1ad74811bc23d74121751537bfd8e9556 Mon Sep 17 00:00:00 2001
 > +From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > +Date: Fri, 5 Mar 2021 11:15:52 +0100
 > +Subject: [PATCH 1/2] Makefile: also consider -O, -Og and -Os when stripping flags

Same comment about -N. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
