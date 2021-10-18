Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED87AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:35:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964A8604E9
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 964A8604E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4436982A6C;
	Mon, 18 Oct 2021 12:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDJiWwd3j9Rt; Mon, 18 Oct 2021 12:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA42082532;
	Mon, 18 Oct 2021 12:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F83C1BF27C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CB4A4038F
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5J7YxhW70XkY for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:35:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 862424034C
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 12:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EBC1B86953; Mon, 18 Oct 2021 12:32:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 14:34:55 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: f04e3ef05f50f08f61f3fc0f7d27f4e186c48de4
X-Git-Newrev: bc1f091cbcea9e0661912cd7981e500cc1afeda4
X-Patchwork-Hint: ignore
Message-Id: <20211018123204.EBC1B86953@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] fs/ext2: fir (again)
 namespace for variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc1f091cbcea9e0661912cd7981e500cc1afeda4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

As reported by Jens [0], commit db7d78614098 (fs/ext2: fix namespace for
variables) forgot to rename one variable expansion, resulting in the
ext2 label as set by the user to be ignored, with an empty label set.

[0] https://github.com/buildroot/buildroot/commit/db7d78614098#commitcomment-57918423

Reported-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5ece6be60b8147d05c7c51fd49f64e0140399727)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
