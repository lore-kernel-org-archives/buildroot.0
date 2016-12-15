From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Dec 2016 19:08:59 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: fix error with sh4a and powerpc
Message-ID: <1481825339-921-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/3d899790acdc5c21733ff6f7f5a1b500e862ea0a

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/cjson/cjson.hash | 1 +
 package/cjson/cjson.mk   | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 4f0723a..fc0ed28 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	3487795d54440bdbd41b4b8e7688889526f2f9a652639f6036b9965016c800e7	cjson-v1.1.0.tar.gz
+sha256	8eea780ee5729275a5076002d92a4c7854ecb89968b26a81efeb5bd9828268a0	fcc89c4bb264d665929b00eeebc479a643a90896.patch
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 3dd6ebc..7ac7a71 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -10,4 +10,10 @@ CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
 
+# This patch fixes -Werror=strict-overflow compile errors on sh4a and powerpc
+# toolchains:
+# http://autobuild.buildroot.net/results/3d899790acdc5c21733ff6f7f5a1b500e862ea0a
+CJSON_PATCH = \
+	https://github.com/DaveGamble/cjson/commit/fcc89c4bb264d665929b00eeebc479a643a90896.patch
+
 $(eval $(cmake-package))
-- 
2.5.0
