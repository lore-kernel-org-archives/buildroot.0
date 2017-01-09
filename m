From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 15:08:19 +0100
Subject: [Buildroot] [git commit] cjson: bump version to v1.2.0
Message-ID: <20170109140828.C6DC681DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cd0f493d68a92b63e2f6a21b7ea7ea8c26a844a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove the patch since it's already contained in this release.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 3 +--
 package/cjson/cjson.mk   | 8 +-------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index fc0ed28..a6370de 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,2 @@
 # Locally computed:
-sha256	3487795d54440bdbd41b4b8e7688889526f2f9a652639f6036b9965016c800e7	cjson-v1.1.0.tar.gz
-sha256	8eea780ee5729275a5076002d92a4c7854ecb89968b26a81efeb5bd9828268a0	fcc89c4bb264d665929b00eeebc479a643a90896.patch
+sha256 df549298ea6515058648eaacc62bcc4f82fa34f8b93af7753e30eb35c3841c7d  cjson-v1.2.0.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 7ac7a71..f0fe63b 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,16 +4,10 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.1.0
+CJSON_VERSION = v1.2.0
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
 
-# This patch fixes -Werror=strict-overflow compile errors on sh4a and powerpc
-# toolchains:
-# http://autobuild.buildroot.net/results/3d899790acdc5c21733ff6f7f5a1b500e862ea0a
-CJSON_PATCH = \
-	https://github.com/DaveGamble/cjson/commit/fcc89c4bb264d665929b00eeebc479a643a90896.patch
-
 $(eval $(cmake-package))
