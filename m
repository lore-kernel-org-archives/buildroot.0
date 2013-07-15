From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:53 -0500
Subject: [Buildroot] [PATCH 10/67] libedbus: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-11-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/efl/libedbus/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 64b001e..31a3b03 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -17,10 +17,15 @@ if BR2_PACKAGE_LIBEDBUS
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
 	depends on !BR2_avr32 # bluez_utils
+	depends on BR2_USE_WCHAR # bluez_utils -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> glib2
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
 
+comment "bluez support requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBEDBUS_CONNMAN
 	bool "connman support"
 	depends on BR2_PACKAGE_CONNMAN
-- 
1.8.1.2
