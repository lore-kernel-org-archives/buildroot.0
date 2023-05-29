Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95712C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 13:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417F883A7A;
	Mon, 29 May 2023 13:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417F883A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOyt7v-cBy1b; Mon, 29 May 2023 13:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7558B822C3;
	Mon, 29 May 2023 13:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7558B822C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6E5A1BF404
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 13:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD2860A8C
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 13:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD2860A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSZx8VGR1M24 for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 13:44:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF7A26080A
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF7A26080A
 for <buildroot@buildroot.org>; Mon, 29 May 2023 13:44:03 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id E0DD35FD10;
 Mon, 29 May 2023 16:44:00 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Mon, 29 May 2023 16:44:00 +0300 (MSK)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/3] package/earlyoom: restore missing startup message in
 the init script
Thread-Index: AQHZkjOfTGQtHg8xgUKZS6GWHC5KHg==
Date: Mon, 29 May 2023 13:44:00 +0000
Message-ID: <20230529134320.1961326-2-SIBobrenok@sberdevices.ru>
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
 d=sberdevices.ru; s=mail; t=1685367840;
 bh=L6mfsdOwPJoHtY6p1tjJyhRVxR322VBdb+mjcJ73WEM=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
 b=s1gONBtvQxhW+MjfjRKnSzQQ4p6PNsBma088GAJ+MZF/2k8qQq6mQFNo8XXiRWhOi
 AEV2OEuX6kxQBnkufg8GpTiqNkt4F4c3cVx+QZnQMrj4Rm4k3pXf6sEBfEjh4Y6JVk
 jZBpwJdyCfkNn41iGuM/zDPmX6XeDCYdMNU0b8FA60J93B5Kmj74OApfMRcUepCZKj
 BHdHUF8J2oUWHml5Pk1RU249eF/sVBqHLrFH9qND6OR9ufIF15YbVAevgUneAN+sKK
 mU99/s9RCn328LLt0d24nHzSgxoNJ7ggV4+muB0mYEEdw0FA1zxxqjJ9UXUhepm5KH
 klmwIXRSZWoyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=s1gONBtv
Subject: [Buildroot] [PATCH 2/3] package/earlyoom: restore missing startup
 message in the init script
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

'/etc/init.d/S02earlyoom start' simply prints 'OK' instead of
'Starting earlyoom: OK' because of a typo in the printf function call.

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
---
 package/earlyoom/S02earlyoom | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/earlyoom/S02earlyoom b/package/earlyoom/S02earlyoom
index 35624f3c72..ac1734109e 100644
--- a/package/earlyoom/S02earlyoom
+++ b/package/earlyoom/S02earlyoom
@@ -8,7 +8,7 @@ EARLYOOM_ARGS=""
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
-	printf() 'Starting %s: ' "$DAEMON"
+	printf 'Starting %s: ' "$DAEMON"
 	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
 	       -- $EARLYOOM_ARGS
 	status=$?
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
