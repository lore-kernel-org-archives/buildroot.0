From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Mon, 28 Jul 2014 19:28:14 +0530
Subject: [Buildroot] [PATCH] ltris: needs MMU
Message-ID: <1406555895-2671-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/5cf/5cf2262460a72ce51b479a42fca61cea5f6e23fd//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/ltris/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ltris/Config.in b/package/ltris/Config.in
index b4e0ccf..bf5240d 100644
--- a/package/ltris/Config.in
+++ b/package/ltris/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LTRIS
 	bool "LTris"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
-- 
1.7.9.5
