Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEBAC7EE29
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 961AD82244;
	Mon, 29 May 2023 13:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 961AD82244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkt3yOxvST9a; Mon, 29 May 2023 13:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6EFC82233;
	Mon, 29 May 2023 13:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EFC82233
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE3CC1BF404
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4FF34182C
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 13:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FF34182C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9saFHzl_7WIg for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 13:44:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3C34182B
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A3C34182B
 for <buildroot@buildroot.org>; Mon, 29 May 2023 13:44:00 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 277025FD0A;
 Mon, 29 May 2023 16:43:58 +0300 (MSK)
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru
 [172.16.1.5]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Mon, 29 May 2023 16:43:56 +0300 (MSK)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/3] package/earlyoom: fix daemon executable path in the
 init script
Thread-Index: AQHZkjOdUcDPaSQpYEmH6SNNf0GRxw==
Date: Mon, 29 May 2023 13:43:56 +0000
Message-ID: <20230529134320.1961326-1-SIBobrenok@sberdevices.ru>
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
 d=sberdevices.ru; s=mail; t=1685367838;
 bh=qoQQaUdOmjXc5Si/GDeIxkOqD6R6QrlLTOBQJYN64xc=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
 b=TgbFwFgjfKPC6y8+Nv4lYXD4Ekq5jmGNJASJt1JvTeMKRwzrMIjMUKq2RknAAKXsx
 +hFEKI9xXhmpxE1ME7wFFFJD0gVWUnrwSZLAuxXZTudrgoOjgzIDShvsq6YiB2Ggmp
 /fswUjrIAGJ9rDdVOjMYt9vt2L3CgzqCpJF0rxg3bSobb1kS6IZGlX2OgFHWDgWDAQ
 hI8CRpZ3Znvjhj80Av5Uh91GbrsonJVwnFuxUyw/UmItbm4XMksyUkz3hm20TKNqhQ
 xD8FxRtCKUvw2sBV4xUJHXr87EtT/fUzfS7SE/3s9aTnx6ArsI6gqkAs/iHCks5GvU
 H4ufYPVChhkWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=TgbFwFgj
Subject: [Buildroot] [PATCH 1/3] package/earlyoom: fix daemon executable
 path in the init script
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

earlyoom.mk file explicitly sets 'PREFIX=/usr', and the init script
fails to start earlyoom because of a nonexistent executable path:

  # /etc/init.d/S02earlyoom start
  start-stop-daemon: unable to stat /bin/earlyoom (No such file or directory)
  FAIL

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
---
 package/earlyoom/S02earlyoom | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/earlyoom/S02earlyoom b/package/earlyoom/S02earlyoom
index c02495af90..35624f3c72 100644
--- a/package/earlyoom/S02earlyoom
+++ b/package/earlyoom/S02earlyoom
@@ -9,7 +9,7 @@ EARLYOOM_ARGS=""
 
 start() {
 	printf() 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/bin/$DAEMON" \
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
 	       -- $EARLYOOM_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then

base-commit: c765ac9c02dbddd53cf6813cf59c8f265b043caf
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
