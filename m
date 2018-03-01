From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  1 Mar 2018 22:56:06 +0100
Subject: [Buildroot] [PATCH] qt: mark as obsolete
Message-ID: <20180301215606.3788-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt 4.x is no longer supported upstream since December 2015:

https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/

So it shouldn't be used for new projects.  Add an obsolete warning to the
package prompt to make this clear.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 4804a81537..0ecfafada5 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -3,7 +3,7 @@ comment "qt needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_QT
-	bool "Qt"
+	bool "Qt (obsolete)"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
2.11.0
