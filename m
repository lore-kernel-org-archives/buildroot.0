From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:54 +0200
Subject: [Buildroot] [PATCH 13/19] Remove latest users of the ROOTFS_SUFFIX
	thing
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <44c71d4d5c6a38e82f4c9b1a571ff2ed48a6b823.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ROOTFS_SUFFIX thing has been removed in
325bfd1cbae03fe286796d3fa7de7c0a3227f7a5, so get rid of the latest
users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/linux/Makefile.in          |    3 +--
 target/linux/Makefile.in.advanced |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index ea74409..6983d25 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -62,10 +62,9 @@ endif
 endif
 endif
 
-ROOTFS_STRIPPED_SUFFIX=$(call qstrip,$(ROOTFS_SUFFIX))
 # File name for the Linux kernel binary
 ifndef LINUX26_KERNEL
-LINUX26_KERNEL_NAME=$(BINARIES_DIR)/$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
+LINUX26_KERNEL_NAME=$(BINARIES_DIR)/$(LINUX26_FORMAT)
 endif
 
 # Version of Linux AFTER patches
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index a95852d..9e495f3 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -155,10 +155,9 @@ LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
 endif
 endif
 
-ROOTFS_STRIPPED_SUFFIX=$(call qstrip,$(ROOTFS_SUFFIX))
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
+LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)
 
 
 ifeq ($(BOARD_NAME),)
-- 
1.6.3.3
