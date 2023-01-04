Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7548DC4708E
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 00:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D536981F05;
	Wed,  4 Jan 2023 00:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D536981F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IYbsBEEhPOu; Wed,  4 Jan 2023 00:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2189181F00;
	Wed,  4 Jan 2023 00:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2189181F00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F328C1BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3A060B5E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 00:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3A060B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e25Zow9u4cPd for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 00:21:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 250BF607E3
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 250BF607E3
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 00:21:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CrWtpAYj2eo8HCrWup7N9I; Wed, 04 Jan 2023 01:21:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 01:21:11 +0100
Message-Id: <20230104002113.1038775-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
References: <20230104002113.1038775-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAatUBph3vkZy8UUv1X1mx1FWTdn1pfYKe39KoN1Mv/62lhUe6guenYbpRDTo/6smltP1FEy4DgUsEwa2gLBWpZsGDRUEmbTQS0szol69J6enJJ3yS5G
 YkKTq3lFUo+DViaLND79G4su99eqlErRzYVz7YoNCnr66MmnvcZ29ecX5G23cxhfwkDSwcmwb3eOQtaDkxRN6rOoNsycA622+QKzYFf6nsHqUdX8+l9rfdEi
 bWmcxs4HUwHrdsgYLqoIr3DIiuZdxhnEnZL3f3fWXUHuPUGbpvttgBSl4GKqL4VEgvHMlbRg90YtRBmL06Vu7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672791676; bh=Z2GiAMY2CiwgUjIPYydA0btXARwUQxkqwLSGhvzMILo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ldzzdeu6KAXclYOBSDksaEL9n3gzwvqn69YWTqFPaeqnCL+0UTO9kROzxZ4/Xr83z
 O+u6e7iIEcRVrE6qleO8sXRJd1BneovW+x61UBCPwzVCpKGGJYIWty9oWH0/ROG4ss
 ke/AZhSqfbD2dFBJSPd/f2hqsytVCQ4I4TfyV7quKAaIW6DpMsSsOnSiLbV/Yv3Rxt
 wMGBl1oOukAf3Cse9qZ923xmBYb9QJAFznnvevxrCcL9Chcf4vGWYCVIds3sGaglVd
 Ss7a1PJNnmKc6SL3MqCg4Nq7kZtQpZxBNyUU2wPLACAKnDrh39l0LN+/mmzJyIrXhy
 GMOwPPoTs07BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ldzzdeu6
Subject: [Buildroot] [PATCH 2/4] board/asus/tinker: rename label linux-next
 to linux in extlinux.conf
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're not using next branch so let's rename label linux-next to linux.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/asus/tinker/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/asus/tinker/extlinux.conf b/board/asus/tinker/extlinux.conf
index 136af0debd..bb96ddb893 100644
--- a/board/asus/tinker/extlinux.conf
+++ b/board/asus/tinker/extlinux.conf
@@ -1,4 +1,4 @@
-label Tinker linux-next
+label Tinker linux
   kernel /boot/uImage
   devicetree /boot/rk3288-tinker.dtb
   append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
