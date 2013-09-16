From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Sep 2013 07:41:07 -0300
Subject: [Buildroot] [PATCH] bellagio: needs dynamic library support
Message-ID: <1379328067-861-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/76e/76ebe0b9e963367427e23ba963f1bce6fd2725c4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bellagio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bellagio/Config.in b/package/bellagio/Config.in
index 3292ef5..921cc38 100644
--- a/package/bellagio/Config.in
+++ b/package/bellagio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BELLAGIO
 	bool "bellagio"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_HAS_OPENMAX
 	help
 	  Bellagio is an opensource implementation of the
@@ -16,5 +17,5 @@ config BR2_PACKAGE_BELLAGIO
 
 	  http://omxil.sourceforge.net/
 
-comment "bellagio requires a toolchain with C++ and threads support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "bellagio requires a toolchain with C++, threads and dynamic library support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-- 
1.8.1.5
