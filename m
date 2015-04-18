From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 18 Apr 2015 16:27:43 -0400
Subject: [Buildroot] [PATCH v2 2/3] uboot: deprecate
	BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
In-Reply-To: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
References: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1429388864-15377-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Users should use BR2_TARGET_UBOOT_PATCH instead.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Made BR2_TARGET_UBOOT_PATCH naming consistent with kernel
    naming, since using linux.mk patch strategy now

 boot/uboot/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 768daa7..a2e8e94 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -71,6 +71,7 @@ config BR2_TARGET_UBOOT_VERSION
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG

 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	string "custom patch dir"
 	help
 	  If your board requires custom patches, add the path to the
@@ -79,6 +80,8 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR

 	  Most users may leave this empty

+	  NOTE: Use BR2_TARGET_UBOOT_PATCH instead.
+
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
 	help
--
1.9.1
