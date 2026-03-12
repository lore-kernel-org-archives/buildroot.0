Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D665106ACD6
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E15E40685;
	Thu, 12 Mar 2026 18:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIaqGcf6VJDB; Thu, 12 Mar 2026 18:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DD740637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340831;
	bh=9GtkBZf/X3eGmuwPcrvCExxh7GoHCRYmLNImXBDA5gE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CipkuZ0lrIb/q5PXE34mlf8GcOLM+FbkMtR4TOOP318unjXomR5tghlRJIjGR5Rc5
	 cAkBSurmgWdCUdUfXN/Bdga63FfXRHDiVWeA8wcSK/jTLhuWONKUIBl79N3FER4GK0
	 3cENQqvFHZ2lY/gI1cZUT0a7Gtpl/wrl7e26q/1QOZusexFyC68rz0kX9dvzrKP9C8
	 vB7eNz8EB8I8d3qlLk+tltPvMHBWo3Ui1TlksEtt5xDvCtZ4XVI36lV2Zx+h9JHwmw
	 4Q0e4BA+O+avTRY7h0A/A2LOki3ZYRIjehS+TzmDa1XwhMETciYikIj8VwNMRlPfpv
	 CU8Ov+Y1fpOLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DD740637;
	Thu, 12 Mar 2026 18:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 312EB201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C5D400EA
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_h3V_0XGOh5 for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 452E040119
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 452E040119
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66B4E8718E; Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 19:37:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e55952b17342ee7ae09cb73b862cd5572e0a00af
X-Git-Newrev: 18b85442351e80099fd97d20cd4774b17fc9f2c4
X-Patchwork-Hint: ignore
Message-Id: <20260312184028.66B4E8718E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aarch64_efi: switch to external
 toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18b85442351e80099fd97d20cd4774b17fc9f2c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit switches the aarch64_efi_defconfig to an external glibc
stable Bootlin toolchain, to follow recommendation from [1].

Since an external toolchain is used, the linux-headers.hash custom
hash file is no longer needed and is removed.

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Julien Olivain <ju.o@free.fr>
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
