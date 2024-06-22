Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D29C27C78
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 11:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD91240925;
	Sat, 22 Jun 2024 11:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xm_AOIcbA98; Sat, 22 Jun 2024 11:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C3E408E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C3E408E8;
	Sat, 22 Jun 2024 11:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA421BF297
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 11:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0728040261
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 11:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxMXUXn1aD7q for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 11:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0718D401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0718D401CC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0718D401CC
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 11:46:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 55516B0054E;
 Sat, 22 Jun 2024 13:46:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 13:46:21 +0200
Message-ID: <20240622114621.447904-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719056787;
 bh=wWECnZ69yCDzPtXPcdo77yVllHpN41424AKzL21x1wg=;
 h=From:To:Cc:Subject:Date:From;
 b=SrwAXCbKQ2vFT9jtZGhSdQ7nKD1feXIQ0JEuJpOVwpqUtBf94qZSrBKs+e60delW3
 itStr4G4WYPEyNyJbNcWbddBVutV4e5bMmufbO6gLevFG++nGbi3UKtSfLYGJg5eAh
 RRp/fQeU1e5Q71HH54eoc8OEy2nPhhVSeZ50geZQHXLGI5Rnr4cTajjkRCgvijG16h
 duZClPcbiekli0Rv/n/3KR6SmCEOuzc78qhrI4w/5Q2XgaDOpjVo34QTbdmXIjk+xy
 oZZfT6a5afpFbRRSOE8fOk2NMdGZbIIUgrw6MKL2JFs7VtCJt22SyNhCcST/EDOsp5
 TTmIVz20zqjMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SrwAXCbK
Subject: [Buildroot] [PATCH 1/1] configs/spike_riscv32: new defconfig
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] updated riscv-isa-sim (Spike), which now includes
a NS16550 uart emulation. This can be used by RV32 Linux Kernel. This
commit introduce a defconfig for running Linux on Spike RISC-V 32-bit
ISA simulator.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/853b7661bf5ddca5d4b81964ef1a19a133beac85

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 853b766 with commands:

    utils/docker-run make check-package
    ...
    OK

    make spike_riscv32_defconfig
    make
    board/spike/riscv32/start.sh
    ...
    Welcome to Buildroot
    buildroot login:
---
 DEVELOPERS                                    |  1 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 board/spike/riscv32/patches/linux/linux.hash  |  2 ++
 .../riscv32/patches/opensbi/opensbi.hash      |  2 ++
 board/spike/riscv32/readme.txt                | 30 +++++++++++++++++++
 board/spike/riscv32/start.sh                  | 23 ++++++++++++++
 configs/spike_riscv32_defconfig               | 17 +++++++++++
 7 files changed, 76 insertions(+)
 create mode 120000 board/spike/riscv32/patches/linux-headers/linux-headers.hash
 create mode 100644 board/spike/riscv32/patches/linux/linux.hash
 create mode 100644 board/spike/riscv32/patches/opensbi/opensbi.hash
 create mode 100644 board/spike/riscv32/readme.txt
 create mode 100755 board/spike/riscv32/start.sh
 create mode 100644 configs/spike_riscv32_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78e..f8bcfc57c1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1750,6 +1750,7 @@ F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
 F:	configs/qemu_riscv64_virt_efi_defconfig
+F:	configs/spike_riscv32_defconfig
 F:	configs/spike_riscv64_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
diff --git a/board/spike/riscv32/patches/linux-headers/linux-headers.hash b/board/spike/riscv32/patches/linux-headers/linux-headers.hash
new file mode 120000
index 00000000000..5808d92afe8
--- /dev/null
+++ b/board/spike/riscv32/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/spike/riscv32/patches/linux/linux.hash b/board/spike/riscv32/patches/linux/linux.hash
new file mode 100644
index 00000000000..a3b67a09a47
--- /dev/null
+++ b/board/spike/riscv32/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  fce3ee728712ed063aa8c14a8756c8ff8c7a46ba3827f61d2b04a73c7cf5dd9e  linux-6.6.35.tar.xz
diff --git a/board/spike/riscv32/patches/opensbi/opensbi.hash b/board/spike/riscv32/patches/opensbi/opensbi.hash
new file mode 100644
index 00000000000..bc4058abe62
--- /dev/null
+++ b/board/spike/riscv32/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/board/spike/riscv32/readme.txt b/board/spike/riscv32/readme.txt
new file mode 100644
index 00000000000..9cc49af9df3
--- /dev/null
+++ b/board/spike/riscv32/readme.txt
@@ -0,0 +1,30 @@
+Linux on Spike RISC-V 32-bit ISA simulator
+==========================================
+
+This configuration provides a minimal working setup to run a Linux
+kernel in the Spike RISC-V ISA simulator.
+
+The Spike ISA simulator can be an interresting alternative to Qemu, in
+some specific cases. For example: simulating new instructions (see [1]),
+simulating riscv-openocd/gdb debug sessions (see [2], [3]), or
+generating an accurate per-instruction log of execution (see
+riscv-isa-sim spike -l option)...
+
+To run Buildroot Linux in Spike, use the commands:
+
+    make spike_riscv32_defconfig
+    make
+    ./board/spike/riscv32/start.sh
+
+The boot is made with the standard RISC-V OpenSBI boot loader. In
+order to keep the simulation simple, the rootfs is passed as an initrd
+ramfs.
+
+[1].
+https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#simulating-a-new-instruction
+
+[2].
+https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#debugging-with-gdb
+
+[3].
+https://github.com/riscv-collab/riscv-openocd
diff --git a/board/spike/riscv32/start.sh b/board/spike/riscv32/start.sh
new file mode 100755
index 00000000000..43d2d9dcde1
--- /dev/null
+++ b/board/spike/riscv32/start.sh
@@ -0,0 +1,23 @@
+#! /bin/sh
+
+SCRIPT_DIR="$(dirname "$0")"
+BR_BASEDIR="$(readlink -e "${SCRIPT_DIR}/../../..")"
+
+# spike uses dtc at runtime startup, so make sure buildroot host
+# directory is in the PATH
+export PATH="${BR_BASEDIR}/output/host/usr/bin:$PATH"
+
+# Use Buildroot host spike by default, but allow the caller to
+# redefine another spike binary
+: "${SPIKE:=spike}"
+
+# Note 1: Kernel with initrd fail to boot on riscv32 when the system
+# has more than 1GB of RAM. So we set exactly this amount of RAM.
+# Note 2: The default spike ISA is RV64IMAFDC_zicntr_zihpm, so we need
+# to force the RV32 ISA here.
+exec "${SPIKE}" \
+    -m1024 \
+    --initrd "${BR_BASEDIR}"/output/images/rootfs.cpio \
+    --isa="RV32IMAFDC_zicntr_zihpm" \
+    "${@}" \
+    "${BR_BASEDIR}"/output/images/fw_payload.elf
diff --git a/configs/spike_riscv32_defconfig b/configs/spike_riscv32_defconfig
new file mode 100644
index 00000000000..6ea12dc1fb7
--- /dev/null
+++ b/configs/spike_riscv32_defconfig
@@ -0,0 +1,17 @@
+BR2_riscv=y
+BR2_RISCV_32=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/spike/riscv32/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
+BR2_LINUX_KERNEL_DEFCONFIG="rv32"
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
+BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
