From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:20 -0500
Subject: [Buildroot] [PATCH 37/67] neardal: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-38-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor cleanups as well

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/neardal/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index 76b5ffa..3841cac 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NEARDAL
 	bool "neardal"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
@@ -11,11 +11,14 @@ config BR2_PACKAGE_NEARDAL
 
 	  https://github.com/connectivity/neardal
 
+if BR2_PACKAGE_NEARDAL
+
 config BR2_PACKAGE_NEARDAL_NCL
 	bool "ncl tool"
-	depends on BR2_PACKAGE_NEARDAL
 	help
 	  Build and install neardal ncl command line interpreter tool.
 
-comment "neardal requires a toolchain with WCHAR and threads support"
+endif
+
+comment "neardal requires a toolchain with WCHAR and threading support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
