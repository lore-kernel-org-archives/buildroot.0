From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] Remove last users of the
	ROOTFS_SUFFIX thing
Message-ID: <20100502220951.84A8D8ABA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=420cf17bffa7ad55b744b253bcb292f798a04b69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ROOTFS_SUFFIX thing has been removed in
325bfd1cbae03fe286796d3fa7de7c0a3227f7a5, so get rid of the last users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
