From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 21 Apr 2021 15:17:23 +0200
Subject: [Buildroot] [PATCH] package/bluez5_utils: Clean up descriptions
Message-ID: <20210421131724.471288-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The descriptions in this package have grown pretty confusing over time.
Try to make this a bit more consistent and up-to-date.

* drop references to old kernel versions not supported by BR anymore
* Remove "Bluez 5.x" string from options
* consistently use the term "plugin" (plugins implement profiles)
* make mentioned profile appreviations upper-case
* make descriptions closer to the ones in BlueZ Readme [0]
* make clear that "tests" refers to the python test scripts

[0] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/README?h=5.58

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/bluez5_utils/Config.in | 45 ++++++++++++++++------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 016a16c4c5..f79155997a 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -11,13 +11,8 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  bluez utils version 5.x
 
-	  With this release BlueZ only supports the new Bluetooth
-	  Management kernel interface (introduced in Linux 3.4).
-
-	  For Low Energy support at least kernel version 3.5 is
-	  needed.
-
-	  The API is not backward compatible with BlueZ 4.
+	  Provides Stack, Library and Tooling for Bluetooth Classic
+	  and Bluetooth LE.
 
 	  Bluez utils will use systemd and/or udev if enabled.
 
@@ -31,7 +26,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_OBEX
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBICAL
 	help
-	  Enable the OBEX support in Bluez 5.x.
+	  Enable OBEX support.
 
 comment "OBEX support needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
@@ -40,75 +35,77 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	bool "build CLI client"
 	select BR2_PACKAGE_READLINE
 	help
-	  Enable the Bluez 5.x command line client.
+	  Build the command line client "bluetoothctl".
 
 config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
-	bool "install deprecated tool"
+	bool "install deprecated tools"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	help
-	  Build BlueZ 5.x deprecated tools. These currently include:
+	  Build deprecated tools. These currently include:
 	  hciattach, hciconfig, hcitool, hcidump, rfcomm, sdptool,
 	  ciptool, gatttool.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
-	bool "build experimental obexd plugin"
+	bool "build experimental tools"
 	help
-	  Build BlueZ 5.x experimental Nokia OBEX PC Suite plugin
+	  Build experimental tools. This is currently only the
+	  "Nokia OBEX PC Suite tool". So, only if OBEX support is
+	  enabled this option has an effect.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	bool "build health plugin"
 	help
-	  Build BlueZ 5.x health plugin
+	  Build plugin for health profiles.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
-	bool "build mesh profile"
+	bool "build mesh plugin"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	select BR2_PACKAGE_ELL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_READLINE
 	help
-	  Build BlueZ 5.x mesh plugin
+	  Build plugin for Mesh support.
 
 comment "mesh profile needs a toolchain w/ headers >= 4.12"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
-	bool "build midi profile"
+	bool "build midi plugin"
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	help
-	  Build BlueZ 5.x midi plugin
+	  Build MIDI support via ALSA sequencer.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
 	bool "build nfc plugin"
 	help
-	  Build BlueZ 5.x nfc plugin
+	  Build plugin for NFC pairing.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 	bool "build sap plugin"
 	help
-	  Build BlueZ 5.x sap plugin
+	  Build plugin for SAP profile.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
 	help
-	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock
+	  Build sixaxis plugin (support Sony Dualshock
 	  controller)
 
 comment "sixaxis plugin needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_BLUEZ5_UTILS_TEST
-	bool "build tests"
+	bool "install test scripts"
 	help
-	  Build BlueZ 5.x tests
+	  Install the python test scripts from the "test" directory.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
 	bool "build hid2hci tool"
 	depends on BR2_PACKAGE_HAS_UDEV
 	help
-	  Build BlueZ 5.x hid2hci tool
+	  Build hid2hci tool
 
 comment "hid2hci tool needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
-- 
2.25.1
