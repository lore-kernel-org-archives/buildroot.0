Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBB0CCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722B141139;
	Thu,  6 Nov 2025 19:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yi7SA1ve86Zp; Thu,  6 Nov 2025 19:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1AF04112E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1AF04112E;
	Thu,  6 Nov 2025 19:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F3E4B00
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B66607FC
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBu0DMm7Hlmq for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51319607ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51319607ED
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C35983EF4; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Nov 2025 19:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a29196c96843a9c64963db12cf14f20b3885e70f
X-Git-Newrev: 5e6a4907ac2707fbbf39717f89307be72a4a6c8c
X-Patchwork-Hint: ignore
Message-Id: <20251106193217.4C35983EF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45_defconfig: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e6a4907ac2707fbbf39717f89307be72a4a6c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES to check the hashes.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore              | 1 -
 configs/andes_ae350_45_defconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ad0937eefb..7b0b2971aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -74,7 +74,6 @@ boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_p
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
-configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 5e8ea5468d..71057d6ec7 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -2,6 +2,7 @@ BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_OVERLAY="board/andes/ae350/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/andes/ae350/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
