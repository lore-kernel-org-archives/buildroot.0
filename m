From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 May 2014 23:26:03 +0200
Subject: [Buildroot] [git commit] connman: cleanup Config.in
Message-ID: <20140601083246.CD82A9C779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=019188d2ee8705717e8e5840f21e47ef043433d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformat help text to fit in menuconfig, slightly tweak wording, strip
trailing spaces and clarify that wpa_supplicant is only a runtime
dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 3d11843..ea1fb71 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -10,9 +10,9 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	help
-	  The Connection Manager (ConnMan) project provides a daemon for
-	  managing internet connections within embedded devices running
-	  the Linux operating system.
+	  The Connection Manager (ConnMan) project provides a daemon
+	  for managing internet connections within embedded devices
+	  running the Linux operating system.
 
 	  For more information, see http://connman.net/
 
@@ -24,10 +24,11 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
-	select BR2_PACKAGE_WPA_SUPPLICANT
+	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
 	help
-	  Enable WiFi support (scan and static/dhcp interface setup). ConnMan 
-	  detect the start of wpa_supplicant automatically.
+	  Enable WiFi support (scan and static/dhcp interface
+	  setup). ConnMan detects the start of wpa_supplicant
+	  automatically.
 
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
@@ -40,8 +41,9 @@ config BR2_PACKAGE_CONNMAN_WISPR
 config BR2_PACKAGE_CONNMAN_BLUETOOTH
 	bool "enable Bluetooth support"
 	help
-	  Enable Bluetooth (PAN profile) support. The start of bluetoothd is 
-	  automatically detected and only a runtime dependency. 
+	  Enable Bluetooth (PAN profile) support. The start of
+	  bluetoothd is automatically detected and only a runtime
+	  dependency.
 
 config BR2_PACKAGE_CONNMAN_LOOPBACK
 	bool "enable loopback support"
