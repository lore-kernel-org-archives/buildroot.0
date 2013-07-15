From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:03 -0500
Subject: [Buildroot] [PATCH 20/67] gvfs: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-21-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gvfs/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index e0a945e..63c4996 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GVFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU # dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
@@ -16,5 +16,5 @@ config BR2_PACKAGE_GVFS
 
 	  http://en.wikipedia.org/wiki/GVFS
 
-comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "gvfs requires a toolchain with LARGEFILE, WCHAR and threading support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
