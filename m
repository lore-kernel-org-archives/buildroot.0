From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 15 Aug 2013 14:39:06 +0100
Subject: [Buildroot] [PATCH] webkit: Fix comment dependency for
	BR2_PACKAGE_LIBGTK2
Message-ID: <1376573946-22138-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment should only be displayed if BR2_PACKAGE_LIBGTK2
is not selected.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/webkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 92cbc62..6cce6f1 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -24,5 +24,5 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit requires libgtk2 and a toolchain with C++, WCHAR, threading support"
-	depends on BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.3.2
