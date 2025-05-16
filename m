Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193FDC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFEA26F525;
	Mon, 19 May 2025 10:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_sxcA4xZfQP; Mon, 19 May 2025 10:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141F86F555
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141F86F555;
	Mon, 19 May 2025 10:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E7DD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 213F2418D2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1FinRtX-Rp5 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7020441910
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7020441910
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A387873D4; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:41:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a32a1e9a840403ee8e0cab0e4f50f83b4b0536c1
X-Git-Newrev: 42357f0b1322ec57ef54fa7105b46380acfec579
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.6A387873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/friendlyarm_nanopi_r3s: use Bootlin toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=42357f0b1322ec57ef54fa7105b46380acfec579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This moves the defconfig to the Bootlin glibc stable external toolchain
as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/friendlyarm_nanopi_r3s_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 4219147033..5844c5bb4c 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r3s/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi r3s"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
