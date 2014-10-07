From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Tue, 7 Oct 2014 19:41:38 +0530
Subject: [Buildroot] [PATCH] ympd: Depends on MMU
Message-ID: <1412691098-2614-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/834/8340e69763e263fcf20e73f75eafcb31989e9f51//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/ympd/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index 0223af7..38a0cf9 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_YMPD
 	bool "ympd"
 	select BR2_PACKAGE_LIBMPDCLIENT
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE
 	help
-- 
1.7.9.5
