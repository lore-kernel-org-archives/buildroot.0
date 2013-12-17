From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 17 Dec 2013 11:28:38 +0000
Subject: [Buildroot] [PATCH] bonnie: does not support static builds
Message-ID: <1387279718-6528-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes autobuild failues such as the following.

  http://autobuild.buildroot.net/results/bb9/bb9665a957e4fed25dff3e36bbf105c523dcf0a7/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/bonnie/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 6dbd06d..a4a50f8 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_BONNIE
 	bool "bonnie++"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Filesystem tester
 
 	  http://www.coker.com.au/bonnie++/
 
-comment "bonnie++ needs a toolchain w/ C++"
+comment "bonnie++ needs a toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP	|| BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
