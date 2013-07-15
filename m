From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:25 -0500
Subject: [Buildroot] [PATCH 42/67] pango: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-43-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/pango/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pango/Config.in b/package/pango/Config.in
index 6c8a160..845ea98 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
@@ -18,5 +19,6 @@ config BR2_PACKAGE_PANGO
 
 	  http://www.pango.org/
 
-comment "pango requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "pango requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
1.8.1.2
