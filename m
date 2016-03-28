From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 18:03:36 -0300
Subject: [Buildroot] [PATCH] boot/grub2: enable squashfs support by default
Message-ID: <1459199016-19064-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Size growth is minimal and generally a non-issue for x86-based
platforms.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/grub2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index c465a4d..7dc5cae 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -154,8 +154,8 @@ endif # BR2_TARGET_GRUB2_I386_PC
 
 config BR2_TARGET_GRUB2_BUILTIN_MODULES
 	string "builtin modules"
-	default "boot linux ext2 fat part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
-	default "boot linux ext2 fat part_msdos part_gpt normal efi_gop" \
+	default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
+	default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
 		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
 
 config BR2_TARGET_GRUB2_BUILTIN_CONFIG
-- 
2.7.3
