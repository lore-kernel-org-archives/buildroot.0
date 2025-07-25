Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B73EC87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 22:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836D041E24;
	Fri, 25 Jul 2025 22:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duvcSsvyI5ri; Fri, 25 Jul 2025 22:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8922A41BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8922A41BF2;
	Fri, 25 Jul 2025 22:02:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BB2B83
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C9A740941
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKRsmWdPhQv6 for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 22:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B92F408DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B92F408DD
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:02:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A30B86C21; Fri, 25 Jul 2025 22:02:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 23:59:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6f0d33c878b33b4706032381e3c24521e7fd0d4
X-Git-Newrev: 5346824a83488f840008eb24f84866435ac32a12
X-Patchwork-Hint: ignore
Message-Id: <20250725220251.8A30B86C21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xen: test on 32-bit
 Arm v7
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
Content-Type: multipart/mixed; boundary="===============6669467644838488972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6669467644838488972==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5346824a83488f840008eb24f84866435ac32a12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a TestXenArmv7 class with its related files in an arm/ subfolder
under test_xen/, to test Xen on 32-bit Arm v7.

We cannot boot with UEFI in this case; we use a custom U-Boot script,
which creates the Xen configuration Devicetree during boot.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py          |  41 ++++++
 .../testing/tests/package/test_xen/arm/boot.cmd    |  23 +++
 .../tests/package/test_xen/arm/genimage.cfg        |  25 ++++
 .../tests/package/test_xen/arm/linux.config        | 163 +++++++++++++++++++++
 .../package/test_xen/arm/overlay/etc/xen/dom1.cfg  |   5 +
 5 files changed, 257 insertions(+)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 44425a1f26..4278b9563e 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -125,3 +125,44 @@ class TestXen(TestXenBase):
 
         # Run Xen test.
         self.run_xen_test(arch="aarch64", options=qemu_opts)
