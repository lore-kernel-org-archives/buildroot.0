From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:27 -0500
Subject: [Buildroot] [PATCH 44/67] pkg-config: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-45-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/pkg-config/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index 7f96d9b..bf702d0 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -11,5 +12,5 @@ config BR2_PACKAGE_PKG_CONFIG
 
 	  http://www.freedesktop.org/software/pkgconfig/
 
-comment "pkg-config requires a toolchain with WCHAR support"
-	depends on BR2_DEPRECATED && !BR2_USE_WCHAR
+comment "pkg-config requires a toolchain with WCHAR and threading support"
+	depends on BR2_DEPRECATED && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
