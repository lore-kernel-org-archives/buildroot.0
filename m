From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 May 2017 09:28:27 +0300
Subject: [Buildroot] [PATCH] bluez5_utils: fix build of gatttool
Message-ID: <813b44550d7406827f9307514a8386b4462b854d.1493620107.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since BlueZ 5.44 gatttool is hidden behind the --enable-deprecated configure
option.

Also, update the help text with the new status of gatttool.

Fixes:
http://autobuild.buildroot.net/results/ddb/ddb975c9e1475fee1da63cb21240d8d59b161076/
http://autobuild.buildroot.net/results/19a/19adc0aa5a7e48119ef4ba25ba0403867f74f678/
http://autobuild.buildroot.net/results/9bd/9bd8e13ddffdd0631ddca30ec40cc4664729b0cb/

Cc: Marcin Bis <marcin@bis.org.pl>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bluez5_utils/Config.in       | 5 ++---
 package/bluez5_utils/bluez5_utils.mk | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 3611c6971a6d..43771c026438 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -54,10 +54,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 	help
 	  Generic Attribute Profile (GATT) support. This provides
 	  profile discovery and description services for Bluetooth Low
-	  Energy. This will install the gatttool utility.
+	  Energy. This will build and install the gatttool utility.
 
-	  It is always built with BlueZ 5.x, but upstream choose not
-	  to install it by default.
+	  The gatttool is deprecated.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	bool "build experimental plugins"
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index aaefcb6ace9b..e5482455d283 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -51,6 +51,7 @@ define BLUEZ5_UTILS_INSTALL_GATTTOOL
 	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
 endef
 BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+BLUEZ5_UTILS_CONF_OPTS += --enable-deprecated
 endif
 
 # enable test
-- 
2.11.0
