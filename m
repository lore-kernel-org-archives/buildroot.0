From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:05:07 +0200
Subject: [Buildroot] [git commit] bluez5_utils: rename options to have the
 proper suffix
Message-ID: <20180521212026.E1EB8815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2b874fe678653d348a1d00bd11aad50ca383c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bluez5_utils Config.in options had a bogus prefix:
BR2_PACKAGE_BLUEZ5 instead of the expected
BR2_PACKAGE_BLUEZ5_UTILS. This commit fixes that, and adds the
appropriate Config.in.legacy handling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 45 ++++++++++++++++++++++++++++++++++++
 package/bluez5_utils/Config.in       | 10 ++++----
 package/bluez5_utils/bluez5_utils.mk | 10 ++++----
 3 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1494704221..e5b313f23d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,51 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
+	bool "bluez5-utils health plugin option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH has been renamed to
+	  BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH.
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI
+	bool "bluez5-utils midi plugin option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI has been renamed to
+	  BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI.
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_NFC
+	bool "bluez5-utils nfc plugin option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_BLUEZ5_PLUGINS_NFC has been renamed to
+	  BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC.
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_SAP
+	bool "bluez5-utils sap plugin option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_BLUEZ5_PLUGINS_SAP has been renamed to
+	  BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP.
+
+config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
+	bool "bluez5-utils sixaxis plugin option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
+	help
+	  For consistency reasons, the option
+	  BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS has been renamed to
+	  BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS.
+
 config BR2_PACKAGE_TRANSMISSION_REMOTE
 	bool "transmission remote tool option removed"
 	select BR2_LEGACY
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 55831e9b61..c5e8dfbcf7 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -56,29 +56,29 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	help
 	  Build BlueZ 5.x experimental Nokia OBEX PC Suite plugin
 
-config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	bool "build health plugin"
 	help
 	  Build BlueZ 5.x health plugin
 
-config BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
 	bool "build midi profile"
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	help
 	  Build BlueZ 5.x midi plugin
 
-config BR2_PACKAGE_BLUEZ5_PLUGINS_NFC
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
 	bool "build nfc plugin"
 	help
 	  Build BlueZ 5.x nfc plugin
 
-config BR2_PACKAGE_BLUEZ5_PLUGINS_SAP
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 	bool "build sap plugin"
 	help
 	  Build BlueZ 5.x sap plugin
 
-config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
+config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
 	help
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 3189855624..aff1fd9796 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -41,14 +41,14 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
 # enable health plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-health
 else
 BLUEZ5_UTILS_CONF_OPTS += --disable-health
 endif
 
 # enable midi profile
-ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-midi
 BLUEZ5_UTILS_DEPENDENCIES += alsa-lib
 else
@@ -56,21 +56,21 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-midi
 endif
 
 # enable nfc plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_NFC),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-nfc
 else
 BLUEZ5_UTILS_CONF_OPTS += --disable-nfc
 endif
 
 # enable sap plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SAP),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-sap
 else
 BLUEZ5_UTILS_CONF_OPTS += --disable-sap
 endif
 
 # enable sixaxis plugin
-ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS),y)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis
 else
 BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
