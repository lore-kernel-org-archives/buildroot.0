Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3717883E92;
	Tue, 11 Jan 2022 22:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASJTPFDEXi2T; Tue, 11 Jan 2022 22:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 664D282977;
	Tue, 11 Jan 2022 22:06:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE631BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 881FF6FB51
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1sJDlvQWcNp for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9BE46FB58
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:06:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F3EB9825F7; Tue, 11 Jan 2022 22:00:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:58:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea033cecf990ed3f86619647523a9ad2ccb09adb
X-Git-Newrev: 24d07fdc1404901fb1872ac55f875fe1d555cbb3
X-Patchwork-Hint: ignore
Message-Id: <20220111220020.F3EB9825F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/spike_riscv64: new defconfig
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24d07fdc1404901fb1872ac55f875fe1d555cbb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                      |  2 ++
 board/spike/riscv64/readme.txt  | 39 +++++++++++++++++++++++++++++++++++++++
 board/spike/riscv64/start.sh    | 13 +++++++++++++
 configs/spike_riscv64_defconfig | 13 +++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 13464178c0..bcc54bd11b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1588,10 +1588,12 @@ F:	package/paho-mqtt-c
 
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
index 0000000000..cc145bcd8e
--- /dev/null
+++ b/configs/spike_riscv64_defconfig
@@ -0,0 +1,13 @@
+BR2_riscv=y
+BR2_RISCV_64=y
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
