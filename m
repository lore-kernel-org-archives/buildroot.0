Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11A0D116F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A8E61B38;
	Thu, 27 Nov 2025 20:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfWpKz8H8LWe; Thu, 27 Nov 2025 20:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B33661AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B33661AFC;
	Thu, 27 Nov 2025 20:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E9C2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9ED384425
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m64K9MaQXhq0 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCFDE84429
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCFDE84429
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB6BA85FCC; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:32:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 569b6298758244210ddd6377885b9c3a3bdfab6a
X-Git-Newrev: 62a896350fbce26a319312ace626153fbb9c053f
X-Patchwork-Hint: ignore
Message-Id: <20251127200756.DB6BA85FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] fs/squashfs: correct
 aarch64 conditional
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

commit: https://git.buildroot.net/buildroot/commit/?id=62a896350fbce26a319312ace626153fbb9c053f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

BR_aarch64 is not defined. it seems should be BR2_aarch64

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d6d8b5823a7ed5a4c73318bb1d6c52405481dc48)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
