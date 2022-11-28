Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916BCC433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 14:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A24060AEB;
	Mon, 28 Nov 2022 14:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A24060AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMrmUxciymo1; Mon, 28 Nov 2022 14:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 872C360597;
	Mon, 28 Nov 2022 14:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 872C360597
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 811D21BF33D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68D854032D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 14:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D854032D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AQcgFLEc4NP for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 14:23:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2E740320
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F2E740320
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 14:23:49 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zf2yoVkNbb7Ijzf2yo4hGU; Mon, 28 Nov 2022 15:23:48 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 15:23:47 +0100
Message-Id: <20221128142347.536380-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfM9hBta0H/QTSFtRoljpC+oxjuz+zpfT7JJZymdkP0JpPoQHMx97WDUhfIGIKRFk1mWgeGeIs114NlsB7R23i6hawDswK/w0AQcVQMX1iJcfHD6jWYmv
 VKU1WU/rXT/TKViijoBfSMZPtZ6nJVRXYHdjw2cX5zES7W40SH/TsuMkxqqIadfks44SO6Jsy7KWNss74AnWhM1eEaZGWFFqDokCC7CweX35ZKHZiawQhzGk
 2UBDpk2pfwLE/HZ8D2Brj0Jq+6z4Zb2Cok/6AjUb9OSm9cMnyLV9WEtl9yqAZAY2ohALnLkSZXuj94s9AEzl+Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669645428; bh=WFSquL1GlH6uYEGRCJZIxwJMxPSPrgVuwhdYwEOH1vQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=P20qotah4QqWgl8aaaLjJ88B2RpC8y7ZrRXReM/4JwUYbaPT5NnGUrW7Oi9XRZuve
 cebjf64ZZWDpsfJbm/hYUP62A54SndLEA0zyY6es7shPEeCFiGqmy+w2hkBtMmlUus
 oiInkl6ldY1Wnv3m2UXChxP9QbEeZceXtyCCJ5Jir41QxqWwnavTpaq1AnnaMYVBlK
 ocArM4TNRS5rOh5GlymzLwOfGs+ND5UaQ+Zd/7CMEYH4UmKNoU/Bp+UmAFXz2aL9rQ
 6f3OlLBel0eHHWQndqeQwNT9n8E3Zk4IEzDzBCWFqH7eb9i0THr6doEZ6/UJ5ol5Sp
 MBWsaORPeidzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=P20qotah
Subject: [Buildroot] [PATCH] board/freescale/imx6ul(l)evk: fix repeatition
 of "to" string
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
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/freescale/imx6ulevk/readme.txt  | 2 +-
 board/freescale/imx6ullevk/readme.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 90355f354f..5bc03771f2 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -12,7 +12,7 @@ Build
 
 First, configure Buildroot for your i.MX6UL EVK board:
 
-In order to to do so there are two supported options:
+In order to do so there are two supported options:
 
   make freescale_imx6ulevk_defconfig
 
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
index 77acec2615..dc7c5f3678 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -9,7 +9,7 @@ Build
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
-In order to to do so there are two supported options:
+In order to do so there are two supported options:
 
   make freescale_imx6ullevk_defconfig
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
