From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 19:37:46 +0200
Subject: [Buildroot] [git commit] sconeserver/libedbus: fix missing avr32
	arch exclusions
Message-ID: <20130627174331.01A7E9AF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e957ce41d472301f6f0f21d7740d6df8524cbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix missing avr32 arch exclusions regarding bluez_utils being
unavailable. Fixes:
http://autobuild.buildroot.net/results/789/78901c36517b1d897a1200ccddd79afec8a605de/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libedbus/Config.in |    1 +
 package/sconeserver/Config.in  |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
