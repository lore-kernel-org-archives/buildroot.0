Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A46C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C0C340E76;
	Fri, 26 Jun 2026 14:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jAJIAgam1cx; Fri, 26 Jun 2026 14:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0137640EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485394;
	bh=VEuzcnhzyk5qy9GfDMeINNS1jUt2u0VCqQlYRsWyBfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fXnUIRvIa+sQQO4xVJtxLqiugIWuO/5U0lyx2VTQTTp2rQJPzZMOoFD3W11mdVbDA
	 I6FX3aCUtVC3s99BK3qhc09HUPR9Jubr3xkYo7zvqQf3z9bO+dasF3x11Z0sjhRLdh
	 lKyruHZOqZ4pmqKaQl1VIn6qCkErXZKLWm9i4YnIq0AHwxAnPafBemP3D4VMjMA6dB
	 NC0vmvLxlLh6DeE8H5mGfnv4ohp5gkSX81qluMbpck61ZLeC/noz2hx4sHnrHUt+Z0
	 QUfNpy2QEPw8PBpzShSNW0Tj8Aq3bch8WTyKMbdWp7GOjf7aerOEJRbCoPW6qz7S3C
	 pwV5txo42Z07Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0137640EFA;
	Fri, 26 Jun 2026 14:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54D43231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4683640E17
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c723Z_y8qcdf for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B48FB40E12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B48FB40E12
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2DE1864AD; Fri, 26 Jun 2026 14:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:20:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e50c8f179bc3184992789524c4331985e9e8ce86
X-Git-Newrev: f543b8dc40cf91d1dee6cec9554c83e91106e105
X-Patchwork-Hint: ignore
Message-Id: <20260626144919.A2DE1864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert
 "support/testing/tests/package/test_kexec.py: fix kexec test for qemu 5.2"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f543b8dc40cf91d1dee6cec9554c83e91106e105
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Our docker image was finally updated to Debian 12 and now provide Qemu
7.2.15 [1]. We can safely revert this workaround for older Qemu version.

[1] e5bbe020ca60789bdb0a16e27bc1a4208d8f6a5a

This reverts commit 37e23e0dd7187bb27abb329f4fbb29c59c31c672.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4834f18c693dd6167d314affea13d0f4ac8fd965)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_kexec.py        |  15 +-
 .../test_kexec/qemu-aarch64-virt-5.2-machine.dts   | 373 ---------------------
 2 files changed, 4 insertions(+), 384 deletions(-)

diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
index 51d43b0572..77e383373e 100644
--- a/support/testing/tests/package/test_kexec.py
+++ b/support/testing/tests/package/test_kexec.py
@@ -24,8 +24,6 @@ class TestKexec(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="{}"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_KEXEC=y
@@ -33,25 +31,20 @@ class TestKexec(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2_4=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(
-            infra.filepath("tests/package/test_kexec/linux-kexec.fragment"),
-            infra.filepath("tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts")
+            infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
         )
 
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "rootfs.ext4")
         kern = os.path.join(self.builddir, "images", "Image")
-        dtb = os.path.join(self.builddir, "images", "qemu-aarch64-virt-5.2-machine.dtb")
         # Notes:
         # Sufficient memory is needed to load the kernel: having at
         # least 512MB works. kexec could silently fail if not enough
         # memory is present. KASLR needs to be disabled for the test:
-        # we pass "nokaslr" to kernel bootargs, and also pass a custom
-        # devicetree to qemu virt machine. This devicetree is based on
-        # qemu aarch64 5.2 dts with kaslr-seed set 0.
-        # With newer qemu >= 7.0 we can disable KASLR from the qemu
-        # command line using "dtb-kaslr-seed=off".
+        # we pass "nokaslr" to kernel bootargs, and also pass
+        # "dtb-kaslr-seed=off" to qemu virt machine.
         bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
-        qemu_opts = ["-M", "virt", "-dtb", dtb, "-cpu", "cortex-a57", "-m", "512M",
+        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", "cortex-a57", "-m", "512M",
                      "-drive", f"file={hda},if=virtio,format=raw"]
         self.emulator.boot(arch="aarch64",
                            kernel=kern,
diff --git a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
deleted file mode 100644
index ad96a51c40..0000000000
--- a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
+++ /dev/null
@@ -1,373 +0,0 @@
-/dts-v1/;
-
-/ {
-	interrupt-parent = <0x8001>;
-	#size-cells = <0x02>;
-	#address-cells = <0x02>;
-	compatible = "linux,dummy-virt";
-
-	psci {
-		migrate = <0x84000005>;
-		cpu_on = <0x84000003>;
-		cpu_off = <0x84000002>;
-		cpu_suspend = <0x84000001>;
-		method = "hvc";
-		compatible = "arm,psci-0.2\0arm,psci";
-	};
-
-	memory@40000000 {
-		reg = <0x00 0x40000000 0x00 0x8000000>;
-		device_type = "memory";
-	};
-
-	platform@c000000 {
-		interrupt-parent = <0x8001>;
-		ranges = <0x00 0x00 0xc000000 0x2000000>;
-		#address-cells = <0x01>;
-		#size-cells = <0x01>;
-		compatible = "qemu,platform\0simple-bus";
-	};
-
-	fw-cfg@9020000 {
-		dma-coherent;
-		reg = <0x00 0x9020000 0x00 0x18>;
-		compatible = "qemu,fw-cfg-mmio";
-	};
-
-	virtio_mmio@a000000 {
-		dma-coherent;
-		interrupts = <0x00 0x10 0x01>;
-		reg = <0x00 0xa000000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000200 {
-		dma-coherent;
-		interrupts = <0x00 0x11 0x01>;
-		reg = <0x00 0xa000200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000400 {
-		dma-coherent;
-		interrupts = <0x00 0x12 0x01>;
-		reg = <0x00 0xa000400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000600 {
-		dma-coherent;
-		interrupts = <0x00 0x13 0x01>;
-		reg = <0x00 0xa000600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000800 {
-		dma-coherent;
-		interrupts = <0x00 0x14 0x01>;
-		reg = <0x00 0xa000800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000a00 {
-		dma-coherent;
-		interrupts = <0x00 0x15 0x01>;
-		reg = <0x00 0xa000a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000c00 {
-		dma-coherent;
-		interrupts = <0x00 0x16 0x01>;
-		reg = <0x00 0xa000c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a000e00 {
-		dma-coherent;
-		interrupts = <0x00 0x17 0x01>;
-		reg = <0x00 0xa000e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001000 {
-		dma-coherent;
-		interrupts = <0x00 0x18 0x01>;
-		reg = <0x00 0xa001000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001200 {
-		dma-coherent;
-		interrupts = <0x00 0x19 0x01>;
-		reg = <0x00 0xa001200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001400 {
-		dma-coherent;
-		interrupts = <0x00 0x1a 0x01>;
-		reg = <0x00 0xa001400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001600 {
-		dma-coherent;
-		interrupts = <0x00 0x1b 0x01>;
-		reg = <0x00 0xa001600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001800 {
-		dma-coherent;
-		interrupts = <0x00 0x1c 0x01>;
-		reg = <0x00 0xa001800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001a00 {
-		dma-coherent;
-		interrupts = <0x00 0x1d 0x01>;
-		reg = <0x00 0xa001a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001c00 {
-		dma-coherent;
-		interrupts = <0x00 0x1e 0x01>;
-		reg = <0x00 0xa001c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a001e00 {
-		dma-coherent;
-		interrupts = <0x00 0x1f 0x01>;
-		reg = <0x00 0xa001e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002000 {
-		dma-coherent;
-		interrupts = <0x00 0x20 0x01>;
-		reg = <0x00 0xa002000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002200 {
-		dma-coherent;
-		interrupts = <0x00 0x21 0x01>;
-		reg = <0x00 0xa002200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002400 {
-		dma-coherent;
-		interrupts = <0x00 0x22 0x01>;
-		reg = <0x00 0xa002400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002600 {
-		dma-coherent;
-		interrupts = <0x00 0x23 0x01>;
-		reg = <0x00 0xa002600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002800 {
-		dma-coherent;
-		interrupts = <0x00 0x24 0x01>;
-		reg = <0x00 0xa002800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002a00 {
-		dma-coherent;
-		interrupts = <0x00 0x25 0x01>;
-		reg = <0x00 0xa002a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002c00 {
-		dma-coherent;
-		interrupts = <0x00 0x26 0x01>;
-		reg = <0x00 0xa002c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a002e00 {
-		dma-coherent;
-		interrupts = <0x00 0x27 0x01>;
-		reg = <0x00 0xa002e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003000 {
-		dma-coherent;
-		interrupts = <0x00 0x28 0x01>;
-		reg = <0x00 0xa003000 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003200 {
-		dma-coherent;
-		interrupts = <0x00 0x29 0x01>;
-		reg = <0x00 0xa003200 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003400 {
-		dma-coherent;
-		interrupts = <0x00 0x2a 0x01>;
-		reg = <0x00 0xa003400 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003600 {
-		dma-coherent;
-		interrupts = <0x00 0x2b 0x01>;
-		reg = <0x00 0xa003600 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003800 {
-		dma-coherent;
-		interrupts = <0x00 0x2c 0x01>;
-		reg = <0x00 0xa003800 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003a00 {
-		dma-coherent;
-		interrupts = <0x00 0x2d 0x01>;
-		reg = <0x00 0xa003a00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003c00 {
-		dma-coherent;
-		interrupts = <0x00 0x2e 0x01>;
-		reg = <0x00 0xa003c00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	virtio_mmio@a003e00 {
-		dma-coherent;
-		interrupts = <0x00 0x2f 0x01>;
-		reg = <0x00 0xa003e00 0x00 0x200>;
-		compatible = "virtio,mmio";
-	};
-
-	gpio-keys {
-		#address-cells = <0x01>;
-		#size-cells = <0x00>;
-		compatible = "gpio-keys";
-
-		poweroff {
-			gpios = <0x8003 0x03 0x00>;
-			linux,code = <0x74>;
-			label = "GPIO Key Poweroff";
-		};
-	};
-
-	pl061@9030000 {
-		phandle = <0x8003>;
-		clock-names = "apb_pclk";
-		clocks = <0x8000>;
-		interrupts = <0x00 0x07 0x04>;
-		gpio-controller;
-		#gpio-cells = <0x02>;
-		compatible = "arm,pl061\0arm,primecell";
-		reg = <0x00 0x9030000 0x00 0x1000>;
-	};
-
-	pcie@10000000 {
-		interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
-		interrupt-map = <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x03 0x04 0x00 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x04 0x04 0x800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x05 0x04 0x800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x05 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x06 0x04 0x1000 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x03 0x04 0x1800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x05 0x04>;
-		#interrupt-cells = <0x01>;
-		ranges = <0x1000000 0x00 0x00 0x00 0x3eff0000 0x00 0x10000 0x2000000 0x00 0x10000000 0x00 0x10000000 0x00 0x2eff0000 0x3000000 0x80 0x00 0x80 0x00 0x80 0x00>;
-		reg = <0x40 0x10000000 0x00 0x10000000>;
-		msi-parent = <0x8002>;
-		dma-coherent;
-		bus-range = <0x00 0xff>;
-		linux,pci-domain = <0x00>;
-		#size-cells = <0x02>;
-		#address-cells = <0x03>;
-		device_type = "pci";
-		compatible = "pci-host-ecam-generic";
-	};
-
-	pl031@9010000 {
-		clock-names = "apb_pclk";
-		clocks = <0x8000>;
-		interrupts = <0x00 0x02 0x04>;
-		reg = <0x00 0x9010000 0x00 0x1000>;
-		compatible = "arm,pl031\0arm,primecell";
-	};
-
-	pl011@9000000 {
-		clock-names = "uartclk\0apb_pclk";
-		clocks = <0x8000 0x8000>;
-		interrupts = <0x00 0x01 0x04>;
-		reg = <0x00 0x9000000 0x00 0x1000>;
-		compatible = "arm,pl011\0arm,primecell";
-	};
-
-	pmu {
-	};
-
-	intc@8000000 {
-		phandle = <0x8001>;
-		reg = <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00 0x10000>;
-		compatible = "arm,cortex-a15-gic";
-		ranges;
-		#size-cells = <0x02>;
-		#address-cells = <0x02>;
-		interrupt-controller;
-		#interrupt-cells = <0x03>;
-
-		v2m@8020000 {
-			phandle = <0x8002>;
-			reg = <0x00 0x8020000 0x00 0x1000>;
-			msi-controller;
-			compatible = "arm,gic-v2m-frame";
-		};
-	};
-
-	flash@0 {
-		bank-width = <0x04>;
-		reg = <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00 0x4000000>;
-		compatible = "cfi-flash";
-	};
-
-	cpus {
-		#size-cells = <0x00>;
-		#address-cells = <0x01>;
-
-		cpu@0 {
-			reg = <0x00>;
-			compatible = "arm,cortex-a15";
-			device_type = "cpu";
-		};
-	};
-
-	timer {
-		interrupts = <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b 0x104 0x01 0x0a 0x104>;
-		always-on;
-		compatible = "arm,armv7-timer";
-	};
-
-	apb-pclk {
-		phandle = <0x8000>;
-		clock-output-names = "clk24mhz";
-		clock-frequency = <0x16e3600>;
-		#clock-cells = <0x00>;
-		compatible = "fixed-clock";
-	};
-
-	chosen {
-		stdout-path = "/pl011@9000000";
-		/* Buildroot specific: KASLR needs to be disabled for the Kexec test. */
-		kaslr-seed = <0 0>;
-	};
-};
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
