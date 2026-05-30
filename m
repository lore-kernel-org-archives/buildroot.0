Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932CECD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A336F58C;
	Sat, 30 May 2026 14:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CsJZvKY69Gg; Sat, 30 May 2026 14:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32B56F58D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152769;
	bh=Ov5m+z27wyatPZ0nzlblXJaxfO8sMm5H3owHQLuAhYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ktyLiMVn/Hu0Vs3A//lT0vdKtAHmH4CdExVoJDlxZG9MoeTHp/OdFWlJt4AKIzRfe
	 QlrCAiJh5mvWtfAJjTYSNGQcfZ5xoNO7I3GT2XiFKywpA0F9a8IT7deibtFZlAVNK6
	 wO5auQ0lafHycvoa/bwGQpsyOrdj2J9PxsfBSoQojIg/WKndCHXxNoo1rofdR7W9E5
	 jcZwEYA/UcZ6lF4cnm1wlxJgU7kPkmAuhBCGRgw6MdLZCUKGdQCBedwVDbu7lDmiMz
	 IWPvdk0OXkt4rEToLdqNvF/GLs/4jH6oVKHorM3YJd8RcHdF6Bo0RH62++vCgDwAA6
	 KnPHo7gmOWSmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32B56F58D;
	Sat, 30 May 2026 14:52:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D9DD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF7394025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie0C5KHj7r7z for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A17C407DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A17C407DC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A22587520; Sat, 30 May 2026 14:52:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:52:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: da1b45dd00fd28e9db3f24dbb7b10ad2e7a024e7
X-Git-Newrev: a3c6c0cbad95f03dc031b1effdff414bb2525493
X-Patchwork-Hint: ignore
Message-Id: <20260530145230.0A22587520@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/qemu_ppc64le_powernv11: new defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3c6c0cbad95f03dc031b1effdff414bb2525493
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

The Power11 CPU is supported by the Linux Kernel since v6.9
(see upstream commit [1]), and the Powernv11 machine is supported
in qemu since version v10.2.0 (see upstream commit [2]).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=c2ed087ed35ca569d8179924ba560be248c758e5
[2] https://gitlab.com/qemu-project/qemu/-/commit/73a911e966acd8314e39a4ce4bc58e2254e68324

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc64le-powernv11/readme.txt  | 14 ++++++++++++++
 configs/qemu_ppc64le_powernv11_defconfig | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/board/qemu/ppc64le-powernv11/readme.txt b/board/qemu/ppc64le-powernv11/readme.txt
new file mode 100644
index 0000000000..368bad0264
--- /dev/null
+++ b/board/qemu/ppc64le-powernv11/readme.txt
@@ -0,0 +1,14 @@
+Run the emulation with:
+
+qemu-system-ppc64 \
+    -M powernv11 \
+    -kernel output/images/vmlinux \
+    -append "console=hvc0 rootwait root=/dev/nvme0n1" \
+    -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 \
+    -drive file=output/images/rootfs.ext2,if=none,id=drive0,format=raw,cache=none \
+    -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0 \
+    -netdev user,id=net0 \
+    -serial mon:stdio \
+    -nographic # qemu_ppc64le_powernv11_defconfig
+
+The login prompt will appear in the terminal window.
diff --git a/configs/qemu_ppc64le_powernv11_defconfig b/configs/qemu_ppc64le_powernv11_defconfig
new file mode 100644
index 0000000000..94266a22d5
--- /dev/null
+++ b/configs/qemu_ppc64le_powernv11_defconfig
@@ -0,0 +1,19 @@
+BR2_powerpc64le=y
+BR2_powerpc_power11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
+BR2_LINUX_KERNEL_DEFCONFIG="powernv"
+BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
