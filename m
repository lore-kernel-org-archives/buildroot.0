Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03BAE6526B
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEACA605D1;
	Sun,  1 Feb 2026 21:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCaPdI1AwxRU; Sun,  1 Feb 2026 21:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2145605DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769980514;
	bh=PQ4MtiH0IZNUl7b/4nZKc90pFR0iS3as0V0JVC6lw1w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IfSPhZREoOE9V6/OJz3s8fUtx9d1Qb+o5MeWdICOee9xqlEMKJCIVexfzLSJP4cF5
	 nQZMgx69+IRZy/XjQNUrutozojr9HcNZ4iM9UZPHS+053X1IO6hEn6UjWF9JrE/vBn
	 OIoMvouw2jKQGK/bkKeflc2xlzoJkYqH5+BWq/3U1NUQhTkd8ObcSkE65UFbKzELJe
	 MZdmHBVxtIMqkGpYia2N9OqHfYHe/Yq3nhFJNwrpFroMs1yFyeUE8D/S8ypeK85jBu
	 PoBGOE7EkP2ULjkDcn/V7Kqq9u4zm+5zfwBSzzgZmRVukWsbW+xHuHgdD+/wa3GT4m
	 QJNS56zZ+ZklQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2145605DE;
	Sun,  1 Feb 2026 21:15:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3831E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 998C34062A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFFGIH8TcRiL for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 21:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB05640632
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB05640632
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:15:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A502D861E0; Sun,  1 Feb 2026 21:15:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 22:14:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44cbf0fc9daf8307e11dbd1d2370e2e603cf05af
X-Git-Newrev: 8501cb30fb21f2ca33d6cf23d670f0456e25aca3
X-Patchwork-Hint: ignore
Message-Id: <20260201211511.A502D861E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_r3s: bump Linux
 to 6.18.8 and U-Boot to 2026.01
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8501cb30fb21f2ca33d6cf23d670f0456e25aca3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the Linux kernel to version 6.18.8 and U-Boot to version 2026.01.

Tested on FriendlyElec NanoPi R3S.

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/friendlyarm/nanopi-r3s/patches/linux/linux.hash | 2 +-
 board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash | 2 +-
 configs/friendlyarm_nanopi_r3s_defconfig              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
index 451159a6dc..f83883b936 100644
--- a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
index b550824126..74d80a0daa 100644
--- a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index beeab11c5e..971a0ae851 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.14.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r3s/kernel.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r3s-rk3566"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
