From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:02:05 +0200
Subject: [Buildroot] [git commit] boot/grub2: enable squashfs support by
	default
Message-ID: <20160329010224.40AB0803D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09a44ddd447ffcfff7fa4c230785fc4368d3a1e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Size growth is minimal and generally a non-issue for x86-based
platforms.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
