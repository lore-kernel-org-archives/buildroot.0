From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:29 -0500
Subject: [Buildroot] [PATCH 46/67] sconeserver: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-47-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sconeserver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 60ae2ae..e9b51c0 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
 	depends on BR2_USE_WCHAR # bluez->libglib2
 	depends on BR2_USE_MMU # bluez->dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus, bluez->libglib2
 	depends on !BR2_avr32 # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
-- 
1.8.1.2
