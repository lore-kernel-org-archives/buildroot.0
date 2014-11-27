From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 23:28:26 +0100
Subject: [Buildroot] [PATCH 4/4 v2] package/nfs-utils: use pkg-config to
	find libtirpc
In-Reply-To: <ffb61e77dc527abadcf5c155b2163c3fcc9b9329.1417123680.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 27 Nov 2014 22:28:49 +0100")
References: <cover.1417123680.git.yann.morin.1998@free.fr>
 <ffb61e77dc527abadcf5c155b2163c3fcc9b9329.1417123680.git.yann.morin.1998@free.fr>
Message-ID: <874mtknur9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes:
 >     http://autobuild.buildroot.net/results/17d/17d1d94e6f1617851e374f4fe9804f1e5ea9e99f/
 >     http://autobuild.buildroot.net/results/c08/c08b7be40c8f208147a4f95ad897e4a1df7e108d/
 >     and probably some others as well...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/nfs-utils/0008-tirpc-with-pkgconfig.patch | 102 ++++++++++++++++++++++
 >  package/nfs-utils/nfs-utils.mk                    |   2 +-
 >  2 files changed, 103 insertions(+), 1 deletion(-)
 >  create mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch

 > diff --git a/package/nfs-utils/0008-tirpc-with-pkgconfig.patch b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
 > new file mode 100644
 > index 0000000..62c820b
 > --- /dev/null
 > +++ b/package/nfs-utils/0008-tirpc-with-pkgconfig.patch
 > @@ -0,0 +1,102 @@
 > +From 1ecd1f2008bfab7bb3cd6ada135c980414a7f1ba Mon Sep 17 00:00:00 2001
 > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > +Date: Sun, 23 Nov 2014 15:53:56 +0100
 > +Subject: [PATCH] configure: use pkg-config to find libtirpc
 > +
 > +Currently, we use a custom function to find libtirpc's headers and
 > +libraries. This works fine for shared linking.
 > +
 > +But for static linking, this forgets to link with -lpthread, which is
 > +required by libtirpc.
 > +
 > +A recent patch was sent to libtirpc to add that missing -lpthread in its
 > +Libs.private section of its .pc file. Thus, pkg-config will soon be able
 > +to return the appropriate libraries.
 > +
 > +So, use pkg-config to find libtirpc.
 > +
 > +And for older libtirpc versions, there is no change in behaviour: we're
 > +still missing the -lpthread. But once libtirpc has been fixed, we'll
 > +automatically get that missing library for free! :-)
 > +
 > +Remove the --with-libirpc flag as it is no longer needed: pkg-config

This should probably have been --with-tirpcinclude, right?

Other than that the series looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
