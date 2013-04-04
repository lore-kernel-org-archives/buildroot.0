From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu,  4 Apr 2013 16:09:19 -0700
Subject: [Buildroot] [PATCH] aircrack-ng: needs toolchain with threads
	support
Message-ID: <1365116959-25148-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/418c9385a9a5a5087a6790001560056d32cd9708

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/aircrack-ng/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 319b7c4..daea48f 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -4,11 +4,12 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_IW # runtime
+	depends on BR2_TOOLCHAIN_HAS_THREADS # iw
 	help
 	  A set of tools for auditing wireless networks
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain with largefile support"
-	depends on !BR2_LARGEFILE
+comment "aircrack-ng needs a toolchain with largefile and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
1.7.4.1
