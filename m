Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47E7C433FE
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14952402F7;
	Tue, 29 Nov 2022 21:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14952402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FC5BtxTrN3zz; Tue, 29 Nov 2022 21:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59A1940BA6;
	Tue, 29 Nov 2022 21:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A1940BA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFA751BF855
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A53C60BE5
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A53C60BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FX8P8XVUVlh7 for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 21:08:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D8B60674
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25D8B60674
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 21:08:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 07php9pOq9JRB07phpVkmM; Tue, 29 Nov 2022 22:08:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 22:07:59 +0100
Message-Id: <20221129210800.802451-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfE2f9rDMQV4pP5cwjgdac4PRXP+NoPbbu5zNCwrdZ/U7nwfQJKZZaQmQyUp0hUQKmfuV+YsqktOrK2PREuQhtDo2RyGXiikG5st0jB64im9nKb1CuRAR
 Oq/xnUUdEaAmhUdyddzgYrRi3kaU9Uzu6MLahK+RDm5bkxwVKtNb1qoYaDW90Yx5Ryk1aQDXyFi5tNtr/9x2fp8sWf88bh0FYEPwmYGzG8L4iory6Bo9lY8F
 +gNrHvwFD0IbqZ90vNlW5Mj0q8gcjJCORxfLpjrLxqz1yJoOyOEznjs31kkVsuRlgTi0kI1v9QAQkg8A4r/HhQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669756082; bh=tuyzORgKjT4+jL91DlEzUxjSIlNhjRNCCT7FoP3vnIw=;
 h=From:To:Subject:Date:MIME-Version;
 b=GuCMm9Tu2J3IWjozN+2MtSbh36m5tGxkXnyuDO1InhSkus+V+Yn1tAPI9pkUpWqyL
 vVxgLubjjmHOV0IOptgkN6oCAzexCNeH3m2sxLYR774H+L3/l0JfTvFNVgwFNickzQ
 iQ7wIZhRxvV3LW5R1Xs6v1AdKhUaJ1YPY2afQahQzTw1SyUFyBMPomXyzfNL9WEr1X
 dbm9tLWHyMcRSRzzfBsObXCyvHZvwp1qLPbKqSURw+2L3C+LeUg5xkMckl2X3j8/Yi
 h70uBS6I75RLagjf5PKPCTE1mH8elJ4LXLk7gemHC3Xe/jpfQfUp+GziphBOUGnF07
 NSA2gWDQOlFRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=GuCMm9Tu
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: add Giulio Benetti to rtl8192eu
 package
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c8a052dcec..eecb4bab82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1153,6 +1153,7 @@ F:	package/qt5/
 F:	package/rockchip-mali/
 F:	package/rtl8188eu/
 F:	package/rtl8189es/
+F:	package/rtl8192eu/
 F:	package/rtl8723bu/
 F:	package/rtl8723ds/
 F:	package/rtl8812au-aircrack-ng/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
