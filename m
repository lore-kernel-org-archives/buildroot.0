Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78A3C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 06:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E14082768;
	Tue, 14 May 2024 06:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6sgvty2BIyf; Tue, 14 May 2024 06:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD1682784
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD1682784;
	Tue, 14 May 2024 06:28:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB161BF38D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 06:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88B6140839
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 06:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1CsSR1a9_Dl for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 06:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45A3740830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A3740830
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45A3740830
 for <buildroot@buildroot.org>; Tue, 14 May 2024 06:27:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 78F8E35208EF; Tue, 14 May 2024 08:27:54 +0200 (CEST)
Date: Tue, 14 May 2024 08:27:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkMEagMTXYIsMqtu@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715668074; bh=QGER+oJtPkW6O7vDD/tCwBhQy89CJUVS7zHB6p53YpQ=;
 h=Date:From:To:Subject:From;
 b=YeDP48g8eHFXBpul1MuWgI3C5C82/5ZRbhLb/32fuWWvfqHLmW0SI1h7q/PimZjKo
 FJx9omodEMATaxJemV1XRkkPxPQvrfpJ+diJqNNHywBlAXg8on2d9gHDjrvXRHOSHE
 BLvzmrgxsjiHPhIlLiHUfsyz3m+syHSUl/V8ao7RRVFrDD/cxuOYhyFWomfsOj6srI
 6sz6K1EPqngdTcZPHkZfZOXvg18/hPEHFsPB+ggLnqus0IsjSN/DF8f9DjHya0osiI
 39U4mqwC8AENeFNvF0LbWxgFEpT5qQwjzISxwxpp9r+6gaLP6nZtBcpWp5IOAmvL2v
 mzYqJX0J+lArQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=YeDP48g8
Subject: [Buildroot] [PATCH 3/3] configs/qemu_loongarch64: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../patches/linux-headers/linux-headers.hash  |  2 ++
 .../qemu/loongarch64/patches/linux/linux.hash |  2 ++
 configs/qemu_loongarch64_defconfig            | 27 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 board/qemu/loongarch64/patches/linux-headers/linux-headers.hash
 create mode 100644 board/qemu/loongarch64/patches/linux/linux.hash
 create mode 100644 configs/qemu_loongarch64_defconfig

diff --git a/board/qemu/loongarch64/patches/linux-headers/linux-headers.hash b/board/qemu/loongarch64/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..f3d9c1186a
--- /dev/null
+++ b/board/qemu/loongarch64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
diff --git a/board/qemu/loongarch64/patches/linux/linux.hash b/board/qemu/loongarch64/patches/linux/linux.hash
new file mode 100644
index 0000000000..f3d9c1186a
--- /dev/null
+++ b/board/qemu/loongarch64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
diff --git a/configs/qemu_loongarch64_defconfig b/configs/qemu_loongarch64_defconfig
new file mode 100644
index 0000000000..025e9907e2
--- /dev/null
+++ b/configs/qemu_loongarch64_defconfig
@@ -0,0 +1,27 @@
+# Architecture
+BR2_loongarch64=y
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
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_DEFCONFIG="loongson3"
+BR2_LINUX_KERNEL_VMLINUX_EFI=y
+
+# Disable network scripts
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
