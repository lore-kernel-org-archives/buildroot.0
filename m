From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:16:37 +0100
Subject: [Buildroot] [git commit] uboot: fix ARCH for i386 and x86_64
Message-ID: <20151116201822.9E0D481E1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a730a92a3691a7c2bafcc6373a96d47e3d687bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
