From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:22:02 +0200
Subject: [Buildroot] [git commit] libkcapi: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20180517202121.7C9E289010@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=739383f855dc5d95fe24d8e2eb08a2548f44d370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
https://github.com/smuellerDD/libkcapi/commit/4d0a5c235536b5f679e6a9b0c847f56c9cfc3835,
libkcapi uses __sync_add_and_fetch_4 and __sync_sub_and_fetch_4

Fixes:
 - http://autobuild.buildroot.net/results/de5e136ea433633d836bff1d2ac1d3b461391b83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkcapi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 7397cfe800..1dbcdc381b 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBKCAPI
 	bool "libkcapi"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  Linux Kernel Crypto API userspace interface library
 
