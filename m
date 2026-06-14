Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF78CD98D2
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79ACE41193;
	Sun, 14 Jun 2026 10:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5yhSMXz0E7l; Sun, 14 Jun 2026 10:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDAB411DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781432011;
	bh=+OdOJV4clk44M/DCsisdFNFXGvrfINDqc8QuGyuRGk4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NT05uvSOuNiwfXIgoWiCdTpdUVeiK84LGuk3MeZ3pg1YRjdNO5bKhTULdJlPJHKy2
	 WIMajv/ljSOR1e9hFYvOPCGNnytiv9WmTYaRn1QXDxqB3TzT4ngBtRfyyAULEetM5h
	 8zahnNRZSBdjeO+LjXFzrh36G0qLE/f9XX4laLGUNQ2Vl1K7hzuhtMxE01TK10GDRQ
	 q43ybSWCpzuFJrVdHYqLnQPXtS5VJivVDw1rSqD5702hq0OQfr51s+jvW6wDarmZwS
	 WJbJTQ1O0llp7+DD0x8WyhtUKnQmGezYjDMF9CIFp9ff0Hz8di+HpljLsxK0gJHtkO
	 +t+/rHCiw2X6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDAB411DB;
	Sun, 14 Jun 2026 10:13:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEECE169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E117E6079B
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sI1eY2E9_ta for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4AE606DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D4AE606DC
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8AE0881ED; Sun, 14 Jun 2026 10:13:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 12:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b6450e41f856d0c1279d7c1bf02baae42417524
X-Git-Newrev: 1fa2d87c8553c6fa31dbb07029764d90e18b7efa
X-Patchwork-Hint: ignore
Message-Id: <20260614101305.D8AE0881ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_{riscv64,
 x86_64}*_efi_defconfig: switch to Bootlin stable toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1fa2d87c8553c6fa31dbb07029764d90e18b7efa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the qemu riscv64/x86_64 efi configurations to use the Bootlin
glibc stable prebuilt external toolchain, as recommended in the
Buildroot meeting report from ELCE 2024:
https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minutes by ~20 minutes.

https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914014 (qemu_riscv64_virt_efi_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914021 (qemu_x86_64_efi_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv64_virt_efi_defconfig | 4 +++-
 configs/qemu_x86_64_efi_defconfig       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
index 4e698fcd5e..c279e159af 100644
--- a/configs/qemu_riscv64_virt_efi_defconfig
+++ b/configs/qemu_riscv64_virt_efi_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_x86_64_efi_defconfig b/configs/qemu_x86_64_efi_defconfig
index 1fb3682354..60790857b5 100644
--- a/configs/qemu_x86_64_efi_defconfig
+++ b/configs/qemu_x86_64_efi_defconfig
@@ -1,5 +1,7 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
