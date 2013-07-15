From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:01 -0500
Subject: [Buildroot] [PATCH 18/67] gmpc: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-19-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gmpc/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 9b38d1a..96dc58f 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -19,5 +20,6 @@ config BR2_PACKAGE_GMPC
 
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
-comment "gmpc requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
+comment "gmpc requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
