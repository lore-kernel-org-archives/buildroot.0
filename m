Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4824CC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 22:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7966560670;
	Mon, 22 Aug 2022 22:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7966560670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cViOREem4WVu; Mon, 22 Aug 2022 22:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33FA2605DB;
	Mon, 22 Aug 2022 22:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FA2605DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 530101BF3EC
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 22:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3534D400EA
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 22:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3534D400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvsOWZyXrbeF for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 22:07:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F51F400A8
Received: from smtpcmd13158.aruba.it (smtpcmd13158.aruba.it [62.149.156.158])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F51F400A8
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 22:07:05 +0000 (UTC)
Received: from localhost.localdomain ([86.32.48.35])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QFZWoDP1QeEtAQFZWoILdx; Tue, 23 Aug 2022 00:07:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 00:06:54 +0200
Message-Id: <20220822220654.171970-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJg6QNATM8fIi/4LxOeC3X59/wG3LQm6SlWHhAmztVtuPm/8g9Gd7V/3GhQu+2xHlp89Z1mzjnO5SzKsUGa921Tmgvoz4PONwoQzlX6rMcL65yjC0alT
 Yp2GBow5YivFQaep9HtSglKr3+bRLhBq4n5kyAW68vikdTHCsChsp31QTCUotU16vNGxYDlViVeBhYwC8Xr9VPacBQr27iubXEUxds8yPWAHBFFrsTYnR+VU
 ORtQ/VUVXH4xS2OiPOh8AVQRTsKkXAkGL7LrlLfpkSw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1661206023; bh=yMVpzffZctDxwbQZHJhh7kou3zracB6XX5jIWThBjB4=;
 h=From:To:Subject:Date:MIME-Version;
 b=dEoQsEavoZmzarDWjxHVjWxV8Db4yvkGWOvPPGkTctUco2OdfMMf2FIfaqfub6hQX
 sxHIGr2KCHYK/8z9Lu+rQmGg86S+VMtXyvBSIHUTgFTJT+7y4xbqxUbBjzpnAl71wh
 igApFTaRDwHB/5ObpshOyPgrAq2qxoU2Q2qFBM79J75FwwflJLEBC6KtbQfScMDcGI
 dcXBJZ7JtPFstoh2+/OPjXJ6WZ/BI9la8+aKIFFbzTAnzFuROW4U92NrdedhoNwTzL
 7UmY5z7LK8LMI8yM82Higoji126m9cfPBBaZR5Mg1jCMN0FwwHDAcNUxb/R4+zTg9u
 avo/quCpBfv7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dEoQsEav
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: update
 Config.in link to the new project URL
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sunxi-mali-utgard-driver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-utgard-driver/Config.in b/package/sunxi-mali-utgard-driver/Config.in
index 244283f44d..ba4d1919ce 100644
--- a/package/sunxi-mali-utgard-driver/Config.in
+++ b/package/sunxi-mali-utgard-driver/Config.in
@@ -36,4 +36,4 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
 	    since the driver requires at least double buffering and
 	    fails to work with the default value(100).
 
-	  https://github.com/mripard/sunxi-mali/blob/master/README.md
+	  https://github.com/giuliobenetti/sunxi-mali/blob/master/README.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
