From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Nov 2018 20:04:56 +0100
Subject: [Buildroot] [PATCH 2/2] libsoxr: add avutil to soxr.pc
In-Reply-To: <20181122190456.17764-1-fontaine.fabrice@gmail.com>
References: <20181122190456.17764-1-fontaine.fabrice@gmail.com>
Message-ID: <20181122190456.17764-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ${AVUTIL_LIBRARIES} to soxr.pc.in so applications such as
shairport-sync will know that they must link with -lavutil when
building statically

Fixes:
 - http://autobuild.buildroot.org/results/839c0ce6475accc1de7e8a180d4358edb6750c64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-soxr.pc.in-add-avutil-libraries.patch     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch

diff --git a/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch b/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch
new file mode 100644
index 0000000000..449842184c
--- /dev/null
+++ b/package/libsoxr/0001-soxr.pc.in-add-avutil-libraries.patch
@@ -0,0 +1,32 @@
+From 0085d41d69adec9dea128f0cc023632c8f7eeb2d Mon Sep 17 00:00:00 2001
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
+---
+ src/soxr.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/soxr.pc.in b/src/soxr.pc.in
+index 69d225b..0a2e36b 100644
+--- a/src/soxr.pc.in
++++ b/src/soxr.pc.in
+@@ -1,5 +1,5 @@
+ Name: ${PROJECT_NAME}
+ Description: ${DESCRIPTION_SUMMARY}
+ Version: ${PROJECT_VERSION}
+-Libs: -L${LIB_INSTALL_DIR} -l${PROJECT_NAME}
++Libs: -L${LIB_INSTALL_DIR} -l${PROJECT_NAME} ${AVUTIL_LIBRARIES}
+ Cflags: -I${INCLUDE_INSTALL_DIR}
+-- 
+2.14.1
+
-- 
2.14.1
