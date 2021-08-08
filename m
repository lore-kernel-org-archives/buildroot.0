Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E106C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:22:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA00B60E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA00B60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 936A261509;
	Thu, 26 Aug 2021 22:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvFqBxCSoRvU; Thu, 26 Aug 2021 22:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE42A614F0;
	Thu, 26 Aug 2021 22:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ABF01BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A7940791
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIcmBcPm7PQh for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1194140798
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 66B078DAA6; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 23:25:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef37a144798dacd62743f189e462543d2013aa88
X-Git-Newrev: 878fbd5fbf9683be2bb021e857ce119f78e80f94
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.66B078DAA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Partial revert
 "configs/olimex_a20_olinuxino: switch to extlinux.conf"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=878fbd5fbf9683be2bb021e857ce119f78e80f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Old scripts are still used by a10_olinuxino & a20_olinuxino_micro

Fixes olimex_a20_olinuxino_micro
see https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738568

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olimex/a10_olinuxino/boot.cmd                         | 6 +-----
 board/olimex/a10_olinuxino/post-build.sh                    | 4 +---
 board/olimex/{a10_olinuxino => a20_olinuxino}/boot.cmd      | 0
 board/olimex/{a10_olinuxino => a20_olinuxino}/post-build.sh | 0
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
new file mode 120000
index 0000000000..612c745500
--- /dev/null
+++ b/board/olimex/a10_olinuxino/boot.cmd
@@ -0,0 +1 @@
+../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 100755
index d3f612f811..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
new file mode 120000
index 0000000000..b346896024
--- /dev/null
+++ b/board/olimex/a10_olinuxino/post-build.sh
@@ -0,0 +1 @@
+../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
similarity index 100%
copy from board/olimex/a10_olinuxino/boot.cmd
copy to board/olimex/a20_olinuxino/boot.cmd
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
similarity index 100%
copy from board/olimex/a10_olinuxino/post-build.sh
copy to board/olimex/a20_olinuxino/post-build.sh
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
