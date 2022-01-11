Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1F1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8345415F9;
	Tue, 11 Jan 2022 20:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvvMFNT479ra; Tue, 11 Jan 2022 20:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0330415F7;
	Tue, 11 Jan 2022 20:44:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0E41BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E124B83E65
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ronzp56g-TR1 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:44:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E27883E64
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:44:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 65DDF832DB; Tue, 11 Jan 2022 20:38:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:44:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 965d19386dfa0659ed0b1668085df1918b020281
X-Git-Newrev: 8ac0775130426e1ebc6d291bb3b131e19afc92fa
X-Patchwork-Hint: ignore
Message-Id: <20220111203818.65DDF832DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc_bamboo: new defconfig
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
Content-Type: multipart/mixed; boundary="===============8408704346145638770=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8408704346145638770==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8ac0775130426e1ebc6d291bb3b131e19afc92fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Bamboo board is an evaluation board for PowerPC 440EP CPUs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  2 ++
 board/qemu/ppc-bamboo/linux.fragment |  6 ++++++
 board/qemu/ppc-bamboo/readme.txt     |  5 +++++
 configs/qemu_ppc_bamboo_defconfig    | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bac58ffc7b..c8242df8a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -505,7 +505,9 @@ N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
 
 N:	Cédric Le Goater <clg@kaod.org>
+F:	board/qemu/ppc-bamboo/
 F:	board/qemu/ppc64le-powernv8/readme.txt
+F:	configs/qemu_ppc_bamboo_defconfig
 F:	configs/qemu_ppc64le_powernv8_defconfig
 
 N:	Charles Hardin <ckhardin@gmail.com>
diff --git a/board/qemu/ppc-bamboo/linux.fragment b/board/qemu/ppc-bamboo/linux.fragment
new file mode 100644
index 0000000000..cc272d0541
--- /dev/null
+++ b/board/qemu/ppc-bamboo/linux.fragment
@@ -0,0 +1,6 @@
+# Enable virtio (blk, rng and net devices)
+CONFIG_VIRTIO=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_NET=y
diff --git a/board/qemu/ppc-bamboo/readme.txt b/board/qemu/ppc-bamboo/readme.txt
new file mode 100644
index 0000000000..0b70d2fa54
--- /dev/null
+++ b/board/qemu/ppc-bamboo/readme.txt
@@ -0,0 +1,5 @@
+Run the emulation with:
+
+qemu-system-ppc -nographic -M bamboo -kernel vmlinux -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamboo_defconfig
new file mode 100644
index 0000000000..d6abbeb452
--- /dev/null
+++ b/configs/qemu_ppc_bamboo_defconfig
@@ -0,0 +1,36 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_440fp=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
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
+BR2_LINUX_KERNEL_DEFCONFIG="44x/bamboo"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-bamboo/linux.fragment"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Kernel needs mkimage
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

--===============8408704346145638770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8408704346145638770==--
