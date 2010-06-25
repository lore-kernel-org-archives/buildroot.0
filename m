From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jun 2010 00:02:27 +0200
Subject: [Buildroot] [PATCH 1/2] initramfs: only show the option when a
	Linux kernel is being built
In-Reply-To: <cover.1277503341.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277503341.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fef53661beee28d2ba24a5a286540bad07e69236.1277503341.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #2119.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/initramfs/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index d53982c..94875b8 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_INITRAMFS
 	bool "initramfs for initial ramdisk of linux kernel"
+	depends on BR2_LINUX_KERNEL
 	help
 	  Build a file which is usable for the gen_init_cpio tool
 	  at linux kernel build.
@@ -13,3 +14,6 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  Device Drivers -> Block devices -> Initramfs source file(s).
 	  The configuration variable is CONFIG_INITRAMFS_SOURCE
 
+comment "initramfs requires a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
-- 
1.7.0.4
