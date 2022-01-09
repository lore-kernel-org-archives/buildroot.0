Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A368DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E386400CD;
	Sun,  9 Jan 2022 16:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SupcTaOKKfyl; Sun,  9 Jan 2022 16:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E66740495;
	Sun,  9 Jan 2022 16:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 288331BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 177538140F
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gchkznRy6-4T for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
 by smtp1.osuosl.org (Postfix) with ESMTP id D44CC8138A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:48:32 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id 57F54834C7D
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:48:30 +0100 (CET)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.89.173])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 759BEB0051E;
 Sun,  9 Jan 2022 17:48:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641746906;
 bh=3evtX586Wg2Cee5bh7u3KPDFXkhjRwptvgCVtD23VBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NN7e2VEMzxm/T7AYtYOcAE4Vt4iq3NxIVniLikaafgBdtgtCajNHmp9BSQZWWrbLV
 U5wG4Nl+GUO+296+vk5j2IveRJapjbWSU2CG89oL8d09uB/GMf3ne9t3PPpvvjE8ri
 ZzXJT9h8kVD96xmqVZBdy7F1htDsulvRM2ayeniSRMVtHORF7XK3rzdZHebLDHrHVT
 WGd0mGyhrmPauvn27IL7hCvuBklvHaHMiQZApDj/kip+/UGbq3fpp5vyXbh52pgZ4O
 U4NSp82FeNYy/hAj8joQ3ubZLnnoQclb+Fu1yhjjBxrZn83FI/K+ajeXcAIyzsFEtq
 7WikGl2bluTmA==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 17:47:56 +0100
Message-Id: <20220109164756.1312023-2-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109164756.1312023-1-ju.o@free.fr>
References: <20220109164756.1312023-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/spike_riscv64: new defconfig
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                      |  2 ++
 board/spike/riscv64/readme.txt  | 39 +++++++++++++++++++++++++++++++++
 board/spike/riscv64/start.sh    | 13 +++++++++++
 configs/spike_riscv64_defconfig | 12 ++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 board/spike/riscv64/readme.txt
 create mode 100755 board/spike/riscv64/start.sh
 create mode 100644 configs/spike_riscv64_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 59a8dba2ab..bf495be538 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1578,10 +1578,12 @@ F:	package/paho-mqtt-c
 
 N:	Julien Olivain <ju.o@free.fr>
 F:	board/qmtech/zynq/
+F:	board/spike/
 F:	board/technexion/imx8mmpico/
 F:	board/technexion/imx8mpico/
 F:	configs/imx8mmpico_defconfig
 F:	configs/imx8mpico_defconfig
+F:	configs/spike_riscv64_defconfig
 F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
diff --git a/board/spike/riscv64/readme.txt b/board/spike/riscv64/readme.txt
new file mode 100644
index 0000000000..5ad7df46df
--- /dev/null
+++ b/board/spike/riscv64/readme.txt
@@ -0,0 +1,39 @@
+Linux on Spike RISC-V ISA simulator
+===================================
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
+    make spike_riscv64_defconfig
+    make
+    ./board/spike/riscv64/start.sh
+
+The boot is made with the standard RISC-V OpenSBI boot loader. In
+order to keep the simulation simple, the rootfs is passed as an initrd
+ramfs.
+
+Note: at the time of this writing, Spike v1.1.0 and OpenSBI v1.0 does
+not support console input emulation for 32bit RISC-V systems. A 32bit
+Linux system can boot and reach the login, but it's not possible to
+login. See [4].
+
+
+[1].
+https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#simulating-a-new-instruction
+
+[2].
+https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#debugging-with-gdb
+
+[3].
+https://github.com/riscv/riscv-openocd
+
+[4].
+https://github.com/riscv-software-src/opensbi/blob/v1.0/lib/utils/sys/htif.c#L127
diff --git a/board/spike/riscv64/start.sh b/board/spike/riscv64/start.sh
new file mode 100755
index 0000000000..75b1412df8
--- /dev/null
+++ b/board/spike/riscv64/start.sh
@@ -0,0 +1,13 @@
+#! /bin/sh
+
+SCRIPT_DIR="$(dirname "$0")"
+BR_BASEDIR="$(readlink -e "${SCRIPT_DIR}/../../..")"
+
+# Use Buildroot host spike by default, but allow the caller to
+# redefine another spike binary
+: "${SPIKE:=${BR_BASEDIR}/output/host/usr/bin/spike}"
+
+exec "${SPIKE}" \
+    --initrd "${BR_BASEDIR}"/output/images/rootfs.cpio \
+    "${@}" \
+    "${BR_BASEDIR}"/output/images/fw_payload.elf
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
new file mode 100644
index 0000000000..4cce20b360
--- /dev/null
+++ b/configs/spike_riscv64_defconfig
@@ -0,0 +1,12 @@
+BR2_riscv=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
+BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
