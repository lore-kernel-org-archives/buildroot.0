From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 10:18:59 -0300
Subject: [Buildroot] [PATCH] screen: needs mmu
Message-ID: <1379423939-31019-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/screen/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/screen/Config.in b/package/screen/Config.in
index c232392..b5876e8 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SCREEN
 	bool "screen"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Screen is a full-screen window manager that multiplexes a physical
-- 
1.8.1.5
