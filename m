Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1778FC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2588409AE;
	Sat, 13 Jul 2024 14:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7O-pw-LdTtf; Sat, 13 Jul 2024 14:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C40D409C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C40D409C9;
	Sat, 13 Jul 2024 14:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA2E81BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1FD681EA0
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfuGc4RPISet for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB23281E88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB23281E88
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:19:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D34758649E; Sat, 13 Jul 2024 14:19:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:19:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 619b83a4438667cdb4cc8a7dddc79dbf6d84ec2a
X-Git-Newrev: c2237dd25072236fe9a5dffd03bf2cdda71ff819
X-Patchwork-Hint: ignore
Message-Id: <20240713141954.D34758649E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_riscv32_nommu_virt: remove
 duplicate entry
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2237dd25072236fe9a5dffd03bf2cdda71ff819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37 added accidentally
a duplicate of BR2_DOWNLOAD_FORCE_CHECK_HASHES and forgot to remove
existing board/qemu/riscv32-virt/patches directory. Remove that.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Romain: slightly update the commit log]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash | 2 --
 board/qemu/riscv32-virt/patches/linux/linux.hash                 | 2 --
 configs/qemu_riscv32_nommu_virt_defconfig                        | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash b/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
deleted file mode 100644
index a6c777192c..0000000000
--- a/board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/board/qemu/riscv32-virt/patches/linux/linux.hash b/board/qemu/riscv32-virt/patches/linux/linux.hash
deleted file mode 100644
index a6c777192c..0000000000
--- a/board/qemu/riscv32-virt/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/qemu_riscv32_nommu_virt_defconfig b/configs/qemu_riscv32_nommu_virt_defconfig
index 38a1cf791f..b958d42d02 100644
--- a/configs/qemu_riscv32_nommu_virt_defconfig
+++ b/configs/qemu_riscv32_nommu_virt_defconfig
@@ -7,10 +7,6 @@ BR2_RISCV_32=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Hashes
-BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-
 # Linux headers same as kernel
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
