Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B43CCD19A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 07:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A60F60F1F;
	Tue, 18 Nov 2025 07:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc7lcnW8FKYE; Tue, 18 Nov 2025 07:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C668C60F01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C668C60F01;
	Tue, 18 Nov 2025 07:12:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 375561BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2719D40203
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_IIrPTN2YYn for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 07:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E28400DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62E28400DC
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:12:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50C3C84E15; Tue, 18 Nov 2025 07:12:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Nov 2025 08:02:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5db55534af777fba6543aeb40f60e1080b2828a8
X-Git-Newrev: d6d8b5823a7ed5a4c73318bb1d6c52405481dc48
X-Patchwork-Hint: ignore
Message-Id: <20251118071243.50C3C84E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/squashfs: correct aarch64 conditional
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6d8b5823a7ed5a4c73318bb1d6c52405481dc48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR_aarch64 is not defined. it seems should be BR2_aarch64

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/squashfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 4f898bfdd4..cb2f5ec969 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -114,7 +114,7 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
 	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
 	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
 	default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
-	default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_arm || BR_aarch64)
+	default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_arm || BR2_aarch64)
 	default "-Xbcj powerpc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_powerpc || BR2_powerpc64)
 	default "-Xbcj sparc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_sparc || BR2_sparc64)
 	default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_i386 || BR2_x86_64)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
