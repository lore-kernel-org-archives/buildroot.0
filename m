From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 18:33:52 +0100
Subject: [Buildroot] [git commit] package/libsoxr: add avutil to soxr.pc
Message-ID: <20181124204013.F3264881A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d81870ae8129389a62df80c9c8c9165d334b6921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add ${AVUTIL_LIBRARIES} to soxr.pc.in so applications such as
shairport-sync will know that they must link with -lavutil when
building statically

Fixes:
 - http://autobuild.buildroot.org/results/839c0ce6475accc1de7e8a180d4358edb6750c64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: change patch to use Libs.private instead.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-soxr.pc.in-add-avutil-libraries.patch     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch b/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch
new file mode 100644
index 0000000000..c36988a77e
--- /dev/null
+++ b/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch
@@ -0,0 +1,33 @@
+From 8c1edfc22f8b714062b149e3d80ab4357a1a4e49 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 22 Nov 2018 19:10:03 +0100
+Subject: [PATCH] soxr.pc.in: add avutil libraries
+
+Add ${AVUTIL_LIBRARIES} to soxr.pc.in so applications such as
+shairport-sync will know that they must link with -lavutil when
+building statically
+
+Fixes:
+ - http://autobuild.buildroot.org/results/839c0ce6475accc1de7e8a180d4358edb6750c64
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/soxr/code/merge-requests/2]
+[Thomas: move to Libs.private.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/soxr.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/soxr.pc.in b/src/soxr.pc.in
+index 69d225b..ed212a8 100644
+--- a/src/soxr.pc.in
++++ b/src/soxr.pc.in
+@@ -2,4 +2,5 @@ Name: ${PROJECT_NAME}
+ Description: ${DESCRIPTION_SUMMARY}
+ Version: ${PROJECT_VERSION}
+ Libs: -L${LIB_INSTALL_DIR} -l${PROJECT_NAME}
++Libs.private: ${AVUTIL_LIBRARIES}
+ Cflags: -I${INCLUDE_INSTALL_DIR}
+-- 
+2.19.1
+
