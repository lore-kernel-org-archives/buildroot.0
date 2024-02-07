Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20256C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 575E360FC2;
	Wed,  7 Feb 2024 07:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZxTa3oJ03PE; Wed,  7 Feb 2024 07:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1474361385
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1474361385;
	Wed,  7 Feb 2024 07:08:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB3BE1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E46144031F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSyoF5kkQTER for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00C9E40144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C9E40144
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00C9E40144
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:08:19 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 28B7C241115;
 Wed,  7 Feb 2024 08:08:17 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 0AA5180428;
 Wed,  7 Feb 2024 08:08:17 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B08BD240CA2;
 Wed,  7 Feb 2024 08:08:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 08:08:06 +0100
Message-Id: <20240207070806.7331-2-kilian.zinnecker@mail.de>
In-Reply-To: <20240207070806.7331-1-kilian.zinnecker@mail.de>
References: <20240207070806.7331-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 639
X-purgate-ID: 154282::1707289696-FCDBC670-B8194BEC/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707289697;
 bh=ro7Y9JRC6CNnCsDAC+5GMGcVpSs+NwUWGQNLdajl6HU=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=CWOpLvx8TzdaWzZ6vY2xiavEK5ShCBwDkFofrFCdc7XRE8T+leBPTfuX4qoSNVDMq
 2MrYNsa87rQ3re22xaP5gTyh/r/SvC/x9sKhQQxigM0eeDebMZLRuvF3/GHkmO+uFG
 aHk9QGvwvWUpMiacGMTcnQBao/B30vhT562OIf3WGINyXCODm3pmUHxA4+tJCu9vk6
 zaAWjnY1UAHn0CCWhDRK2VS4EVuhy6AtGhKkgyyNqiMd9L/Ueu87f7SDSjzz7THynm
 NP3J6ZEN04gEWcghTOeCyFKTLMPSoaadtRM5/0hASpE6mZG7PYjYz098DnfLj2wkMH
 q/FAVTsghvuNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=CWOpLvx8
Subject: [Buildroot] [PATCH 1/1] Fix alphabetical order of DEVELOPERS file
 entry
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
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc47c51d33..dd29f395d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1887,9 +1887,9 @@ N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
-F:	package/rockchip-rkbin/
-F:	configs/rock5b_defconfig
 F:	board/radxa/rock5b/
+F:	configs/rock5b_defconfig
+F:	package/rockchip-rkbin/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
