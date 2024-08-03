Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CECC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 09:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CE580E2F;
	Sat,  3 Aug 2024 09:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdeOQag20pr7; Sat,  3 Aug 2024 09:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2144280E5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2144280E5F;
	Sat,  3 Aug 2024 09:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60AB51BF3DA
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E34040198
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LXtrb4_Wh6O for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 09:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 369B740177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 369B740177
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 369B740177
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 09:20:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A39DDB00535;
 Sat,  3 Aug 2024 11:20:14 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 11:20:05 +0200
Message-ID: <20240803092005.9363-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722676816;
 bh=mbjzgizmgSzY/qnNEp3mhWPLb9s8Sn4ZLXqzcTpEgVM=;
 h=From:To:Cc:Subject:Date:From;
 b=Yi9SFx1MQ77+Y4UpQ1yK0narohFkJrhdK6lQDoa6Cai4S+x0Pooop/SoqlU9tVeN3
 F4ImVWQix3i6W48S3R5P18FRNh0cSxl5t+TUWVVrzpUH7HDhel5rH+3dOqvE3X4JZe
 eaaP6/6YsXkn1zMvVgyO694xw/zARQwFvehwMLk7g7Ht6ZCGcw7Pb9u9r8Y++7jO/2
 Pvy2rTse1ZALzuM1sc2zehg0DLePJoul+ZC/ZgM2iIei+Y29zLxkQ/muOJ85h0OFHt
 3Yp1GV5pnbvOYun3rE+TVMMFcS6MYzWm8e0CCAm1ADdR4/PUBxAFEpaTblSU9pen1W
 pLHyjKwvrlhVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Yi9SFx1M
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Maeva Manuel
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maeva told me personally she will no longer contribute to Buildroot
for the time being. This commit removes all the associated DEVELOPERS
entries.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d26885a1b..6c1fc7fc8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2136,11 +2136,6 @@ N:	Ludwig Kormann <ludwig.kormann@ict42.de>
 F:	board/in-circuit/
 F:	configs/icnova*
 
-N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
-F:	board/freescale/imx8qmmek/
-F:	configs/freescale_imx8qmmek_defconfig
-F:	package/freescale-imx/imx-seco/
-
 N:	Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
 F:	package/ffmpeg/
 F:	package/mpv/
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
