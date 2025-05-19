Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7F3C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA0781247;
	Mon, 19 May 2025 12:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCpUavT6tiBp; Mon, 19 May 2025 12:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5901C81092
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5901C81092;
	Mon, 19 May 2025 12:19:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45F4E193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65DFB60EEF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKFOf0xKw322 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51EA360F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EA360F5C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51EA360F5C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:18:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.126.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1uBD5Y0ysv-00HKTr; Mon, 19
 May 2025 14:18:49 +0200
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 14:18:37 +0200
Message-ID: <20250519121837.1317128-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hn0Sn2RD37gp600YxsjeVe36QYUBPSjXy/F060wa0XpeWd40B0t
 U7nAw9WHZPblc6Mc/BEVHNEm8FoDthewlbkAQXaxeDDOxFqlPIj3nuzBhhMgnlsSN+BiD7p
 yf8CTG+mcTfoOnBUDNoEyiL7yxPrmBEypX9On9O7o2bSUOG6uuQvw8aj8yUkMmdLZeRg4Uy
 q1WhdcJwSqEZ/t+gMdxkg==
UI-OutboundReport: notjunk:1;M01:P0:+B7BDcmYIos=;GI4Tz1w3YJX2986T5yKYwcluxTP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747657129; x=1748261929; i=fiona.klute@gmx.de;
 bh=tXT923owvcn+XX65JvdTYAanJZXuGP4ixAc3mlyS48c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LDY3PBREFoVrgbKTwBYVeIsgwzcZh7K7x7tu5VGC8yydW4rA7CFjxp+xROynIMJu
 LJ+8YipeDSjWhTGIHxZVn9xlBbUic/zFb/fpeIYThdZgvrGThTDde9euC21C0Ggd5
 Jut610Qg8ASXTW835yrkEHXYvNImw5aC4nL++cRHazZ6VH1q8Jj8ogTQbSV6MCDUk
 mAgdEDjOAR45MfdHSVlFG1EZESA1ldTsdJ5D+6Z6R35zn31EPtr9vZku7FX/R+bAz
 TN4NDH0r96cs9EZPGrJHaR9JFrC9euM5tycaMZjOS/WlJEc4u+ocfRIfKoViDt/3+
 8lgd9Cn88wAEs+d4Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LDY3PBRE
Subject: [Buildroot] [PATCH 1/1] Revert "package/python-referencing: select
 package/python-typing-extensions"
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This reverts commit 0586ee6cba7411b2d1f6635cdfe36ab8fac791d7.

The dependency is not needed any more with package/python3 providing
3.13 (since commit d63e207eb869063f82c867658676c2903beb08cb).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-referencing/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-referencing/Config.in b/package/python-referencing/Config.in
index 3a8dc49b2a..273c42543e 100644
--- a/package/python-referencing/Config.in
+++ b/package/python-referencing/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PYTHON_REFERENCING
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime, with Python < 3.13
 	help
 	  JSON Referencing + Python.
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
