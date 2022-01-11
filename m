Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC14EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF91415F7;
	Tue, 11 Jan 2022 20:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcqAz1AWszCB; Tue, 11 Jan 2022 20:38:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B329415D3;
	Tue, 11 Jan 2022 20:38:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 566381BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4534F60F17
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ArMtBceH5zFV for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:38:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 852F760F00
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:38:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C07FD81476; Tue, 11 Jan 2022 20:32:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdb390085f212f3d6a243249cccb32bff018ea93
X-Git-Newrev: 7d914839a4ff8c1dd4672b68dac445634cce230f
X-Patchwork-Hint: ignore
Message-Id: <20220111203211.C07FD81476@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc64le_powernv8: new
 defconfig
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
Content-Type: multipart/mixed; boundary="===============1806385199829464144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1806385199829464144==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7d914839a4ff8c1dd4672b68dac445634cce230f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PowerNV is the platform using the OPAL [1] firmware on OpenPOWER
systems. OPAL first loads a kernel and an initramfs image based on
buildroot including a second boot loader petitboot [2]. The latter
does device discovery and kexecs a new Linux image from disk or
network.

QEMU implements PowerNV machines [3] for the POWER8, POWER9 and
Power10 processors which are used for dev and tests. POWER8 images
being compatible with POWER9 and Power10, simply add a single
qemu_ppc64le_powernv8 board for all.

The QEMU script boots directly from a nvme disk because it is simple
enough but a real system would boot from a ramfs first.

[1] https://github.com/open-power/skiboot/blob/master/doc/overview.rst
[2] https://github.com/open-power/petitboot/
[3] https://qemu.readthedocs.io/en/latest/system/ppc/powernv.html

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                              |  4 ++++
 board/qemu/ppc64le-powernv8/readme.txt  |  5 +++++
 configs/qemu_ppc64le_powernv8_defconfig | 29 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44911a7d94..bac58ffc7b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -504,6 +504,10 @@ F:	package/libsvg-cairo/
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
 
+N:	Cédric Le Goater <clg@kaod.org>
+F:	board/qemu/ppc64le-powernv8/readme.txt
+F:	configs/qemu_ppc64le_powernv8_defconfig
+
 N:	Charles Hardin <ckhardin@gmail.com>
 F:	package/alsa-plugins/
 
diff --git a/board/qemu/ppc64le-powernv8/readme.txt b/board/qemu/ppc64le-powernv8/readme.txt
new file mode 100644
index 0000000000..059f55fbc9
--- /dev/null
+++ b/board/qemu/ppc64le-powernv8/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+qemu-system-ppc64 -M powernv9 -kernel vmlinux -append "console=hvc0 rootwait root=/dev/nvme0n1" -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 -drive file=./rootfs.ext2,if=none,id=drive0,format=raw,cache=none -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0  -netdev user,id=net0 -serial mon:stdio -nographic # qemu_ppc64le_powernv8_defconfig
+
+The login prompt will appear in the terminal window.
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
new file mode 100644
index 0000000000..d8ea6655fc
--- /dev/null
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -0,0 +1,29 @@
+# Architecture
+BR2_powerpc64le=y
+BR2_powerpc_power8=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
+BR2_LINUX_KERNEL_DEFCONFIG="powernv"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

--===============1806385199829464144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1806385199829464144==--
