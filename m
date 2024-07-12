Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2798FC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB7160658;
	Fri, 12 Jul 2024 18:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxzTPU0aFlDc; Fri, 12 Jul 2024 18:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D17746138C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17746138C;
	Fri, 12 Jul 2024 18:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75BC31BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E2704175C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lYAj3vqQesW for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCA774169E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA774169E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCA774169E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:39:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3850FB00585;
 Fri, 12 Jul 2024 20:39:36 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 20:39:31 +0200
Message-ID: <20240712183931.245991-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720809577;
 bh=gU/JQXOaouiXzb2YoZBU33N3GHdJksfJ+xifBz/WzjE=;
 h=From:To:Cc:Subject:Date:From;
 b=sKVpVrE4dduuDL1sIUMoslUKll7i/nsWkfDliXw5E+t40ulic/WJIG5/k9k/A9FYN
 9XDfsdQieeovt8P7FhbXJCwSqmA5apN0JVnnDYWInyXUoPzTb3WyPnIQt5+AguUHoE
 RlULbBKGfdpNrr73zqOP+mdcPIgJBZg9va8IQdbMTf4HskOPOfURTUxWAlrrmmX4EX
 qAMRT8YrjvSr6gKC5xDPnclGH+Y+YCZ34MxfrOqcehn5xqj+M+xt8N9sxGbiygPVCA
 oKExWpU8w5AHcYPkwEgUtyHGjQuk97T/remgvmWoWPij3xMDI2/1ia9Xoq8Puh4knF
 iVlO08xbUnToQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sKVpVrE4
Subject: [Buildroot] [PATCH 1/1] configs/spike_riscv64: bump kernel to
 6.6.35 and add hashes
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

Commit [1] introduced a new spike_riscv32_defconfig with Kernel
at v6.6.35.

This commit bumps the Kernel of spike_riscv64_defconfig to have it
aligned with its 32bit counterpart.

This commit also adds custom hashes. Therefore, it adds
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig, adds a global
patch directory, and removes the entry in ".checkpackageignore".

Finally, to completely align with the spike_riscv32_defconfig, the
config directive BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM is moved by few
lines.

With this commit, the maintenance of the two spike_riscv{32,64}
defconfigs will be easier.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a83ab3f4c8621dec58dc78a8dcb48e519377ac3d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                         | 1 -
 .../spike/riscv64/patches/linux-headers/linux-headers.hash  | 1 +
 board/spike/riscv64/patches/linux/linux.hash                | 2 ++
 board/spike/riscv64/patches/opensbi/opensbi.hash            | 2 ++
 configs/spike_riscv64_defconfig                             | 6 ++++--
 5 files changed, 9 insertions(+), 3 deletions(-)
 create mode 120000 board/spike/riscv64/patches/linux-headers/linux-headers.hash
 create mode 100644 board/spike/riscv64/patches/linux/linux.hash
 create mode 100644 board/spike/riscv64/patches/opensbi/opensbi.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 2c0f265d96..be51c16e36 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -282,7 +282,6 @@ configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
-configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/spike/riscv64/patches/linux-headers/linux-headers.hash b/board/spike/riscv64/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/spike/riscv64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/spike/riscv64/patches/linux/linux.hash b/board/spike/riscv64/patches/linux/linux.hash
new file mode 100644
index 0000000000..a3b67a09a4
--- /dev/null
+++ b/board/spike/riscv64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  fce3ee728712ed063aa8c14a8756c8ff8c7a46ba3827f61d2b04a73c7cf5dd9e  linux-6.6.35.tar.xz
diff --git a/board/spike/riscv64/patches/opensbi/opensbi.hash b/board/spike/riscv64/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..bc4058abe6
--- /dev/null
+++ b/board/spike/riscv64/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index fa8cba4275..feb13d84db 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -1,10 +1,12 @@
 BR2_riscv=y
 BR2_RISCV_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/spike/riscv64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.26"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
