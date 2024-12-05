Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E676BE7716C
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 14:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D8A415A2;
	Thu,  5 Dec 2024 14:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXyjqgZXhuNP; Thu,  5 Dec 2024 14:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72423415BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72423415BA;
	Thu,  5 Dec 2024 14:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C7A7AE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FA62415D2
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWZaSdiJnaOD for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 14:37:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4672415B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4672415B2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4672415B2
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.30.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4QsY-1tl9hC293O-00tHum; Thu, 05
 Dec 2024 15:37:08 +0100
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  5 Dec 2024 15:36:48 +0100
Message-ID: <20241205143650.3262372-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205143650.3262372-1-fiona.klute@gmx.de>
References: <20241205143650.3262372-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+oMqc2FevdDtGqIujmpum3Lf4WhhuxbHWarLiRvStah2fmgw6uK
 Ti9rX8tu0pHH9x3TgptUeUG5aFtlDUfDBh73YeGSdRUSZo+xuFnZJonoGLXJ/CQ923L2lhC
 Jt5d+DyEI8nzC5Jgdzdhj9jgXoyYqmbuTlgaka32jah+8zlZRtXvTbVS380aHXxxCaLoZfv
 ZoFodxgAGvn42JqC5T03w==
UI-OutboundReport: notjunk:1;M01:P0:Np5slkzwA3U=;esCkwOPe4ajKqM3zPBiJAffmWCb
 0OIVgyVaehGz1iw4bXlnE4QPcG4lruhRnEHZ5ZwrF70S7x+1bfGLA4rOrJhG+bemnLMa2FivG
 1LiCFsRECrLhoVJdnxeIVB+WsWPhTd/OWhYJFZmtj0VY4E59drGfeEcUQuVIqJWjJfSJW55Wa
 KvKrb2C6sClhBT4t2RYw6+lcKQV9NZ2lcbIFG5fqOuN9wBF+SF9lGxvp4p6ZrPjIDnX8iOf6n
 mOk8YYAbKIYc2Jk6ZB8ym2hSIo1EPeeGIFoqh/8qM64zgB8RBxYBJsY3Q24kV+VP92wZmkG+v
 LW5meZ0qOYI/ZkwSsYmRRQVkpou79TPtgUv206PADmWBb9LmAKw4DUvSL29eRALnckSrtq7li
 PxK1kiFgTEQIP+mZZ1cNHlPFAyl8ROGVUywSNNVhlJTjadONTiGYNlauHrxnu2oPeM38lcHvM
 pAlLvws+b5/z9W68pfLh6CMLXKUMOlmLpbnhTbHMZOystEebupmu7TlaRBbsRCfPGaGC4JWWq
 N2YJBLcd4bNRSQc6v7KaB6gE/NUAN0N+3aD0MBbkdNGRgCCs3wzWHZP0YIb08ZHm9v7JY4QZc
 UJr82OMmjVLysgG8Hmd3GQNck0Kost7i5ik3cKAznH1MEWUhuDOQksoSm8e8zTzAJJF26jhaO
 lSaEhODyLKjcdHVoed1DGkIcql+aogRk9ZK/y+MQ5+QujHI5rTtPXKwLQjDpLomEACGvna43p
 OH1rNOVqxBNp0DyWPIvaj03r6W0aiJUj9aAbkNmLyZC01FFYXtxYqeJ09pP7Tbn0Wa1z83wVK
 65T5H3g9EJjngZ86d6c4lJqU/bX7pgJ+QyZQpjU25Egs7T452bsPrE12U5+SwJWi7pc2clNJp
 bWjiLO7zi8oPXJRvSKg4spO+qq1Sa+p9rFH6kYGHbTHuJCSWsPQPcN/UJ0oblYAZ2gVedJ5uM
 cKD1e4MgAwU0xURQ7s/yfip5DBKkxP7XlBmHFcKZ7/gZYa8pe5ZqDIW47Mh+cVuzKj80cCu1M
 GmgEJ6CUoo93nVEF5jZM3l5lCB6XixI+sSZpknarPhxpherqccbM8taWyIIkvP4aRT3H36od2
 kLNVxxbiWo5x2c6h1sGaFwsW02s7Ph
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733409428; x=1734014228; i=fiona.klute@gmx.de;
 bh=GU+3igM4oNFrKipAv3tDOeyzVqg2N/xXho6LI+K0qTw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rDa0b6nz15ogzpeUXPY9gkgFSJMObjcdjM9+N1L8oBZdjaqSDdqJSA5eVBYnvcD8
 fcrhdPFO9H0IQ2FtHeys2YcsLTpZ4QsEtvaTi9TRNxYLwbB46f9ftI+Hv0bwqL1ho
 ggZ6URb41tIDwOQhPmmhB4E2KtrRCkchDhaO7ccUtUPtV7PtzYVuc9mjXGYbs/p7y
 9up+vBwMEXvbR1KfQxiTy/DH7HG287K5i2jhEOFCWynb11KnB8Oj2sLeO4mPIz6PJ
 QJdjJdXYIXrlgeP/htZMZUbi7INtWcb4iGFsFYF+RTBIY7BgVSIbAtvzU73NyUbOO
 Y0VfJefzyuxM08ckYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rDa0b6nz
Subject: [Buildroot] [PATCH 2/4] package/bluez5_utils: fix dbusconfdir
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
is deprecated, they should go into datadir (/usr/share) instead
[1]. Follow that policy.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/bluez5_utils/bluez5_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1695aeb210..7725fb94bf 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,7 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
-	--with-dbusconfdir=/etc
+	--with-dbusconfdir=/usr/share
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-obex
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
