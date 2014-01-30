From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jan 2014 17:39:33 -0300
Subject: [Buildroot] [PATCH] fswebcam: needs mmu
Message-ID: <1391114373-16653-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/62b/62b74b3c8024f362035003450676bfcc36c7171a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fswebcam/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
index 7724639..a894d3b 100644
--- a/package/fswebcam/Config.in
+++ b/package/fswebcam/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FSWEBCAM
 	bool "fswebcam"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
-- 
1.8.3.2
