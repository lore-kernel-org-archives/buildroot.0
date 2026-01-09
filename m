Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DA9D26D92
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 18:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4932E60EF8;
	Fri,  9 Jan 2026 18:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ffrylMfm2KP; Fri,  9 Jan 2026 18:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F44B60EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767983860;
	bh=gpkcUctXroTGeDbdHS4lTDdVc9qhOcYZXGHljQbHZ5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dd2/uR891tDFR8r0gzqabhtGSh/uFRHjR8J+4hUrJRsV4z487VJDSAXe7cQI25Luf
	 anZjftKgt+/6Hq1D7neYreNK1TROO74Mg4cEeWwmb1rdJXeGgl7cIDrXNKUoN/ncml
	 pVHn8R0ah8hRv3rmk5NhsYbxkyVQw6i0H7JHlJaulaiUeHFmgYjjv9/6axU98deQOX
	 kuNgbFx+qBpCrYUqoZJ/23Jq+ABW6SwWfMHI/j55gCLZKPKW9zuiX1mDACpNcv/uhk
	 LWqy5AMMPnok1NiDWg+0t4DL4G9m5lR+Rt+JkZbP5hxGcAjujYgIdm4WH7eYEk96VK
	 mZ8PeawfTBJ/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F44B60EF9;
	Fri,  9 Jan 2026 18:37:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFA60278
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E274183C34
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4TMy3_6ICxG for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 18:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41DC83C21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41DC83C21
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:37:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE3E58819E; Fri,  9 Jan 2026 18:37:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 19:32:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca23f860d1d5ed83cfa5eece8911d26a593b2f3e
X-Git-Newrev: 09baeb465339eb3ca9786ff5c4afeed03a8fc900
X-Patchwork-Hint: ignore
Message-Id: <20260109183736.DE3E58819E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xen: add block
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1473358071886003011=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1473358071886003011==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=09baeb465339eb3ca9786ff5c4afeed03a8fc900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enhance the Xen python tests to exercise block devices: this boils down
to switching from ramdisks to disk partitions for the domains rootfs.
(Refer to the comments in the python script for block devices details.)

- Add support for PCI and Xen block to the Linux kernel configurations.
- Add a few commands to list the xvda block device for good measure.
- Generate two partitions with the rootfs in the disk images; we use the
  same rootfs contents twice, once for each domain.
- Add a paravirtualized block device to the Xen dom1 configurations and
  adjust both domains kernel command lines, to specify the rootfs
  locations.
- Build host-qemu for Arm v7, to workaround an issue with 32b Arm and
  old Qemu versions, which is what we have on CI currently.
- While at it, bump Linux kernel to 6.18.4 and U-Boot to 2026.01.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py          | 36 +++++++++++++++++++---
 .../tests/package/test_xen/aarch64/genimage.cfg    | 14 +++++++--
 .../tests/package/test_xen/aarch64/linux.config    |  3 ++
 .../test_xen/aarch64/overlay/etc/xen/dom1.cfg      |  4 +--
 .../testing/tests/package/test_xen/aarch64/xen.cfg |  3 +-
 .../testing/tests/package/test_xen/arm/boot.cmd    |  7 +----
 .../tests/package/test_xen/arm/genimage.cfg        | 14 +++++++--
 .../tests/package/test_xen/arm/linux.config        |  3 ++
 .../package/test_xen/arm/overlay/etc/xen/dom1.cfg  |  4 +--
 9 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 6f2da05d3a..23efb2055d 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -6,27 +6,28 @@ import infra.basetest
 class TestXenBase(infra.basetest.BRTest):
     """A class to test Xen for multiple architectures."""
 
-    # We run only in the initramfs; this allows to use a single ramdisk image
-    # for both the host and the guest.
+    # We use the same rootfs contents for both the host and the guest.
     base_config = \
         """
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/test_xen/common/post-build.sh"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.17.1"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.4"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_BRIDGE_UTILS=y
         BR2_PACKAGE_XEN=y
         BR2_PACKAGE_XEN_HYPERVISOR=y
         BR2_PACKAGE_XEN_TOOLS=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
         BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
         BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -66,6 +67,15 @@ class TestXenBase(infra.basetest.BRTest):
         There is a stability issue for Armv7 with Qemu < 9.1, which makes the
         dom1 -> gw connection unreliable. As a workaround, we interact only with
         dom0 from dom1 (hence the fixed IP addresses).
+
+        Here is the disk setup we use in the test:
+
+        Image/part.  Dom0        Dom1     Description
+        -----------  ----------  -------  -----------
+           disk.img  vda
+           +-- boot  vda1, /mnt           Contains Xen and kernel
+           +-- root  vda2, /              Dom0 rootfs
+           `- guest  vda3        xvda, /  Dom1 rootfs
         """
 
         # Boot the emulator.
