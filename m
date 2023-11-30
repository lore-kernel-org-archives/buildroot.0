Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468EDC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE04F43675;
	Thu, 30 Nov 2023 23:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE04F43675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULAqLIj6J062; Thu, 30 Nov 2023 23:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C40E34366F;
	Thu, 30 Nov 2023 23:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40E34366F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 881AC1BF2A1
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 616A9418AF
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616A9418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YqwT0j7twOK for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9475B41748
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9475B41748
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FD9C876AF; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:36:15 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ec866af755162efec821a61b156dc562a326804f
X-Git-Newrev: b68a8806df88a5918476f259a2f0077e99115564
X-Patchwork-Hint: ignore
Message-Id: <20231130230901.7FD9C876AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=b68a8806df88a5918476f259a2f0077e99115564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
