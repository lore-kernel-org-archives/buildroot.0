Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCB3C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D150A812C8;
	Mon, 27 Nov 2023 18:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D150A812C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KuvJJ-o9sbb; Mon, 27 Nov 2023 18:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C82814B3;
	Mon, 27 Nov 2023 18:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C82814B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3531BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E804D4058E
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E804D4058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngPyKue5HZp3 for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60BC640568
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BC640568
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A9BF874EB; Mon, 27 Nov 2023 18:51:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 19:50:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5be42d8da3370e74b32190b97c4399749b4fa761
X-Git-Newrev: fbf0a6ea427c7c1c837f79c74d591ec35eab3ba6
X-Patchwork-Hint: ignore
Message-Id: <20231127185149.4A9BF874EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi/config_4_64bit.txt:
 remove testing dtoverlay entries (vc4-kms-v3d-pi4, imx219)
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbf0a6ea427c7c1c837f79c74d591ec35eab3ba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove private/testing dtoverlay entries (vc4-kms-v3d-pi4, imx219 and
commented out ov5647) wrongly introduced by commit 689b9ac439
("package/rpi-firmware: rework boot/config file handling") [1].

[1] https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/config_4_64bit.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
index 2a9814274f..a4ae327d2a 100644
--- a/board/raspberrypi/config_4_64bit.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -28,9 +28,5 @@ dtoverlay=miniuart-bt
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
 dtparam=krnbt=on
 
-dtoverlay=vc4-kms-v3d-pi4
-dtoverlay=imx219
-#dtoverlay=ov5647
-
 # enable 64bits support
 arm_64bit=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
