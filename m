Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B60C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC8A607EC;
	Mon,  3 Feb 2025 22:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmXy3-uRNr_X; Mon,  3 Feb 2025 22:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D764F608A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D764F608A7;
	Mon,  3 Feb 2025 22:13:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D357D185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B767B40399
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGjRkNJrBnyM for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9408403A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9408403A5
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CDE586A4D; Mon,  3 Feb 2025 22:13:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:13:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 920f45bd244166c8401dd05e054fc894eba143bf
X-Git-Newrev: 03fcf6034012c069e975330e831ef79b4bdb70d4
X-Patchwork-Hint: ignore
Message-Id: <20250203221354.3CDE586A4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/spike_riscv{32,
 64}: bump opensbi to v1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=03fcf6034012c069e975330e831ef79b4bdb70d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/spike/riscv32/patches/opensbi/opensbi.hash | 2 +-
 board/spike/riscv64/patches/opensbi/opensbi.hash | 2 +-
 configs/spike_riscv32_defconfig                  | 2 +-
 configs/spike_riscv64_defconfig                  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/spike/riscv32/patches/opensbi/opensbi.hash b/board/spike/riscv32/patches/opensbi/opensbi.hash
index bc4058abe6..d7893a1dee 100644
--- a/board/spike/riscv32/patches/opensbi/opensbi.hash
+++ b/board/spike/riscv32/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/board/spike/riscv64/patches/opensbi/opensbi.hash b/board/spike/riscv64/patches/opensbi/opensbi.hash
index bc4058abe6..d7893a1dee 100644
--- a/board/spike/riscv64/patches/opensbi/opensbi.hash
+++ b/board/spike/riscv64/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  319b62a4186fbce9b81a0c5f0ec9f003a10c808397a72138bc9745d9b87b1eb1  opensbi-1.4.tar.gz
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/configs/spike_riscv32_defconfig b/configs/spike_riscv32_defconfig
index 6ea12dc1fb..a73f335f34 100644
--- a/configs/spike_riscv32_defconfig
+++ b/configs/spike_riscv32_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 913830e38e..7b698737e2 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
