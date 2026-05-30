Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D0ECD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A5D6F575;
	Sat, 30 May 2026 14:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVhZxtwuxZ7T; Sat, 30 May 2026 14:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 892E160FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152765;
	bh=7h1Odj2QxZCOBJjc6pafdVHl6m2NJf86MfCGuqteJKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Geb9qS6ctuPHWBEhW812Sb1P7aeuJf0R6yfRkbnnM640gBJ4bj7FFalZ2prihLv5v
	 q2hd4Jim5mJ7NMpkjEtSlbAGPREr0zMumJvDKKzWIfPhc+V371eCzQnbRyW8ii4Uux
	 ErFCZmZxq1VOlYopsAlw62TsLWGGw751rD+dQiEfB2UXMph2LSBYn1FsSFFYBTXzhm
	 3j04pXyBiUrWNC3KhzL79hQHL3NEYWwcvAQXw6rp+xDcg2NM+rEYd95nD4Bp4w28o+
	 N4r5Rhd801AHKJr9MJBl13Nkd1WnP1l9B55tUFDRnvjJDTPRsE3KipPSqfTONyIiKw
	 Un9t1XXiDBS/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 892E160FCC;
	Sat, 30 May 2026 14:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC429F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B287042A45
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tA6QBa-ttEsI for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0892842A42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0892842A42
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E974A8751E; Sat, 30 May 2026 14:52:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:51:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3523e1ac79c15c5199a15589692e269191abd546
X-Git-Newrev: 98e6dcd05bddfa810818a8479c3a45f16da917ff
X-Patchwork-Hint: ignore
Message-Id: <20260530145229.E974A8751E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/qemu_ppc64le_powernv10: new defconfig
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98e6dcd05bddfa810818a8479c3a45f16da917ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

The Power10 CPU is supported by the Linux Kernel since v5.8
(see upstream commit [1]), and the Powernv10 machine is supported
in qemu since version v5.0.0 (see upstream commit [2]).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a3ea40d5c7365e7e5c7c85b6f30b15142b397571
[2] https://gitlab.com/qemu-project/qemu/-/commit/2b548a4255ca07cf4d467b7fb3bdf2ab79b7dff5

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc64le-powernv10/readme.txt  | 14 ++++++++++++++
 configs/qemu_ppc64le_powernv10_defconfig | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/board/qemu/ppc64le-powernv10/readme.txt b/board/qemu/ppc64le-powernv10/readme.txt
new file mode 100644
index 0000000000..9ac60a2cae
--- /dev/null
+++ b/board/qemu/ppc64le-powernv10/readme.txt
@@ -0,0 +1,14 @@
+Run the emulation with:
+
+qemu-system-ppc64 \
+    -M powernv10 \
+    -kernel output/images/vmlinux \
+    -append "console=hvc0 rootwait root=/dev/nvme0n1" \
+    -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 \
+    -drive file=output/images/rootfs.ext2,if=none,id=drive0,format=raw,cache=none \
+    -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0 \
+    -netdev user,id=net0 \
+    -serial mon:stdio \
+    -nographic # qemu_ppc64le_powernv10_defconfig
+
+The login prompt will appear in the terminal window.
diff --git a/configs/qemu_ppc64le_powernv10_defconfig b/configs/qemu_ppc64le_powernv10_defconfig
new file mode 100644
index 0000000000..41765c2f17
--- /dev/null
+++ b/configs/qemu_ppc64le_powernv10_defconfig
@@ -0,0 +1,19 @@
+BR2_powerpc64le=y
+BR2_powerpc_power10=y
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
