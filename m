From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 27 Jul 2014 13:24:11 -0400
Subject: [Buildroot] [PATCH 1/1] system: move tz setup outside of default
	skeleton clause
Message-ID: <1406481852-15592-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow time zone setup and installation for configurations
using custom skeletons as well as default skeletons.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 system/Config.in |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 1be7e5d..e7e146a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -267,6 +267,19 @@ config BR2_TARGET_GENERIC_GETTY_OPTIONS
 endmenu
 endif
 
+config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	bool "remount root filesystem read-write during boot"
+	default y
+	help
+	  The root filesystem is typically mounted read-only at boot.
+	  By default, buildroot remounts it in read-write mode early during the
+	  boot process.
+	  Say no here if you would rather like your root filesystem to remain
+	  read-only.
+	  If unsure, say Y.
+
+endif # BR2_ROOTFS_SKELETON_DEFAULT
+
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
 	# No timezone for musl; only for uClibc or (e)glibc.
@@ -306,19 +319,6 @@ config BR2_TARGET_LOCALTIME
 
 endif # BR2_TARGET_TZ_INFO
 
-config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
-	bool "remount root filesystem read-write during boot"
-	default y
-	help
-	  The root filesystem is typically mounted read-only at boot.
-	  By default, buildroot remounts it in read-write mode early during the
-	  boot process.
-	  Say no here if you would rather like your root filesystem to remain
-	  read-only.
-	  If unsure, say Y.
-
-endif # BR2_ROOTFS_SKELETON_DEFAULT
-
 config BR2_ROOTFS_USERS_TABLES
 	string "Path to the users tables"
 	help
-- 
1.7.9.5
