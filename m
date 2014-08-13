From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 13 Aug 2014 11:04:03 +0530
Subject: [Buildroot] [PATCH] tftpd: depends on MMU
Message-ID: <1407908043-2700-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/3e1/3e16d8c9ae3b77393e082c3dd9b7b3de9aa040c0//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/tftpd/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
index 6f5916d..609b5d1 100644
--- a/package/tftpd/Config.in
+++ b/package/tftpd/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_TFTPD
 	bool "tftpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  HPA's Trivial File Transfer Protocol (tftp) server.
-- 
1.7.9.5
