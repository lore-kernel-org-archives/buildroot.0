From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 17 Apr 2015 16:26:14 -0400
Subject: [Buildroot] [PATCH 2/3] uboot: deprecate
	BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
In-Reply-To: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
References: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1429302375-12275-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Users should use BR2_TARGET_UBOOT_PATCHES instead.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 boot/uboot/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 32fcb21..6d42d49 100644
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
 
+	  NOTE: Use BR2_TARGET_UBOOT_PATCHES instead.
+
 config BR2_TARGET_UBOOT_PATCHES
 	string "custom patches"
 	help
-- 
1.9.1
