From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Oct 2019 19:10:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: add Libs.Private to
 pciaccess.pc
Message-ID: <20191025171003.4322-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a static build failure for hwloc

Fixes:
 - http://autobuild.buildroot.org/results/f100191acef41d42582ab2a35e1b6f264594f074

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-pciaccess.pc.in-add-Libs.Private.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch

diff --git a/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch b/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch
new file mode 100644
index 0000000000..e520dd03d8
--- /dev/null
+++ b/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch
@@ -0,0 +1,28 @@
+From e1f9fc0a11559c1200005c4bfe34cd217ec117b4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Oct 2019 19:03:32 +0200
+Subject: [PATCH] pciaccess.pc.in: add Libs.Private
+
+Add Libs.Private in pciaccess.pc.in so applications that wants to link
+statically with pciaccess will know that they have to link with its
+dependencies such as -lz
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/xorg/lib/libpciaccess/merge_requests/10]
+---
+ pciaccess.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pciaccess.pc.in b/pciaccess.pc.in
+index 706c5f7..c2da3d9 100644
+--- a/pciaccess.pc.in
++++ b/pciaccess.pc.in
+@@ -8,3 +8,4 @@ Description: Library providing generic access to the PCI bus and devices.
+ Version: @PACKAGE_VERSION@
+ Cflags: -I${includedir}
+ Libs: -L${libdir} -lpciaccess
++Libs.Private: @PCIACCESS_LIBS@
+-- 
+2.23.0
+
-- 
2.23.0
