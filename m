Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434FAE77184
	for <buildroot@archiver.kernel.org>; Sat, 21 Dec 2024 14:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05432846F1;
	Sat, 21 Dec 2024 14:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-L0cEIcJjSH; Sat, 21 Dec 2024 14:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F32B846D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F32B846D0;
	Sat, 21 Dec 2024 14:14:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E63757
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 14:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E57A80BA8
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 14:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKVDOjCrp7WD for <buildroot@buildroot.org>;
 Sat, 21 Dec 2024 14:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF209846D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF209846D0
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF209846D0
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 14:14:20 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 1E6DF240D42;
 Sat, 21 Dec 2024 15:05:56 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id F12FE26016F;
 Sat, 21 Dec 2024 15:05:55 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 18387240A70;
 Sat, 21 Dec 2024 15:05:54 +0100 (CET)
To: buildroot@buildroot.org
Cc: quentin.schulz@cherry.de, niklas.cassel@wdc.com,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Sat, 21 Dec 2024 15:05:02 +0100
Message-ID: <20241221140503.9861-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 607
X-purgate-ID: 154282::1734789955-857722C4-FE4423F8/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1734789956;
 bh=SXPaDFLnIgmKs0NBTlmctPs9rWWi9e0J7grTfOwReFU=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=GTXp2CJ5Abbon0My0o9I47PtI+cYFGdYFrHvuIR6SzeQyWI8MIk9hChz0eQTN2HYc
 /WX6xWnQfCqGa0KtpPm2V6uJJX+xGG4n6Oyh6JT17YeXyyoGmWtdp0dkfwTC5Kw6Iv
 nYaexbYQVmBqKTrvF3alNtxr0J05dkvos7sews1L+6HUINwcCYqqNvIHAyj/bOnXVt
 DO0D2ll64uZQvjtYJv8KgJeHEe2wqFq3d/NNqo+pL81ITOQfvbV6yoKYcbFvrR7/cL
 hPO0+bxaXdg1oAQk/xKCRS7kcfpSazER7ZE2VKngZN3OwepgsEvHIIWLeceAUgN4Wg
 Fw+jmH6u447EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=GTXp2CJ5
Subject: [Buildroot] [PATCH v2 0/1] configs/rock5b: Switch to mainline
 TrustedFirmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kilian Zinnecker <kilian.zinnecker@mail.de>

Hello all,

v2.12 of the TrustedFirmware-A was released and also recently added to
buildroot. This patch changes the bl31 of the Rock5b to the official
v2.12, which features support for the RK3588 (i.e., the board's SoC).

v1 -> v2:

The patch now does not switch to a specific commit of the ATF, but to
an official release, which contains the SoC support.

Kilian Zinnecker (1):
  configs/rock5b: Switch to mainline TrustedFirmware

 configs/rock5b_defconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
