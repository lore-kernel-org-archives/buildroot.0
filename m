Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43004C77B73
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 13:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D49C81425;
	Sat, 27 May 2023 13:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D49C81425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQOVJd_um2fL; Sat, 27 May 2023 13:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8F981452;
	Sat, 27 May 2023 13:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC8F981452
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8633C1BF31C
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 13:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C1160AB0
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 13:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C1160AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IB6WQQnowIdw for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 13:43:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44CD607FF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B44CD607FF
 for <buildroot@buildroot.org>; Sat, 27 May 2023 13:43:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30ad752f433so969855f8f.3
 for <buildroot@buildroot.org>; Sat, 27 May 2023 06:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685195010; x=1687787010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=re8MVZcy3vbd04ZoakMimkaKEeZ0fhAe8gnfmw1rX3c=;
 b=b3GQ9/C/N7osd9zwRNuCTOGLysRqIL8olpRw0IkqwYztwjRh1dbQdfHksCZO2JNfup
 BHJRpEsHj5Oh/IBydt34/tJzNE6Zkw+06eONgfLo+b6PrLjYlQiIHWMDwJEKtBVy8qNu
 dkRyA/kfTr5QB0kL0TMUEGDNIKGAMNRo1VN8xN2DlAldR7dHp5zX1aollfs99BVuYsqh
 E7p+QDZbKPSQEWO5DmpEDlu8vIcfPMypgbuqZgkZOF0x0Z5JbSTgqSknK5eRU2Oa++k1
 kEpfC+2cKBtok7vqWQk921gZX5smCbtauh1qZSrgyG2cfrxUKQR1xGZnWlJA+Fcl97xy
 eSog==
X-Gm-Message-State: AC+VfDxOSRhPh2s/cbLQWcQRgEiNqkjoxD1KkSNZhYN/sdSQfPkx7fYF
 drmjO0gczQkmihf8cbpenCZtTNqsWHk=
X-Google-Smtp-Source: ACHHUZ7vEuXvJDqFuuPj+iTdZc0gjAR4MVf/O6VSuoSLivZoEB8D/GnmNorO5vLsdCflw2n/JCOrBg==
X-Received: by 2002:a5d:44c8:0:b0:2cd:bc79:5432 with SMTP id
 z8-20020a5d44c8000000b002cdbc795432mr4300299wrr.25.1685195010151; 
 Sat, 27 May 2023 06:43:30 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe0c1000000b0030796e103a1sm8191426wri.5.2023.05.27.06.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 06:43:29 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 15:43:26 +0200
Message-Id: <20230527134326.1855997-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685195010; x=1687787010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=re8MVZcy3vbd04ZoakMimkaKEeZ0fhAe8gnfmw1rX3c=;
 b=bp3x3uKl2Xa0phuvzZD4zByMvpS86RmNUjq9MDYVZMtsbY8ba4+QaszXPBXmn+goam
 gK7oNwDmpyzaoKcPajIBwSqaaYzWw9Xt4aZDVB1URVBly726P0UWYay0qE+erx3jaPFC
 VtMi6R4gI3THWp+bTWnkEFnLQ3IlNc4pXzWQoewjoGDTbVBWuJjb/Ciqz5yWHP2dAcTa
 SaPLxqh1fCuUUqMHKzErg5fvLge+SA8Puf7zC/zLgYlXlxtEb4+uPKSL0As9/BcDzi0O
 up9A+jQROtfX666/hhhBQJ7CCTPVn7a/iTXa6unqaNoXlLvP5y1H0cDRclU0tCIDERCC
 QDwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bp3x3uKl
Subject: [Buildroot] [PATCH] support/testing/tests/package/test_kexec.py:
 fix kexec test for qemu 5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Signed-off-by : Julien Olivain" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit f69c972ae61 (support/testing/tests/package/test_kexec.py:
new runtime test) was tested locally with a qemu version (>= 7.x) more
recent than the one available in our buidroot/base Docker image (5.2).
As a consequence, that test fails to run in gitlab-ci as reported by [1].

Remove "dtb-kaslr-seed=off" from the Qemu command line and pass
a custom devicetree to qemu virt machine. This devicetree is
based on qemu aarch64 5.2 dts with kaslr-seed set 0.

The qemu aarch64 devicetree has been exported [2] and updated with the
following method:

  qemu-system-aarch64 -machine virt -machine dumpdtb=qemu-aarch64-virt-5.2-machine.dtb
  dtc -I dtb qemu-aarch64-virt-5.2-machine.dtb > qemu-aarch64-virt-5.2-machine.dts
  edit the dts and replace kaslr-seed parameter by "kaslr-seed = <0 0>;"

