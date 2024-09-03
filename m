Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69294CD3446
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18053606C6;
	Tue,  3 Sep 2024 16:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN1-Ok4g0aPe; Tue,  3 Sep 2024 16:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E46605C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E46605C6;
	Tue,  3 Sep 2024 16:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53AA91BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D59D4016D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YszjU236ufgt for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:06:12 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Sep 2024 16:06:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A4EF4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4EF4011D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A4EF4011D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:06:10 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MqJuN-1sFya31KpH-00cFtD; Tue, 03 Sep 2024 18:01:04 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 18:00:30 +0200
Message-ID: <20240903160038.19535-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:eVpghfoigmxnOaFHBQBHwEioiagK0vKeo0WKEBPINuO/HAZn930
 hRwIjbeGZ/L/T0Nw6swyLaPysq4XULt4alMO9RJv31Gac2mn0AxIO9z9Yed5aNrBEO8KP0x
 4hNAwkoDOZuepHu/2PYesFUqSM6b4ybaUzR3Du3tkhW4KTlHEXHNOilhrQ/1H+QEckeoTCl
 WfHOEG9H4aca+EEqvJPbw==
UI-OutboundReport: notjunk:1;M01:P0:Po8B3t3X0ig=;iJ3pQdy+ai0XIz6NukT23GfErDm
 fYd5vEnCnuxr0JPT4EGqfQW8CsUUz+Q89xkEuP4GQ4p9uKlAPPpcUh22m4KesRibP5I3PRK87
 4DytCwky8vPyGjsoI3a8IhGF2e0iT0gDX4EsRPFSUOY3V3KBZcqKuw3dRsJRYDEYD0BWgCkqf
 peG/5yj4mxJHvl6cPgXd5lu3/fHw50vRWrBoeUFYiW/wNJJYuSTvvr/6oMBIIw75ovL9sK3j+
 vD4Xmg4VmqJkEnvnk+VtzPoXaXcUgK09wkXTWVkPV8XQ9s6vYCsJviN7kaGwOxJxm09nhJWUJ
 0D+XNOxvR8TZZBny3zeV+aJWZxJbJ4Od1EypU7cVQ/z9RkOZglaWBBpLfPQxUUs540XXCL7Dz
 Uv5X6f7f2C6qoz1EOV/Ay2UfWuLlcCFQ9jtvGgFmArcIFf6w6zocIxpxDAivR1M0PQ8wgkoHw
 OuOhRgiD1RXQZyJrsk40t2Pngoze2brSkm2kBX1puQvXqFTzTLc/y0W6Uycw6Tygd/D21Qt5W
 xIb6zeKCAiZNyGM2tl3Nv+p4LYlf0L6+uEuvXHQ8cCkeiQpgErO/Qm5ry900BOkS/7M4kJFSV
 Ufz7DZ2hDeT7C5/Xn6ubwI0XIW8usSsyIczAe5ZqusGcqDe6WDb060vhANv00lQsGQr/tJwyT
 +W8lg6R0fu22qiMeTpQylO+zdaykEOKCcyaONhWBse2GOVYiLIgQEft35RGBCwySLLxuMVS3S
 SH5TvaeIjYvs0yqzN0/VE3oOS8Il3/u0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: add bluez-alsa to myself
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 570f4ff115..b56b2c8d68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2476,6 +2476,7 @@ F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
+F:	package/bluez-alsa/
 
 N:	Nicolas Serafini <nicolas.serafini@ik.me>
 F:	package/exiv2/
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
