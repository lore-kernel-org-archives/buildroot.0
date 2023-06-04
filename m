Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59877C7EE29
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 22:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9002260AB5;
	Sun,  4 Jun 2023 22:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9002260AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otwlxlpARpUC; Sun,  4 Jun 2023 22:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABCE960A81;
	Sun,  4 Jun 2023 22:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCE960A81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83AFE1BF425
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 22:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5606940133
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 22:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5606940133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlpQX2PxIyUU for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 22:52:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC0A24012D
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC0A24012D
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 22:52:31 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 6B8AF5FD08;
 Mon,  5 Jun 2023 01:52:28 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Mon,  5 Jun 2023 01:52:27 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Mon, 5 Jun 2023 01:52:13 +0300
Message-ID: <20230604225213.2043830-1-KAMenyaev@sberdevices.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/04 18:35:00 #21428560
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1685919148;
 bh=MaMEaXHijQciD/Wp2kMFvLOJu557P3c/idJSBGz7pbo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=f3GuICtL+kePR0NoxpRfSFAR2S/Anv3fAPoAlHylpbmvuocALyyuqX0MTcra9SwgQ
 xyYlAFdSUaY4J/TMUnkVoNLGBRZmaVcp30CJVGBS7iE2rBnPEMUFTw8VBlniFtc2zZ
 t+mJWtjYq4BahHTXb+FV3SYQxmBXjxapXWSM2YIye9Dut9xg0ngIucm/apBSUcBaH6
 ImlPBC87bSBTWiNMadeI0pYnDArFDAo52+VhwjNVTeZuKncrW9vO/5tJawFq4SRCEb
 myB4sMPdabf4lUA0+DjLxKHNUxC2zlvfNM5cT9bXU3WUTUFIogi3uxW6tUsJlhPeHg
 a5S1/rPv46yCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=f3GuICtL
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: make privsep configurable
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
Cc: Konstantin Menyaev <kamenyaev@sberbank.ru>, sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <kamenyaev@sberbank.ru>

Privilege separation mode is undesirable in some use cases.
Let's allow the user to disable it, at least.

Signed-off-by: Konstantin Menyaev <kamenyaev@sberbank.ru>
---
 package/dhcpcd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index 8612d4ba81..6e8881024a 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DHCPCD
 if BR2_PACKAGE_DHCPCD
 
 config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
-	bool
+	bool "Enable privilege separation"
 	default y
 	depends on BR2_USE_MMU
 	# Audit headers were only added in recent kernels for some arches
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