@@ -105,6 +115,11 @@ class TestXenBase(infra.basetest.BRTest):
         uuid = self.get_dom_uuid()
         self.assertNotEqual(uuid, dom0_uuid, "Unexpected dom0 UUID")
 
+        # Verify dom1 block device.
+        # (This is a bit redundant, as if the test runs this far we already know
+        # that dom1 found its rootfs.)
+        self.assertRunOk("ls -laF /sys/class/block/xvda")
+
         # Bring up the network in the dom1.
         self.assertRunOk("ifconfig eth0 10.0.2.43")
         self.assertRunOk("ifconfig -a")
@@ -127,6 +142,9 @@ class TestXenBase(infra.basetest.BRTest):
         # Check that we have two VMs running.
         self.assertNumVM(2)
 
+        # Print the block setup for debugging.
+        self.assertRunOk("xl block-list dom1")
+
         # Print the bridge setup for debugging.
         self.assertRunOk("brctl show")
 
@@ -178,6 +196,12 @@ class TestXenArmv7(TestXenBase):
     # We use U-Boot and a script to load the Dom0 images and amend the
     # Devicetree for Xen dynamically.
     # We have a custom kernel config to reduce build time.
+    # We need to build host-qemu to workaround an issue with Xen guest block
+    # devices on 32b Arm.
+    # This was fixed by commit 7175a562f157 ("hw/intc/arm_gic: Fix deactivation
+    # of SPI lines") and the fix is present in Qemu versions >= 9.1.0.
+    # When the CI docker image will have a recent-enough Qemu version with the
+    # fix, we can remove the host-qemu package from the test configuration.
     config = TestXenBase.base_config + \
         """
         BR2_arm=y
@@ -191,6 +215,8 @@ class TestXenArmv7(TestXenBase):
         BR2_PACKAGE_HOST_UBOOT_TOOLS=y
         BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
         BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="support/testing/tests/package/test_xen/arm/boot.cmd"
+        BR2_PACKAGE_HOST_QEMU=y
+        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
     def test_run(self):
diff --git a/support/testing/tests/package/test_xen/aarch64/genimage.cfg b/support/testing/tests/package/test_xen/aarch64/genimage.cfg
index 7d7a83d6b6..f792dea503 100644
--- a/support/testing/tests/package/test_xen/aarch64/genimage.cfg
+++ b/support/testing/tests/package/test_xen/aarch64/genimage.cfg
@@ -9,8 +9,7 @@ image efi-part.vfat {
 		}
 
 		files = {
-			"Image",
-			"rootfs.cpio"
+			"Image"
 		}
 	}
 
@@ -28,4 +27,15 @@ image disk.img {
 		offset = 32K
 		bootable = true
 	}
+
+	partition root {
+		partition-type-uuid = root-arm64
+		image = "rootfs.ext2"
+	}
+
+	partition guest {
+		# Linux reserved
+		partition-type-uuid = 8DA63339-0007-60C0-C436-083AC8230908
+		image = "rootfs.ext2"
+	}
 }
diff --git a/support/testing/tests/package/test_xen/aarch64/linux.config b/support/testing/tests/package/test_xen/aarch64/linux.config
index 1c6b6d7a6c..8179474fa8 100644
--- a/support/testing/tests/package/test_xen/aarch64/linux.config
+++ b/support/testing/tests/package/test_xen/aarch64/linux.config
@@ -75,10 +75,13 @@ CONFIG_UNIX=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
 CONFIG_BRIDGE=m
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
 CONFIG_BLK_DEV_LOOP=y
+CONFIG_XEN_BLKDEV_BACKEND=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
diff --git a/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
index 651b8de919..1778805781 100644
--- a/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
+++ b/support/testing/tests/package/test_xen/aarch64/overlay/etc/xen/dom1.cfg
@@ -1,6 +1,6 @@
 name="dom1"
 kernel="/mnt/Image"
-ramdisk="/mnt/rootfs.cpio"
 memory=256
-cmdline="console=hvc0"
+cmdline="console=hvc0 root=/dev/xvda rootwait"
 vif=['bridge=br0']
+disk=['phy:/dev/vda3,xvda,w']
diff --git a/support/testing/tests/package/test_xen/aarch64/xen.cfg b/support/testing/tests/package/test_xen/aarch64/xen.cfg
index 8007ba725c..045a1631a3 100644
--- a/support/testing/tests/package/test_xen/aarch64/xen.cfg
+++ b/support/testing/tests/package/test_xen/aarch64/xen.cfg
@@ -1,3 +1,2 @@
 options=dom0_mem=256M loglvl=all guest_loglvl=all
-kernel=\Image console=hvc0
-ramdisk=\rootfs.cpio
+kernel=\Image console=hvc0 root=PARTLABEL=root rootwait
diff --git a/support/testing/tests/package/test_xen/arm/boot.cmd b/support/testing/tests/package/test_xen/arm/boot.cmd
index 859dc661c8..4e314a135f 100644
--- a/support/testing/tests/package/test_xen/arm/boot.cmd
+++ b/support/testing/tests/package/test_xen/arm/boot.cmd
@@ -11,13 +11,8 @@ fdt set /chosen/modules/module@0 compatible "xen,linux-zimage" "xen,multiboot-mo
 load ${devtype} ${devnum} ${kernel_addr_r} zImage
 fdt set /chosen/modules/module@0 reg <${kernel_addr_r} 0x${filesize} >
 
-fdt mknod /chosen/modules module@1
-fdt set /chosen/modules/module@1 compatible "xen,linux-initrd" "xen,multiboot-module"
-load ${devtype} ${devnum} ${ramdisk_addr_r} rootfs.cpio
-fdt set /chosen/modules/module@1 reg <${ramdisk_addr_r} 0x${filesize} >
-
 load ${devtype} ${devnum} ${loadaddr} xen
-fdt set /chosen xen,dom0-bootargs "console=hvc0"
+fdt set /chosen xen,dom0-bootargs "console=hvc0 root=PARTLABEL=root rootwait"
 fdt set /chosen xen,xen-bootargs "dom0_mem=256M loglvl=all guest_loglvl=all"
 fdt print /chosen
 bootz ${loadaddr} - ${fdt_addr}
diff --git a/support/testing/tests/package/test_xen/arm/genimage.cfg b/support/testing/tests/package/test_xen/arm/genimage.cfg
index 6fd4e0edcd..cdb3dafa68 100644
--- a/support/testing/tests/package/test_xen/arm/genimage.cfg
+++ b/support/testing/tests/package/test_xen/arm/genimage.cfg
@@ -3,8 +3,7 @@ image boot.vfat {
 		files = {
 			"boot.scr",
 			"xen",
-			"zImage",
-			"rootfs.cpio"
+			"zImage"
 		}
 	}
 
@@ -22,4 +21,15 @@ image disk.img {
 		offset = 32K
 		bootable = true
 	}
+
+	partition root {
+		partition-type-uuid = root-arm
+		image = "rootfs.ext2"
+	}
+
+	partition guest {
+		# Linux reserved
+		partition-type-uuid = 8DA63339-0007-60C0-C436-083AC8230908
+		image = "rootfs.ext2"
+	}
 }
diff --git a/support/testing/tests/package/test_xen/arm/linux.config b/support/testing/tests/package/test_xen/arm/linux.config
index 0a58785f73..28ad13430f 100644
--- a/support/testing/tests/package/test_xen/arm/linux.config
+++ b/support/testing/tests/package/test_xen/arm/linux.config
@@ -41,6 +41,8 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 # CONFIG_IPV6 is not set
 CONFIG_BRIDGE=y
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_QRTR=m
 CONFIG_PAGE_POOL_STATS=y
 CONFIG_DEVTMPFS=y
@@ -57,6 +59,7 @@ CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_XEN_BLKDEV_BACKEND=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_SRAM=y
 CONFIG_NETDEVICES=y
diff --git a/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
index 3c75a0cfb7..081a4da2c0 100644
--- a/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
+++ b/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
@@ -1,6 +1,6 @@
 name="dom1"
 kernel="/mnt/zImage"
-ramdisk="/mnt/rootfs.cpio"
 memory=256
-cmdline="console=hvc0"
+cmdline="console=hvc0 root=/dev/xvda rootwait"
 vif=['bridge=br0']
+disk=['phy:/dev/vda3,xvda,w']

--===============1473358071886003011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1473358071886003011==--
