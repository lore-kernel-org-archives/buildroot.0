Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE91EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE78881105;
	Sat, 14 Feb 2026 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vt9jBTDURqIs; Sat, 14 Feb 2026 19:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26FF821D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098593;
	bh=HkBkpiNIGmsRBEpf5rK5H/Gz/7KAas7uhGAYyzXjwww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oBTbVPeO2UVQNk5tzPaHhdHa/a0oqzr254cUFdkQcuIPTmLbsKyt9CqhNpgjTqinq
	 Ol//ZWMhm0VnNgQisrar9S7PWmxOYRhS/msznTUTeMpPeUDna+Pd4IYCJj3I0AyWEQ
	 yg37m5WpfPYA9tnMGAHBgBqcPDp7AkTUVo6QVz0TCPvH4NyM6MhQaMCptGSXaFJVrd
	 QxaNaEeUM6TdrteAUzBSQoNGpQKbzcEc3L8BpNbX33H1JeJ/AtSKgtVY5ygCu2yJlU
	 9AjtlYpYjN5ih0gN/+VYwYEpqV4ao7F4m/4kBzvgnaJpbxxSo32pSxtwLUQE0++0xj
	 wyexXdQkHBxBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26FF821D3;
	Sat, 14 Feb 2026 19:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0205C31F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E25BF811BE
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BgVGxnqVSjd for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F53811AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F53811AA
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B60C86D63; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 20:37:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5166e9078e61547f87adc2269423f5aa2f94d85e
X-Git-Newrev: 0800b0f1efa4f1cdaea1512cc4dde7b6e4a1296a
X-Patchwork-Hint: ignore
Message-Id: <20260214194940.2B60C86D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/olimex/a20_olinuxino: move
 rootfs_overlay to rootfs_overlay_mali
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0800b0f1efa4f1cdaea1512cc4dde7b6e4a1296a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit also updates
olimex_a20_olinuxino_lime_defconfig
olimex_a20_olinuxino_lime2_defconfig
to use this new rootfs_overlay_mali directory.

This is to differentiate for the upcoming patch for
a20_olinuxino_micro_defconfig

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../{rootfs_overlay => rootfs_overlay_mali}/boot/extlinux/extlinux.conf | 0
 configs/olimex_a20_olinuxino_lime2_defconfig                            | 2 +-
 configs/olimex_a20_olinuxino_lime_defconfig                             | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay_mali/boot/extlinux/extlinux.conf
similarity index 100%
rename from board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
rename to board/olimex/a20_olinuxino/rootfs_overlay_mali/boot/extlinux/extlinux.conf
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 671aa19687..116daed624 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay_mali"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 2df63b9ab0..437a6113c9 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay_mali"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
