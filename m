Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A64C106ACDA
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D28E4058A;
	Thu, 12 Mar 2026 18:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id telKMdq1Mi3f; Thu, 12 Mar 2026 18:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0557340687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340833;
	bh=+Ax436qu0pLYU/hiJgP//1njPLJoR/3TzuVyng+X8XE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pTXB6PVL7fuTG1yQeNXp+Zgjgs/qRIPwwi3Q/iwRnWL0om7gI35JrMNvj0jGBffir
	 7dxdWQ1+09CRuGJzSHH1b5ox2woXKN0K74ZEmwDNdflJ9or6pq1OBqeKgZ7qzY0RmD
	 VdXgA3SPbVWBl8dI39CuYtCs+b4vNioVQw0ktALwnhpj+lml4lxbVt2t+C3jG7tB9J
	 LS8cqgWuhYcTfTEM9K0q6685ogMk55wlm3rMJPugWSslTL32b/vmS1GbwRvyOio1V0
	 RCD8BnvQ33RncGoBJRd2An1GdSDC9RM8rHPEHBs2jm6Bz0CUSADtf06p0imNwBfkLP
	 pbjCn9estIxMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0557340687;
	Thu, 12 Mar 2026 18:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82A5B786
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7392E400EA
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lN8cIBDEP0QT for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548914011F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548914011F
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 777A887190; Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 19:38:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18b85442351e80099fd97d20cd4774b17fc9f2c4
X-Git-Newrev: 4cb77b494020ebf7f0572526a3bb12256029495e
X-Patchwork-Hint: ignore
Message-Id: <20260312184028.777A887190@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aarch64_efi: bump kernel to 6.18.13
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
Content-Type: multipart/mixed; boundary="===============8100965244833350348=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8100965244833350348==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cb77b494020ebf7f0572526a3bb12256029495e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Tested-by: Vincent Stehlé <vincent.stehle@arm.com>
[Vincent: tested on: IOT-GATE-iMX8 (eMMC), ROCKPro64 (SD card),
    Qemu virt, Qemu SBSA and FVP Base RevC]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aarch64-efi/patches/linux/linux.hash | 2 +-
 configs/aarch64_efi_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/aarch64-efi/patches/linux/linux.hash b/board/aarch64-efi/patches/linux/linux.hash
index 50983eb42b..7cc4ece4bc 100644
--- a/board/aarch64-efi/patches/linux/linux.hash
+++ b/board/aarch64-efi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
+sha256  8d1934a72a185f1be6b56e3ad8ea31fd9a381ffec0346c69f06c90d776da7cb8  linux-6.18.14.tar.xz
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 2bc6740eaf..390f3fc6ac 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/ge
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y

--===============8100965244833350348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8100965244833350348==--
