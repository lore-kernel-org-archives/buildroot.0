Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD67CC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 14:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527E660727;
	Sun,  9 Jun 2024 14:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83SmpF0KTMBG; Sun,  9 Jun 2024 14:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C80360645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C80360645;
	Sun,  9 Jun 2024 14:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 146021BF3ED
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 14:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 000FA404F7
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 14:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2xl9AgC5wUX for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 14:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 843CC404CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843CC404CC
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 843CC404CC
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 14:09:55 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 7B1BC240C84
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 16:09:53 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 60434A00E2;
 Sun,  9 Jun 2024 16:09:53 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 202EB2415E5;
 Sun,  9 Jun 2024 16:09:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 16:09:41 +0200
Message-Id: <20240609140941.32819-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 595
X-purgate-ID: 154282::1717942193-FF52A878-5B45EC83/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1717942193;
 bh=XG1zpWLKC8XIkOPluRnsFBSXK+0MlyGBtcyDQCb/q+Q=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=TEw7vV5xU5+tfiSjYL/zxXpk4q1a7pQ7cJsFacYAdnyOsxvgAFdsgqBeTxJVtvkuM
 hsSb2I3+vULJxy8uDagUtsnk2qxN36D1I6b4R1VliKACOinG9G+uNzuCMuDWpgHcDY
 HKjUCgcYj/EjSSykAxm1HPdqc9uEFfb3zKOB8igcLu9tIjxvB0XCF20kL0UjjRUKpN
 LxNgjGneb1NXu2NZC2SPM2Wl7vqd61/noq/WamrihaSwFSGAN2Lx5Qxej22sYzyu0W
 Yff7HSnvwfvSovPEuGaJ+5OaFo0fe6L5f0eFT28abOZtcIkmJ+xHaxawL9Aowt6K6B
 6WlNMOOe86zaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=TEw7vV5x
Subject: [Buildroot] [PATCH] DEVERLOPERS: Fix alphabetical order
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 03aa7bfa74..805b8215ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1950,8 +1950,8 @@ F:	package/libcamera/
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
 F:	board/avnet/rzboard_v2l/
 F:	board/radxa/rock5b/
-F:	configs/rock5b_defconfig
 F:	configs/avnet_rzboard_v2l_defconfig
+F:	configs/rock5b_defconfig
 F:	package/rockchip-rkbin/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
