From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 14:29:20 +0100
Subject: [Buildroot] [git commit] lcms2: fix lcms2.pc.in thread library
	dependency (for static linking)
Message-ID: <20161113133325.E17887FA6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70030101e16d79683051ac04e206dc0cfba48f2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Fix-lcms2.pc.in-thread-library-dependency.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch b/package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch
new file mode 100644
index 0000000..f8c0d00
--- /dev/null
+++ b/package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch
@@ -0,0 +1,26 @@
+From 0b55fd4e0935a0231ca258fde631a95215df2f72 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 11 Nov 2016 23:29:56 +0100
+Subject: [PATCH] Fix lcms2.pc.in thread library dependency.
+
+Needed (sometimes) for static linking.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lcms2.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lcms2.pc.in b/lcms2.pc.in
+index b715f59..5b4213c 100644
+--- a/lcms2.pc.in
++++ b/lcms2.pc.in
+@@ -7,5 +7,5 @@ Name: @PACKAGE@
+ Description: LCMS Color Management Library
+ Version: @VERSION@
+ Libs: -L${libdir} -llcms2
+-Libs.private: @LIB_MATH@ 
++Libs.private: @LIB_MATH@ @LIB_THREAD@
+ Cflags: -I${includedir}
+-- 
+2.8.1
+
