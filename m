From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Jun 2013 08:57:17 -0300
Subject: [Buildroot] [PATCH] mutt: needs mmu
Message-ID: <1370951837-31989-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8ce/8ceec55fa8358d8821f2deaf3440f5b06270db6a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mutt/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 754979a..bb97cb0 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MUTT
 	bool "mutt"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Mutt is a sophisticated text-based Mail User Agent (MUA)
-- 
1.8.1.5
