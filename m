From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:50:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libpciaccess: add
 Libs.Private to pciaccess.pc
Message-ID: <20191030124835.952858B504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3472f99b895e9e5115db543e2a393643302858d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This will fix a static build failure for hwloc

Fixes:
 - http://autobuild.buildroot.org/results/f100191acef41d42582ab2a35e1b6f264594f074

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c2c4e3bddad7af0131d869d6b3d650fc13a2c104)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-pciaccess.pc.in-add-Libs.Private.patch    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

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
