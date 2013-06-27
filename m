From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 11:03:11 -0300
Subject: [Buildroot] [PATCH] sconeserver/libedbus: fix missing avr32 arch
	exclusions
Message-ID: <1372341791-18200-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix missing avr32 arch exclusions regarding bluez_utils being
unavailable. Fixes:
http://autobuild.buildroot.net/results/789/78901c36517b1d897a1200ccddd79afec8a605de/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/efl/libedbus/Config.in | 1 +
 package/sconeserver/Config.in  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 9b57592..64b001e 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_LIBEDBUS
 
 config BR2_PACKAGE_LIBEDBUS_BLUEZ
 	bool "bluez support"
+	depends on !BR2_avr32 # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth support.
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index a467476..60ae2ae 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -43,6 +43,7 @@ config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	depends on BR2_USE_WCHAR # bluez->libglib2
 	depends on BR2_USE_MMU # bluez->dbus
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez->dbus
+	depends on !BR2_avr32 # bluez_utils
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Bluetooth module for Sconeserver
-- 
1.8.1.5
