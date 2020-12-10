From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Dec 2020 22:40:49 +0100
Subject: [Buildroot] [RFC v1] package/ninja: fix to be cmake-3.10
 compatible again
In-Reply-To: <CAGm1_kvqbRenO4XFLOk3p_CCh95RhBcPQg-RDVa3xLVNabOUdQ@mail.gmail.com>
References: <20201210193807.19225-1-ps.report@gmx.net>
 <CAGm1_kvqbRenO4XFLOk3p_CCh95RhBcPQg-RDVa3xLVNabOUdQ@mail.gmail.com>
Message-ID: <20201210224049.129fb8f4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Thu, 10 Dec 2020 21:20:00 +0100, Yegor Yefremov via buildroot <buildroot@busybox.net> wrote:

> Hi Peter,
>
> On Thu, Dec 10, 2020 at 8:38 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Fixes (see [1]):
> >
> > ToDo: ...
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2020-December/298159.html
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...onform-COMPILE_FLAGS-instead-of-3.15.patch | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> >
> > diff --git a/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch b/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> > new file mode 100644
> > index 0000000000..a2a5159da5
> > --- /dev/null
> > +++ b/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> > @@ -0,0 +1,27 @@
> > +From ec0c02c67f963ac25053dcd8261bc540c49d3a17 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Thu, 10 Dec 2020 20:29:19 +0100
> > +Subject: [PATCH] use cmake-3.10 conform COMPILE_FLAGS instead of 3.15
> > + INCLUDE_DIRECTORIES property
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 7f03c35..96e91f7 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -156,7 +156,7 @@ if(platform_supports_ninja_browse)
> > +       set_source_files_properties(src/browse.cc
> > +               PROPERTIES
> > +                       OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h"
> > +-                      INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}"
> > ++                      COMPILE_OPTIONS "-I${CMAKE_BINARY_DIR}"
>
> COMPILE_OPTIONS is not available in 3.10 but COMPILE_FLAGS
> (https://cmake.org/cmake/help/v3.10/prop_sf/COMPILE_FLAGS.html)

Yes, you are right, will re-spin the patch...

Regards,
Peter

>
> Regards,
> Yegor
>
> > +                       COMPILE_DEFINITIONS NINJA_PYTHON="python"
> > +       )
> > + endif()
> > +--
> > +2.29.2
> > +
> > --
> > 2.29.2
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
