Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A82DC77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 13:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4EA182253;
	Mon, 29 May 2023 13:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4EA182253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nee1Z45vkAw; Mon, 29 May 2023 13:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49E083A94;
	Mon, 29 May 2023 13:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49E083A94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1002C1BF404
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD93760A8C
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 13:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD93760A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWMOPMnckdlh for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 13:44:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2840E6080A
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2840E6080A
 for <buildroot@buildroot.org>; Mon, 29 May 2023 13:44:05 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 328915FD0A;
 Mon, 29 May 2023 16:44:03 +0300 (MSK)
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru
 [172.16.1.5]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Mon, 29 May 2023 16:44:03 +0300 (MSK)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] package/earlyoom: unhardcode package version in
 CFLAGS
Thread-Index: AQHZkjOgonNUKoY3oU6aYt2ZUbAHFA==
Date: Mon, 29 May 2023 13:44:02 +0000
Message-ID: <20230529134320.1961326-3-SIBobrenok@sberdevices.ru>
References: <20230529134320.1961326-1-SIBobrenok@sberdevices.ru>
In-Reply-To: <20230529134320.1961326-1-SIBobrenok@sberdevices.ru>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.25]
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/29 07:59:00 #21367693
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1685367843;
 bh=Lx+ZPsfX2SFs4A+dLOkxXgGDY+QrYCH3LaN/uNxiGbE=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
 b=WKZZSdiA0q73p0NOz83V1fwk9atWnOlW4d6ve9frw9+BABXUORXN1l+HpqofC9Vbp
 IOLrvi1a4sjpQu92aRyiWFLcijrvdYyX1Hwiapuax6eMHUJYvO9HmqQXR6h9XU2hnA
 dt1B4Ovi3FZNWgo2F+Y93R6ICg19PRMxDQ27ct4Yxg3SIEJxFQYSPhb3X7bt79qS2V
 PlwHMrEFX7ASc+fuzn6xQ/PkU65Wl1inLJHa78TOmHqmXy4HhMYY3ET6Nf8QavY/gD
 rwoAUKEXPQAM70alV1BzQ8cSI8P6b2s8Y1CjDA0M3brz0ljci7fjHHMXsMfCbA3O7l
 19kRTA0qrHLLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=WKZZSdiA
Subject: [Buildroot] [PATCH 3/3] package/earlyoom: unhardcode package
 version in CFLAGS
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
From: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Bobrenok <sibobrenok@sberdevices.ru>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Sergey Bobrenok <sibobrenok@sberdevices.ru>,
 sdfw_system_team <sdfw_system_team@sberdevices.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

'earlyoom --help' still says 'earlyoom 1.6' though it's already
version 1.7. '-DVERSION' flag value should be either unhardcoded,
either updated with each package version bump.

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
---
 package/earlyoom/earlyoom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index c7042a054e..808b9c49fa 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -11,7 +11,7 @@ EARLYOOM_LICENSE_FILES = LICENSE
 
 EARLYOOM_BUILD_TARGETS = earlyoom.service earlyoom
 EARLYOOM_INSTALL_TARGETS = install-default install-bin
-EARLYOOM_CFLAGS = '$(TARGET_CFLAGS) -std=gnu99 -DVERSION=\"1.6\"'
+EARLYOOM_CFLAGS = '$(TARGET_CFLAGS) -std=gnu99 -DVERSION=\"$(EARLYOOM_VERSION)\"'
 
 EARLYOOM_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
