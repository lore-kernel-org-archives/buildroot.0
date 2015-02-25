From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 Feb 2015 21:31:18 +0100
Subject: [Buildroot] [PATCH] dstat: add missing runtime dependency for
	Python curses
Message-ID: <1424896278-3731-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/dstat/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 63db87b..66a9789 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DSTAT
 	depends on BR2_USE_MMU # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_CURSES # runtime
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
 	  iostat, netstat and ifstat. Dstat overcomes some of their limitations
-- 
2.1.0
