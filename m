From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 11 Nov 2013 10:20:34 +0000
Subject: [Buildroot] [PATCH] iozone: depends on threads
Message-ID: <1384165234-18705-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/iozone/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 33e12ca..6638b7c 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -2,8 +2,14 @@ config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_UCLIBC_VERSION_0_9_31 # no pthread_setaffinity_np
+	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
 
 	  http://www.iozone.org/
+
+comment "iozone needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_UCLIBC_VERSION_0_9_31
+	depends on !(BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC)
-- 
1.8.3.2
