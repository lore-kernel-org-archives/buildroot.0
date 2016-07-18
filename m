From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:45:29 +0200
Subject: [Buildroot] [git commit] system: move the rootfs skeleton choice
Message-ID: <20160718214638.3741680153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a661e0ba5eb44d8d9fbd8845b3c4e6cc28c728c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the following commits, we'll be switching more options to be
conditional on the default or custom skeleton.

So, it makes sense that those options come after the choice of a
skeleton.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 56 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 6fce8e1..5549318 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,5 +1,33 @@
 menu "System configuration"
 
+choice
+	prompt "Root FS skeleton"
+
+config BR2_ROOTFS_SKELETON_DEFAULT
+	bool "default target skeleton"
+	help
+	  Use default target skeleton
+
+config BR2_ROOTFS_SKELETON_CUSTOM
+	bool "custom target skeleton"
+	help
+	  Use custom target skeleton.
+
+endchoice
+
+if BR2_ROOTFS_SKELETON_CUSTOM
+
+config BR2_ROOTFS_SKELETON_CUSTOM_PATH
+	string "custom target skeleton path"
+	help
+	  Path to custom target skeleton.
+
+# dummy config so merged /usr workarounds can also be activated for
+# custom rootfs skeleton
+config BR2_ROOTFS_MERGED_USR
+
+endif
+
 config BR2_TARGET_GENERIC_HOSTNAME
 	string "System hostname"
 	default "buildroot"
@@ -168,34 +196,6 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	help
 	  Support extended attributes handling in device tables
 
-choice
-	prompt "Root FS skeleton"
-
-config BR2_ROOTFS_SKELETON_DEFAULT
-	bool "default target skeleton"
-	help
-	  Use default target skeleton
-
-config BR2_ROOTFS_SKELETON_CUSTOM
-	bool "custom target skeleton"
-	help
-	  Use custom target skeleton.
-
-endchoice
-
-if BR2_ROOTFS_SKELETON_CUSTOM
-
-config BR2_ROOTFS_SKELETON_CUSTOM_PATH
-	string "custom target skeleton path"
-	help
-	  Path to custom target skeleton.
-
-# dummy config so merged /usr workarounds can also be activated for
-# custom rootfs skeleton
-config BR2_ROOTFS_MERGED_USR
-
-endif
-
 if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_MERGED_USR
