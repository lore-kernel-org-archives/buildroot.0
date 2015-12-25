From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:42 +0100
Subject: [Buildroot] [PATCH 13/84 RFC] package/gpsd: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <e775100d5bcb1abf806d0ebd207cb72512ec030d.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since there were multiple sub-menus, their prompts are turned into
comments.

Some option were missing a prompt, so add one. Add separating lines
around options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gpsd/Config.in | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index b4008eb..876ab9b 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -2,7 +2,7 @@ comment "gpsd needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_GPSD
+menuconfig BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
 	depends on BR2_USE_MMU
@@ -25,7 +25,7 @@ config BR2_PACKAGE_GPSD_DEVICES
 	string "Where to look for GPSes"
 	default "/dev/ttyS1"
 
-menu "Features"
+comment "Features"
 
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
@@ -50,36 +50,41 @@ config BR2_PACKAGE_GPSD_PPS
 
 config BR2_PACKAGE_GPSD_USER
 	bool "GPSD privilege revocation user"
+
 config BR2_PACKAGE_GPSD_USER_VALUE
-	string ""
+	string "user to run as"
 	default "nobody"
 	depends on BR2_PACKAGE_GPSD_USER
 
 config BR2_PACKAGE_GPSD_GROUP
 	bool "GPSD privilege revocation group"
+
 config BR2_PACKAGE_GPSD_GROUP_VALUE
-	string ""
+	string "group to run as"
 	default "nobody"
 	depends on BR2_PACKAGE_GPSD_GROUP
 
 config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
 	bool "compile with fixed serial port speed"
+
 config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE
-	string ""
+	int "serial port speed"
 	default "9600"
 	depends on BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
 
 config BR2_PACKAGE_GPSD_MAX_CLIENT
 	bool "compile with limited maximum clients"
+
 config BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE
-	string "compile with limited maximum clients"
+	int "maximum number of clients"
 	default "10"
 	depends on BR2_PACKAGE_GPSD_MAX_CLIENT
 
 config BR2_PACKAGE_GPSD_MAX_DEV
 	bool "compile with maximum allowed devices"
+
 config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
-	string "compile with maximum allowed devices"
+	int "maximum allowed devices"
 	default "2"
 	depends on BR2_PACKAGE_GPSD_MAX_DEV
 
@@ -94,9 +99,7 @@ config BR2_PACKAGE_GPSD_CONTROLSEND
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
-endmenu
-
-menu "Protocols"
+comment "Protocols"
 
 config BR2_PACKAGE_GPSD_AIVDM
 	bool "Aivdm"
@@ -231,6 +234,4 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
-endmenu
-
 endif
-- 
1.9.1
