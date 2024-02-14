Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF113C48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 23:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3780830FB;
	Wed, 14 Feb 2024 23:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLhz63zZam5d; Wed, 14 Feb 2024 23:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C83282311
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C83282311;
	Wed, 14 Feb 2024 23:30:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA2D81BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975C241877
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 23:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B88aYNNBv9HJ for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 23:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA728417C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA728417C7
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA728417C7
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 23:30:39 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 6FBB7240DC8;
 Thu, 15 Feb 2024 00:30:37 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 50A9980209;
 Thu, 15 Feb 2024 00:30:37 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B831D240A48;
 Thu, 15 Feb 2024 00:30:36 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 00:30:26 +0100
Message-Id: <20240214233028.1226645-2-kilian.zinnecker@mail.de>
In-Reply-To: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
References: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
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
X-purgate-ID: 154282::1707953437-BD52E878-520C39F0/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707953437;
 bh=AHhOThvESE5qd6vCSSLiWLIjwidiaLrot1IX8dS3Q74=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=onGL6kZxHLMf7kVJYl1fsSo1Fx72qXcw4kJ3hZh9tXasjouglUFsLhVkVxoT7cuGD
 t9nc23r6Q3iKlzj4S2aAxUAoNyX+vM5IN6HGsaK8tJ48QNdeIwOoSo0MmmxGsZ1LgL
 ojKgt0kW/hUQghiQDYWjvPYmAdD4Yp1ZRdO9yALxorR/Ej8X0wvd9hxWlYkkzByZnI
 hyMpqDzSRAgxPohZ1vlBZxc0ZTk/bc9E0AA69G8gXxi9UCAhRMUerWr/TmuPL/ufoh
 HiK++Ic+rHM8zkYY2yvpVF1I254cX8OnJnM4bzQJZHkjeXenjpGorWsl7ZWMYznjUe
 6Z/XzPhez9MzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=onGL6kZx
Subject: [Buildroot] [PATCH v4 1/3] Fix alphabetical order of DEVELOPERS
 file entry
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..b75a92739a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1896,8 +1896,8 @@ F:	package/libcamera/
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
