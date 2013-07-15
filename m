From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:19 -0500
Subject: [Buildroot] [PATCH 36/67] neard: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-37-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor clean up as well

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/neard/Config.in | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index ec1fcb3..b23a154 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NEARD
 	bool "neard"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl / dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,11 +14,14 @@ config BR2_PACKAGE_NEARD
 
 	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
 
+if BR2_PACKAGE_NEARD
+
 config BR2_PACKAGE_NEARD_TOOLS
 	bool "neard tools"
-	depends on BR2_PACKAGE_NEARD
 	help
 	  Build and install neard tools.
 
-comment "neard requires a toolchain with WCHAR and threads support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+endif
+
+comment "neard requires an MMU and a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_MMU || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
