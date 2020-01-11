From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 15:44:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: really disable test
 programs
In-Reply-To: <20200111153537.66974300@windsurf>
References: <20200111115054.864819-1-fontaine.fabrice@gmail.com>
 <20200111153537.66974300@windsurf>
Message-ID: <CAPi7W80=Gn0SsFg0MWDBiJYd2DLriDredJYcbYGVpBjw6jXhfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le sam. 11 janv. 2020 ? 15:35, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 11 Jan 2020 12:50:54 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...1-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch
> >
> > diff --git a/package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch b/package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch
> > new file mode 100644
> > index 0000000000..476676199a
> > --- /dev/null
> > +++ b/package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch
> > @@ -0,0 +1,32 @@
> > +From ccc5f765c37b2d65e2e0b64d92326997f90acb3e Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Sat, 11 Jan 2020 12:37:07 +0100
> > +Subject: [PATCH] CMakeLists.txt: fix BUILD_CPP_TESTS
> > +
> > +Do not build programs under the test directory if BUILD_CPP_TESTS is OFF
> > +as this directory contains multiple C++ test executables
>
> What is the problem with C++ executables, since poppler depends on C++
> anyway ?
>
> Of course, it is good to disable building tests if possible, but I'm
> just curious to understand the motivation for the change: did you
> encounter a build failure? Or it is just that you realized the tests
> were being built while they should not?
Following your comment on the leveldb patch that was fixing the
-latomic build failure, I'm going through the different -latomic
workarounds used in the cmake packages.
I'm trying to replace these workarounds by upstreamable patches.
However, in some cases such as libraries (like poppler) these
workarounds/patches are not strictly needed if we don't build any
executable.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
