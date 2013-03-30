From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 30 Mar 2013 17:55:19 +0100
Subject: [Buildroot] [PATCH] qtuio: depends on QT4
Message-ID: <1364662519-2385-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/e6501a7a487ec3a02463ad0f3aa60168883fa369/

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/qtuio/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
index 19499fd..590b2de 100644
--- a/package/qtuio/Config.in
+++ b/package/qtuio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QTUIO
 	bool "qtuio"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
+	depends on BR2_PACKAGE_QT_GUI_MODULE && !BR2_PACKAGE_QT5
 	help
 	  Implementation of an interface connecting TUIO messages
 	  and QT events
@@ -16,3 +16,5 @@ config BR2_QTUIO_EXAMPLES
 comment "qtuio depends on QT gui module"
 	depends on !BR2_PACKAGE_QT_GUI_MODULE
 
+comment "qtuio requires QT4"
+	depends on BR2_PACKAGE_QT5
-- 
1.7.0.4
