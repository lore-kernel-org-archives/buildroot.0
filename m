From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:13 -0500
Subject: [Buildroot] [PATCH 30/67] librsvg: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-31-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/librsvg/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index b2ef6ad..ce711f7 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The rsvg library is an efficient renderer for Scalable
@@ -14,5 +15,5 @@ config BR2_PACKAGE_LIBRSVG
 
 	  http://librsvg.sourceforge.net/
 
-comment "librsvg requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+comment "librsvg requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
1.8.1.2
