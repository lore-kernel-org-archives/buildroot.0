Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6073AECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 01:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB5A7405DC;
	Mon,  5 Sep 2022 01:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5A7405DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nj9nkZB9bvtv; Mon,  5 Sep 2022 01:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D285402D7;
	Mon,  5 Sep 2022 01:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D285402D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 856C61BF2A9
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 01:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 603F360B9A
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 01:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603F360B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fvaJH_bJZvV for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 01:23:21 +0000 (UTC)
X-Greylist: delayed 00:13:22 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B2C6605D6
Received: from mail.sberdevices.ru (mail.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B2C6605D6
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 01:23:20 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mail.sberdevices.ru (Postfix) with ESMTP id 974AC5FD02;
 Mon,  5 Sep 2022 04:09:56 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mail.sberdevices.ru (Postfix) with ESMTP;
 Mon,  5 Sep 2022 04:09:56 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Mon, 5 Sep 2022 04:09:13 +0300
Message-ID: <20220905010913.13640-1-KAMenyaev@sberdevices.ru>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2022/09/04 21:35:00 #20235785
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1662340196;
 bh=wNapp7BciCp9MOaTGNsv/3dpQvT7oxn/uDkwM1+tvEI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=SfiuoaxnB0X54bJXzl4yI4OyQP4FfZxI9M7bGRFMrZhpmAdZbShdVlRWeG1o15vXh
 j/YtW9bfFXjeb01btmwmsYWhWm8qPCy2qgGuBQvaxkTSCpYDUMJpGSHn1StxUBES+p
 tMLUvufUV2d7+Savi+4q9F1lE/KEviEzLqRZogLQGvG0UCqw96C3y18jkSgF1hxjet
 l/Bx8xUiDAPVEpvWBflAnJPYa/mMJ9wOP/y9EoJyhJcjI34uIw8q9xtBaktED1awAg
 G77IC1JywvT25KoAsHFoYsWXwlNkUA/iJn6d0kuu8+RIg5TLet+fVDbe/Bpxp/Xoaz
 dlGmpHa8en55g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=Sfiuoaxn
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: pid path fixed.
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
From: Konstantin Menyaev via buildroot <buildroot@buildroot.org>
Reply-To: KAMenyaev@sberdevices.ru
Cc: John Stile <johns@msli.com>, Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

dhcpcd-9 defaults the run directory to `/var/run/dhcpcd` instead of
`/var/run` and the prefix of dhcpcd has been removed from the files.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
---
 package/dhcpcd/S41dhcpcd      | 2 +-
 package/dhcpcd/dhcpcd.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
index 3e5c22f715..55794f4075 100644
--- a/package/dhcpcd/S41dhcpcd
+++ b/package/dhcpcd/S41dhcpcd
@@ -5,7 +5,7 @@
 
 DAEMON=/sbin/dhcpcd
 CONFIG=/etc/dhcpcd.conf
-PIDFILE=/var/run/dhcpcd.pid
+PIDFILE=/var/run/dhcpcd/pid
 
 [ -f $CONFIG ] || exit 0
 
diff --git a/package/dhcpcd/dhcpcd.service b/package/dhcpcd/dhcpcd.service
index e648092c9b..4da49818a7 100644
--- a/package/dhcpcd/dhcpcd.service
+++ b/package/dhcpcd/dhcpcd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 EnvironmentFile=-/etc/default/dhcpcd
-PIDFile=/run/dhcpcd.pid
+PIDFile=/run/dhcpcd/pid
 ExecStart=/sbin/dhcpcd $DAEMON_ARGS
 Restart=always
 
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
