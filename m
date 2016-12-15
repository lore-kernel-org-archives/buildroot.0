From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 22:10:30 +0100
Subject: [Buildroot] [git commit] cjson: fix error with sh4a and powerpc
Message-ID: <20161215211113.6818381E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f11de1a60064c91245411c06771141c90ca67c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/3d899790acdc5c21733ff6f7f5a1b500e862ea0a

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
