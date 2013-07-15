From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:38 -0500
Subject: [Buildroot] [PATCH 55/67] webkit: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-56-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/webkit/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index c6711b8..92cbc62 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # enchant -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
@@ -22,5 +23,6 @@ config BR2_PACKAGE_WEBKIT
 
 	  http://webkit.org/
 
-comment "webkit requires C++, WCHAR in toolchain and libgtk2"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
+comment "webkit requires libgtk2 and a toolchain with C++, WCHAR, threading support"
+	depends on BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
