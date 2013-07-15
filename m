From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:31 -0500
Subject: [Buildroot] [PATCH 48/67] snowball-init: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-49-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/snowball-init/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
index 99abb35..33d3fa0 100644
--- a/package/snowball-init/Config.in
+++ b/package/snowball-init/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SNOWBALL_INIT
 	select BR2_PACKAGE_BLUEZ_UTILS
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_UX500_FIRMWARE
 	help
@@ -12,3 +12,6 @@ config BR2_PACKAGE_SNOWBALL_INIT
 
 	  http://www.igloocommunity.org
 
+comment "snowball-init requires a toolchain with WCHAR, threading, and MMU support"
+	depends on !BR2_avr32 && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU)
-- 
1.8.1.2
