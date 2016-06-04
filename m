From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 19:27:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/wiringpi: uses fork(), needs mmu
Message-ID: <1465061225-26087-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c60/c6013c214674f9802309d8cd770d3da2f751674d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wiringpi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
index 9275b82..a292b3f 100644
--- a/package/wiringpi/Config.in
+++ b/package/wiringpi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WIRINGPI
 	bool "wiringpi"
+	depends on BR2_USE_MMU # fork()
 	help
 	  wiringPi libraries (and gpio command)
 
-- 
2.8.1
