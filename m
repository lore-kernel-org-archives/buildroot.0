Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D8CCCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A68EE84233;
	Thu,  6 Nov 2025 19:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikjbLyTAejyC; Thu,  6 Nov 2025 19:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E5D84220
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E5D84220;
	Thu,  6 Nov 2025 19:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A9DE1CD
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20EB94112E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nO8rklNzGGKc for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62962402EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62962402EE
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5450E81DB9; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Nov 2025 19:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e6a4907ac2707fbbf39717f89307be72a4a6c8c
X-Git-Newrev: 10bf2e6629827e338947c189e88ef5bf32ec4dda
X-Patchwork-Hint: ignore
Message-Id: <20251106193217.5450E81DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45_defconfig: move to
 external Bootlin stable toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=10bf2e6629827e338947c189e88ef5bf32ec4dda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This moves the andes_ae350_45_defconfig to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/andes_ae350_45_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 71057d6ec7..80b780b6e0 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -1,6 +1,7 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
