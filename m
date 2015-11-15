From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 15 Nov 2015 20:55:32 +0100
Subject: [Buildroot] [PATCH for-2015.11] uboot: fix ARCH for i386 and x86_64
Message-ID: <1447617332-3500-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This could perhaps be refactored with similar handling of
KERNEL_ARCH_PATH in linux.mk. But that's for someone else :-)
---
 boot/uboot/uboot.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 66e728f..0e3f808 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -72,9 +72,11 @@ UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
 # The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
-# we have to special case it.
+# we have to special case it. Similar for i386/x86_64 -> x86
 ifeq ($(KERNEL_ARCH),arm64)
 UBOOT_ARCH = arm
+else ifneq ($(filter $(KERNEL_ARCH),i386 x86_64),)
+UBOOT_ARCH = x86
 else
 UBOOT_ARCH = $(KERNEL_ARCH)
 endif
-- 
2.6.2
