From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 11 Nov 2016 23:54:10 +0100
Subject: [Buildroot] [PATCH v1 1/2] lcms2: fix lcms2.pc.in thread library
	dependency (for static linking)
Message-ID: <1478904851-21040-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...Fix-lcms2.pc.in-thread-library-dependency.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch

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
-- 
2.8.1
