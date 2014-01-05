From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 Jan 2014 08:01:35 -0300
Subject: [Buildroot] [PATCH] tn5250: needs mmu
Message-ID: <1388919695-23793-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/02c/02cedc329c355255e9f9b3b87aa2777de321d1a4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tn5250/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tn5250/Config.in b/package/tn5250/Config.in
index 807def0..01be40b 100644
--- a/package/tn5250/Config.in
+++ b/package/tn5250/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TN5250
 	bool "tn5250"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Telnet client that emulates 5250 terminals and printers.
-- 
1.8.3.2
