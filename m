Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B7C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E35F43675;
	Thu, 30 Nov 2023 23:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E35F43675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtg2ysIyxbTP; Thu, 30 Nov 2023 23:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9034366F;
	Thu, 30 Nov 2023 23:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9034366F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31F4D1BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3E541F96
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3E541F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6s2Kx3gxHlam for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E63F41E56
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E63F41E56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E10768766A; Thu, 30 Nov 2023 23:04:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:36:19 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: eb03f05a4499ca79306154850c7927b613f7e569
X-Git-Newrev: 672fdd3d014a136d6b71a806114949a62962ebe7
X-Patchwork-Hint: ignore
Message-Id: <20231130230400.E10768766A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 board/raspberrypi/config_4_64bit.txt: remove testing dtoverlay entries
 (vc4-kms-v3d-pi4, imx219)
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

commit: https://git.buildroot.net/buildroot/commit/?id=672fdd3d014a136d6b71a806114949a62962ebe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Remove private/testing dtoverlay entries (vc4-kms-v3d-pi4, imx219 and
commented out ov5647) wrongly introduced by commit 689b9ac439
("package/rpi-firmware: rework boot/config file handling") [1].

[1] https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fbf0a6ea427c7c1c837f79c74d591ec35eab3ba6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
