From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun,  3 Nov 2013 09:56:25 +0000
Subject: [Buildroot] [PATCH] util-linux: disable fallocate for avr32
Message-ID: <1383472585-1876-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The fallocate syscall is not implemented in the avr32 toolchain.

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/bc4/bc41a3fea20181526eb247ac910244aa2aa4c4c0/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 41e0986..d56e631 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	bool "fallocate"
+	depends on !BR2_avr32 # fallocate not implemented
 	help
 	  Preallocate space to a file
 
-- 
1.8.3.2
