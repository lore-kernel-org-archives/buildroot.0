Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5052DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 22:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D90E960E03;
	Mon, 19 Dec 2022 22:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90E960E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmpFoJ3BYuWO; Mon, 19 Dec 2022 22:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C17560C13;
	Mon, 19 Dec 2022 22:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C17560C13
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74FA61BF348
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EDB141554
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDB141554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2bP59hlSYJT for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 22:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F8E240A02
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 22:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8E240A02
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B88A86A0C; Mon, 19 Dec 2022 22:13:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 22:25:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bed9b6cd02cf26a8d9b26f876f3f46a7352e6542
X-Git-Newrev: dfbe4215cd19cfe95922ba8536b61f44a6ce8140
X-Patchwork-Hint: ignore
Message-Id: <20221219221348.3B88A86A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_lichee_rv_dock_defconfig:
 use 6.1 kernel headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfbe4215cd19cfe95922ba8536b61f44a6ce8140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel used is based on 6.1-rc3, so use the recently introduced 6.1
kernel headers version to fix a build issue:

Incorrect selection of kernel headers: expected 6.0.x, got 6.1.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sipeed_lichee_rv_dock_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 7c8c6788fa..807209eeec 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
