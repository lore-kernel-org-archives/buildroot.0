Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824F2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C011561168
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C011561168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F43406FD;
	Wed, 13 Oct 2021 16:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYr6j6a78YuU; Wed, 13 Oct 2021 16:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06CF406CC;
	Wed, 13 Oct 2021 16:05:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38EA41BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3578B60A3C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ep8yfhRMOmWZ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB3F608DA
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 001B195578; Wed, 13 Oct 2021 16:02:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 18:01:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9aa5a1a8a5b73f2cd6f339e5451c21a566a71e0
X-Git-Newrev: 5ece6be60b8147d05c7c51fd49f64e0140399727
X-Patchwork-Hint: ignore
Message-Id: <20211013160230.001B195578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/ext2: fir (again) namespace for
 variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ece6be60b8147d05c7c51fd49f64e0140399727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Jens [0], commit db7d78614098 (fs/ext2: fix namespace for
variables) forgot to rename one variable expansion, resulting in the
ext2 label as set by the user to be ignored, with an empty label set.

[0] https://github.com/buildroot/buildroot/commit/db7d78614098#commitcomment-57918423

Reported-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/ext2/ext2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 0b797f315f..5b5393f092 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -21,7 +21,7 @@ ROOTFS_EXT2_OPTS = \
 	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
-	-L "$(EXT2_LABEL)" \
+	-L "$(ROOTFS_EXT2_LABEL)" \
 	$(ROOTFS_EXT2_MKFS_OPTS)
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