+
+
+class TestXenArmv7(TestXenBase):
+    # Test Xen on 32b Arm v7.
+    # Boot flow: Qemu Devicetree -> U-Boot -> Xen -> Linux
+    # Xen does not boot with UEFI on 32-bit Arm v7.
+    # We use U-Boot and a script to load the Dom0 images and amend the
+    # Devicetree for Xen dynamically.
+    # We have a custom kernel config to reduce build time.
+    config = TestXenBase.base_config + \
+        """
+        BR2_arm=y
+        BR2_cortex_a15=y
+        BR2_ROOTFS_OVERLAY="support/testing/tests/package/test_xen/common/overlay \
+                            support/testing/tests/package/test_xen/arm/overlay"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c support/testing/tests/package/test_xen/arm/genimage.cfg"
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/package/test_xen/arm/linux.config"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+        BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+        BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+        BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="support/testing/tests/package/test_xen/arm/boot.cmd"
+        """
+
+    def test_run(self):
+        uboot_bin = os.path.join(self.builddir, "images", "u-boot.bin")
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+
+        # We need to run Qemu with virtualization to run Xen.
+        qemu_opts = [
+            "-bios", uboot_bin,
+            "-cpu", "cortex-a15",
+            "-device", "virtio-blk-device,drive=hd0",
+            "-drive", f"file={disk_img},if=none,format=raw,id=hd0",
+            "-m", "1G",
+            "-machine", "virt,virtualization=on,acpi=off",
+            "-smp", "2"
+        ]
+
+        # Run Xen test.
+        self.run_xen_test(arch="armv7", options=qemu_opts)
diff --git a/support/testing/tests/package/test_xen/arm/boot.cmd b/support/testing/tests/package/test_xen/arm/boot.cmd
new file mode 100644
index 0000000000..698e055e56
--- /dev/null
+++ b/support/testing/tests/package/test_xen/arm/boot.cmd
@@ -0,0 +1,23 @@
+fdt addr ${fdtcontroladdr}
+fdt resize
+
+fdt set /chosen \#address-cells <1>
+fdt set /chosen \#size-cells <1>
+
+fdt mknod /chosen modules
+
+fdt mknod /chosen/modules module@0
+fdt set /chosen/modules/module@0 compatible "xen,linux-zimage" "xen,multiboot-module"
+load ${devtype} ${devnum} ${kernel_addr_r} zImage
+fdt set /chosen/modules/module@0 reg <${kernel_addr_r} 0x${filesize} >
+
+fdt mknod /chosen/modules module@1
+fdt set /chosen/modules/module@1 compatible "xen,linux-initrd" "xen,multiboot-module"
+load ${devtype} ${devnum} ${ramdisk_addr_r} rootfs.cpio
+fdt set /chosen/modules/module@1 reg <${ramdisk_addr_r} 0x${filesize} >
+
+load ${devtype} ${devnum} ${loadaddr} xen
+fdt set /chosen xen,dom0-bootargs "console=hvc0"
+fdt set /chosen xen,xen-bootargs "dom0_mem=256M loglvl=all guest_loglvl=all"
+fdt print /chosen
+bootz ${loadaddr} - ${fdtcontroladdr}
diff --git a/support/testing/tests/package/test_xen/arm/genimage.cfg b/support/testing/tests/package/test_xen/arm/genimage.cfg
new file mode 100644
index 0000000000..6fd4e0edcd
--- /dev/null
+++ b/support/testing/tests/package/test_xen/arm/genimage.cfg
@@ -0,0 +1,25 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.scr",
+			"xen",
+			"zImage",
+			"rootfs.cpio"
+		}
+	}
+
+	size = 128M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "boot.vfat"
+		partition-type-uuid = F
+		offset = 32K
+		bootable = true
+	}
+}
diff --git a/support/testing/tests/package/test_xen/arm/linux.config b/support/testing/tests/package/test_xen/arm/linux.config
new file mode 100644
index 0000000000..aedd9bf0a2
--- /dev/null
+++ b/support/testing/tests/package/test_xen/arm/linux.config
@@ -0,0 +1,163 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+# CONFIG_CPU_ISOLATION is not set
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
+CONFIG_EXPERT=y
+CONFIG_PERF_EVENTS=y
+CONFIG_ARCH_VIRT=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_ARCH_VEXPRESS_TC2_PM=y
+CONFIG_SMP=y
+CONFIG_MCPM=y
+CONFIG_NR_CPUS=16
+CONFIG_HIGHMEM=y
+CONFIG_ARCH_FORCE_MAX_ORDER=11
+CONFIG_XEN=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_CPUIDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+# CONFIG_SUSPEND is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SWAP is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_QRTR=m
+CONFIG_PAGE_POOL_STATS=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_ARM_SCMI_PROTOCOL=y
+CONFIG_TRUSTED_FOUNDATIONS=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_VIRTIO_BLK=y
+CONFIG_SRAM=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_SYSTEMPORT=m
+CONFIG_MACB=y
+CONFIG_FTGMAC100=m
+CONFIG_HIX5HD2_GMAC=y
+CONFIG_MVMDIO=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_MDIO_BITBANG=y
+CONFIG_MDIO_MSCC_MIIM=m
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_GPIO_DECODER=m
+CONFIG_INPUT_ADXL34X=m
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=5
+CONFIG_SERIAL_8250_RUNTIME_UARTS=5
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_VIRTIO_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_TCG_TPM=m
+CONFIG_SPMI=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_MPC8XXX=y
+CONFIG_GPIO_PL061=y
+CONFIG_GPIO_SYSCON=y
+CONFIG_POWER_RESET_BRCMKONA=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_DW_WATCHDOG=y
+CONFIG_BCMA=y
+CONFIG_BCMA_HOST_SOC=y
+CONFIG_BCMA_DRIVER_GMAC_CMN=y
+CONFIG_BCMA_DRIVER_GPIO=y
+CONFIG_MFD_PM8XXX=y
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EDAC=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_RTC_DRV_PM8XXX=m
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
+CONFIG_DW_DMAC=y
+CONFIG_VIRTIO_MMIO=y
+# CONFIG_VHOST_MENU is not set
+CONFIG_COMMON_CLK_SCMI=y
+CONFIG_HWSPINLOCK=y
+CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=2
+CONFIG_MICROCHIP_PIT64B=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_MEMORY=y
+CONFIG_PWM=y
+CONFIG_RESET_SIMPLE=y
+# CONFIG_ARM_PMU is not set
+CONFIG_RAS=y
+CONFIG_FSI=m
+CONFIG_FSI_MASTER_GPIO=m
+CONFIG_FSI_MASTER_HUB=m
+CONFIG_FSI_MASTER_ASPEED=m
+CONFIG_FSI_SCOM=m
+CONFIG_FSI_SBEFIFO=m
+CONFIG_FSI_OCC=m
+CONFIG_INTERCONNECT=y
+CONFIG_COUNTER=m
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_AUTOFS_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_NTFS_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_CRC_CCITT=m
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
diff --git a/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg b/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
new file mode 100644
index 0000000000..0a4ae24a16
--- /dev/null
+++ b/support/testing/tests/package/test_xen/arm/overlay/etc/xen/dom1.cfg
@@ -0,0 +1,5 @@
+name="dom1"
+kernel="/mnt/zImage"
+ramdisk="/mnt/rootfs.cpio"
+memory=256
+cmdline="console=hvc0"

--===============6669467644838488972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6669467644838488972==--
