From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:00 -0500
Subject: [Buildroot] [PATCH 17/67] glibmm: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-18-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/glibmm/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index cd4ac01..fddd5e4 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	help
 	  The GLibmm package is a set of C++ bindings for GLib.
 
 	  http://www.gtkmm.org/
 
-comment "glibmm requires a toolchain with C++ & WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "glibmm requires a toolchain with C++, WCHAR, and threading support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