As soon as our buidroot/base Docker image is updated and a newer qemu version
is available, we can safely revert this change and use the initial method.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819092

[1] http://lists.busybox.net/pipermail/buildroot/2023-May/668091.html
[2] https://u-boot.readthedocs.io/en/latest/develop/devicetree/dt_qemu.html#obtaining-the-qemu-devicetree

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_kexec.py   |  15 +-
 .../qemu-aarch64-virt-5.2-machine.dts         | 373 ++++++++++++++++++
 2 files changed, 384 insertions(+), 4 deletions(-)
 create mode 100644 support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts

diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
index 77e383373e..51d43b0572 100644
--- a/support/testing/tests/package/test_kexec.py
+++ b/support/testing/tests/package/test_kexec.py
@@ -24,6 +24,8 @@ class TestKexec(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="{}"
         BR2_LINUX_KERNEL_INSTALL_TARGET=y
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_KEXEC=y
@@ -31,20 +33,25 @@ class TestKexec(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2_4=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(
-            infra.filepath("tests/package/test_kexec/linux-kexec.fragment")
+            infra.filepath("tests/package/test_kexec/linux-kexec.fragment"),
+            infra.filepath("tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts")
         )
 
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "rootfs.ext4")
         kern = os.path.join(self.builddir, "images", "Image")
+        dtb = os.path.join(self.builddir, "images", "qemu-aarch64-virt-5.2-machine.dtb")
         # Notes:
         # Sufficient memory is needed to load the kernel: having at
         # least 512MB works. kexec could silently fail if not enough
         # memory is present. KASLR needs to be disabled for the test:
-        # we pass "nokaslr" to kernel bootargs, and also pass
-        # "dtb-kaslr-seed=off" to qemu virt machine.
+        # we pass "nokaslr" to kernel bootargs, and also pass a custom
+        # devicetree to qemu virt machine. This devicetree is based on
+        # qemu aarch64 5.2 dts with kaslr-seed set 0.
+        # With newer qemu >= 7.0 we can disable KASLR from the qemu
+        # command line using "dtb-kaslr-seed=off".
         bootargs = ["root=/dev/vda console=ttyAMA0 nokaslr"]
-        qemu_opts = ["-M", "virt,dtb-kaslr-seed=off", "-cpu", "cortex-a57", "-m", "512M",
+        qemu_opts = ["-M", "virt", "-dtb", dtb, "-cpu", "cortex-a57", "-m", "512M",
                      "-drive", f"file={hda},if=virtio,format=raw"]
         self.emulator.boot(arch="aarch64",
                            kernel=kern,
diff --git a/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
new file mode 100644
index 0000000000..ad96a51c40
--- /dev/null
+++ b/support/testing/tests/package/test_kexec/qemu-aarch64-virt-5.2-machine.dts
@@ -0,0 +1,373 @@
+/dts-v1/;
+
+/ {
+	interrupt-parent = <0x8001>;
+	#size-cells = <0x02>;
+	#address-cells = <0x02>;
+	compatible = "linux,dummy-virt";
+
+	psci {
+		migrate = <0x84000005>;
+		cpu_on = <0x84000003>;
+		cpu_off = <0x84000002>;
+		cpu_suspend = <0x84000001>;
+		method = "hvc";
+		compatible = "arm,psci-0.2\0arm,psci";
+	};
+
+	memory@40000000 {
+		reg = <0x00 0x40000000 0x00 0x8000000>;
+		device_type = "memory";
+	};
+
+	platform@c000000 {
+		interrupt-parent = <0x8001>;
+		ranges = <0x00 0x00 0xc000000 0x2000000>;
+		#address-cells = <0x01>;
+		#size-cells = <0x01>;
+		compatible = "qemu,platform\0simple-bus";
+	};
+
+	fw-cfg@9020000 {
+		dma-coherent;
+		reg = <0x00 0x9020000 0x00 0x18>;
+		compatible = "qemu,fw-cfg-mmio";
+	};
+
+	virtio_mmio@a000000 {
+		dma-coherent;
+		interrupts = <0x00 0x10 0x01>;
+		reg = <0x00 0xa000000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000200 {
+		dma-coherent;
+		interrupts = <0x00 0x11 0x01>;
+		reg = <0x00 0xa000200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000400 {
+		dma-coherent;
+		interrupts = <0x00 0x12 0x01>;
+		reg = <0x00 0xa000400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000600 {
+		dma-coherent;
+		interrupts = <0x00 0x13 0x01>;
+		reg = <0x00 0xa000600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000800 {
+		dma-coherent;
+		interrupts = <0x00 0x14 0x01>;
+		reg = <0x00 0xa000800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000a00 {
+		dma-coherent;
+		interrupts = <0x00 0x15 0x01>;
+		reg = <0x00 0xa000a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000c00 {
+		dma-coherent;
+		interrupts = <0x00 0x16 0x01>;
+		reg = <0x00 0xa000c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a000e00 {
+		dma-coherent;
+		interrupts = <0x00 0x17 0x01>;
+		reg = <0x00 0xa000e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001000 {
+		dma-coherent;
+		interrupts = <0x00 0x18 0x01>;
+		reg = <0x00 0xa001000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001200 {
+		dma-coherent;
+		interrupts = <0x00 0x19 0x01>;
+		reg = <0x00 0xa001200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001400 {
+		dma-coherent;
+		interrupts = <0x00 0x1a 0x01>;
+		reg = <0x00 0xa001400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001600 {
+		dma-coherent;
+		interrupts = <0x00 0x1b 0x01>;
+		reg = <0x00 0xa001600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001800 {
+		dma-coherent;
+		interrupts = <0x00 0x1c 0x01>;
+		reg = <0x00 0xa001800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001a00 {
+		dma-coherent;
+		interrupts = <0x00 0x1d 0x01>;
+		reg = <0x00 0xa001a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001c00 {
+		dma-coherent;
+		interrupts = <0x00 0x1e 0x01>;
+		reg = <0x00 0xa001c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a001e00 {
+		dma-coherent;
+		interrupts = <0x00 0x1f 0x01>;
+		reg = <0x00 0xa001e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002000 {
+		dma-coherent;
+		interrupts = <0x00 0x20 0x01>;
+		reg = <0x00 0xa002000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002200 {
+		dma-coherent;
+		interrupts = <0x00 0x21 0x01>;
+		reg = <0x00 0xa002200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002400 {
+		dma-coherent;
+		interrupts = <0x00 0x22 0x01>;
+		reg = <0x00 0xa002400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002600 {
+		dma-coherent;
+		interrupts = <0x00 0x23 0x01>;
+		reg = <0x00 0xa002600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002800 {
+		dma-coherent;
+		interrupts = <0x00 0x24 0x01>;
+		reg = <0x00 0xa002800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002a00 {
+		dma-coherent;
+		interrupts = <0x00 0x25 0x01>;
+		reg = <0x00 0xa002a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002c00 {
+		dma-coherent;
+		interrupts = <0x00 0x26 0x01>;
+		reg = <0x00 0xa002c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a002e00 {
+		dma-coherent;
+		interrupts = <0x00 0x27 0x01>;
+		reg = <0x00 0xa002e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003000 {
+		dma-coherent;
+		interrupts = <0x00 0x28 0x01>;
+		reg = <0x00 0xa003000 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003200 {
+		dma-coherent;
+		interrupts = <0x00 0x29 0x01>;
+		reg = <0x00 0xa003200 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003400 {
+		dma-coherent;
+		interrupts = <0x00 0x2a 0x01>;
+		reg = <0x00 0xa003400 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003600 {
+		dma-coherent;
+		interrupts = <0x00 0x2b 0x01>;
+		reg = <0x00 0xa003600 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003800 {
+		dma-coherent;
+		interrupts = <0x00 0x2c 0x01>;
+		reg = <0x00 0xa003800 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003a00 {
+		dma-coherent;
+		interrupts = <0x00 0x2d 0x01>;
+		reg = <0x00 0xa003a00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003c00 {
+		dma-coherent;
+		interrupts = <0x00 0x2e 0x01>;
+		reg = <0x00 0xa003c00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	virtio_mmio@a003e00 {
+		dma-coherent;
+		interrupts = <0x00 0x2f 0x01>;
+		reg = <0x00 0xa003e00 0x00 0x200>;
+		compatible = "virtio,mmio";
+	};
+
+	gpio-keys {
+		#address-cells = <0x01>;
+		#size-cells = <0x00>;
+		compatible = "gpio-keys";
+
+		poweroff {
+			gpios = <0x8003 0x03 0x00>;
+			linux,code = <0x74>;
+			label = "GPIO Key Poweroff";
+		};
+	};
+
+	pl061@9030000 {
+		phandle = <0x8003>;
+		clock-names = "apb_pclk";
+		clocks = <0x8000>;
+		interrupts = <0x00 0x07 0x04>;
+		gpio-controller;
+		#gpio-cells = <0x02>;
+		compatible = "arm,pl061\0arm,primecell";
+		reg = <0x00 0x9030000 0x00 0x1000>;
+	};
+
+	pcie@10000000 {
+		interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
+		interrupt-map = <0x00 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x03 0x04 0x00 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x04 0x04 0x00 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x05 0x04 0x00 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x04 0x04 0x800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x05 0x04 0x800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x06 0x04 0x800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x05 0x04 0x1000 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x06 0x04 0x1000 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x03 0x04 0x1000 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x01 0x8001 0x00 0x00 0x00 0x06 0x04 0x1800 0x00 0x00 0x02 0x8001 0x00 0x00 0x00 0x03 0x04 0x1800 0x00 0x00 0x03 0x8001 0x00 0x00 0x00 0x04 0x04 0x1800 0x00 0x00 0x04 0x8001 0x00 0x00 0x00 0x05 0x04>;
+		#interrupt-cells = <0x01>;
+		ranges = <0x1000000 0x00 0x00 0x00 0x3eff0000 0x00 0x10000 0x2000000 0x00 0x10000000 0x00 0x10000000 0x00 0x2eff0000 0x3000000 0x80 0x00 0x80 0x00 0x80 0x00>;
+		reg = <0x40 0x10000000 0x00 0x10000000>;
+		msi-parent = <0x8002>;
+		dma-coherent;
+		bus-range = <0x00 0xff>;
+		linux,pci-domain = <0x00>;
+		#size-cells = <0x02>;
+		#address-cells = <0x03>;
+		device_type = "pci";
+		compatible = "pci-host-ecam-generic";
+	};
+
+	pl031@9010000 {
+		clock-names = "apb_pclk";
+		clocks = <0x8000>;
+		interrupts = <0x00 0x02 0x04>;
+		reg = <0x00 0x9010000 0x00 0x1000>;
+		compatible = "arm,pl031\0arm,primecell";
+	};
+
+	pl011@9000000 {
+		clock-names = "uartclk\0apb_pclk";
+		clocks = <0x8000 0x8000>;
+		interrupts = <0x00 0x01 0x04>;
+		reg = <0x00 0x9000000 0x00 0x1000>;
+		compatible = "arm,pl011\0arm,primecell";
+	};
+
+	pmu {
+	};
+
+	intc@8000000 {
+		phandle = <0x8001>;
+		reg = <0x00 0x8000000 0x00 0x10000 0x00 0x8010000 0x00 0x10000>;
+		compatible = "arm,cortex-a15-gic";
+		ranges;
+		#size-cells = <0x02>;
+		#address-cells = <0x02>;
+		interrupt-controller;
+		#interrupt-cells = <0x03>;
+
+		v2m@8020000 {
+			phandle = <0x8002>;
+			reg = <0x00 0x8020000 0x00 0x1000>;
+			msi-controller;
+			compatible = "arm,gic-v2m-frame";
+		};
+	};
+
+	flash@0 {
+		bank-width = <0x04>;
+		reg = <0x00 0x00 0x00 0x4000000 0x00 0x4000000 0x00 0x4000000>;
+		compatible = "cfi-flash";
+	};
+
+	cpus {
+		#size-cells = <0x00>;
+		#address-cells = <0x01>;
+
+		cpu@0 {
+			reg = <0x00>;
+			compatible = "arm,cortex-a15";
+			device_type = "cpu";
+		};
+	};
+
+	timer {
+		interrupts = <0x01 0x0d 0x104 0x01 0x0e 0x104 0x01 0x0b 0x104 0x01 0x0a 0x104>;
+		always-on;
+		compatible = "arm,armv7-timer";
+	};
+
+	apb-pclk {
+		phandle = <0x8000>;
+		clock-output-names = "clk24mhz";
+		clock-frequency = <0x16e3600>;
+		#clock-cells = <0x00>;
+		compatible = "fixed-clock";
+	};
+
+	chosen {
+		stdout-path = "/pl011@9000000";
+		/* Buildroot specific: KASLR needs to be disabled for the Kexec test. */
+		kaslr-seed = <0 0>;
+	};
+};
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
