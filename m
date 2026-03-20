Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F5DF483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77018821E9;
	Mon, 23 Mar 2026 19:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TTcVCx29fDX; Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19C3821F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295250;
	bh=ZwCbgWSq6N/UpmYVcJkJJqRF2QZq+HdAUTw91xt9WWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JXbw6/jcn4RqxNLnU6cFQxHDbzymBFDcwYVR5gZd1N+nDfrHMtgo/M6JFo2qWoBc4
	 jwBeOvq3vNh3wtqOv389c/5Gyi7QiiwWud+Z/rQ+Mqqgk0IvjmkOml2WvFAXjprexF
	 axJIQxgyRCDmdVad9lZOUJ+pPYywPBj5cm4k0O2CH5tskGRl825mfCgaNpyT65EQFI
	 mziwhPTMWleWSxbIrAJ4gzTVXv152bhwlii5SQooXQKJd9T1Cb8czRvGC2rA1B3uVI
	 jYoG3anQ+LbhTkNWw1lIgEEcQFGThpBkle7AgIN2laQdCOiqu+l92w4nPjATBqzceJ
	 sjNP9nblH/14g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F19C3821F1;
	Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0DA353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2518B405D6
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKoPayaQseIa for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43FD405EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E43FD405EE
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 242C884C53; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a64a415ff6cc5ab92c86b62b2ab83b0b40e6882b
X-Git-Newrev: ea0d7ef922616a689c79d4d56890b921ddfcbfb3
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.242C884C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/aarch64_efi:
 switch to external toolchain
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea0d7ef922616a689c79d4d56890b921ddfcbfb3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This commit switches the aarch64_efi_defconfig to an external glibc
stable Bootlin toolchain, to follow recommendation from [1].

Since an external toolchain is used, the linux-headers.hash custom
hash file is no longer needed and is removed.

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 18b85442351e80099fd97d20cd4774b17fc9f2c4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/aarch64-efi/patches/linux-headers/linux-headers.hash | 1 -
 configs/aarch64_efi_defconfig                              | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/aarch64-efi/patches/linux-headers/linux-headers.hash b/board/aarch64-efi/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/aarch64-efi/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 3aa649cf9c..2bc6740eaf 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/aarch64-efi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
