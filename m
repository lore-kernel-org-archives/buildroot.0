Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDAAC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74F984E19;
	Fri, 28 Feb 2025 17:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cb6dhlTzMLmu; Fri, 28 Feb 2025 17:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12B1847C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12B1847C4;
	Fri, 28 Feb 2025 17:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1539968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A79406B9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSUb1cZEhXES for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD9E742CEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9E742CEF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A516A86A52; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:13:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 920f45bd244166c8401dd05e054fc894eba143bf
X-Git-Newrev: 03fcf6034012c069e975330e831ef79b4bdb70d4
X-Patchwork-Hint: ignore
Message-Id: <20250228163027.A516A86A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/spike_riscv{32,
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
