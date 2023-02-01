Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB41C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 06:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE304177B;
	Wed,  1 Feb 2023 06:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE304177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4fraM3pTA3i; Wed,  1 Feb 2023 06:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 369744175C;
	Wed,  1 Feb 2023 06:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369744175C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7A41BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 06:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B5F080C3B
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 06:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B5F080C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jll_WwNaXQcF for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 06:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61A6812B2
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A61A6812B2
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 06:00:54 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 4050D5FD09;
 Wed,  1 Feb 2023 09:00:52 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Wed,  1 Feb 2023 09:00:51 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Wed, 1 Feb 2023 09:00:01 +0300
Message-ID: <20230201060001.134150-1-KAMenyaev@sberdevices.ru>
X-Mailer: git-send-email 2.39.1
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
 bases: 2023/02/01 03:02:00 #20827053
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1675231252;
 bh=y7j+fJrWUFH+PhGT7Pq2Oevh0FVHcoge1eM5AdqJgug=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=Xq4asBvTYZasiUJiZUXHXoVz3Jk660uEu3AcnxGHFQ8kjlK+rCjZzWv+NURnnyx/o
 p5oqDKCktBUUJdp5N7UUTY/4Mj3U5v6uHCDB9b3t1RWr0Y1jenSuumJltAtQHuHBsf
 AwRusWwNQoxsiDVu5cQ1QyeHKACF86naY+6OuoJ4gunkvPSnTqKQ1vKpik1Qe5YhHr
 YSsem+GTiJCn/YdjLt0PGTUrVZjAKl8eoaObZEp7K6S2PqPWE9RL6yJSsb7m+Uiwa0
 j6T9KQup70rQ0r4S8cBL13CGRpnoQd2LSsPJGuiLNIlU3a36thxXzNyYIkAe60bBoI
 lsqH9drQKAlkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=Xq4asBvT
Subject: [Buildroot] [PATCH 1/1] package/tinyalsa: add option to enable
 utility tools
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
Cc: Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Add option to enable useful tools,
like tinyplay, tinymix, etc.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
---
 package/tinyalsa/Config.in   | 9 +++++++++
 package/tinyalsa/tinyalsa.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/tinyalsa/Config.in b/package/tinyalsa/Config.in
index d9ce22c8a7..b4d4aeb276 100644
--- a/package/tinyalsa/Config.in
+++ b/package/tinyalsa/Config.in
@@ -13,5 +13,14 @@ config BR2_PACKAGE_TINYALSA
 
 	  https://github.com/tinyalsa/tinyalsa
 
+if BR2_PACKAGE_TINYALSA
+
+config BR2_PACKAGE_TINYALSA_TOOLS
+	bool "tinyalsa tools"
+	help
+	  Build utility tools (tinyplay, tinycap, tinymix, tinypcminfo)
+
+endif #BR2_PACKAGE_TINYALSA
+
 comment "tinyalsa needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index b5c39e35d6..fe6d373ec8 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -9,6 +9,12 @@ TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,v$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3-Clause
 TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
-TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled -Dutils=disabled
+TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled
+
+ifeq ($(BR2_PACKAGE_TINYALSA_TOOLS),y)
+TINYALSA_CONF_OPTS += -Dutils=enabled
+else
+TINYALSA_CONF_OPTS += -Dutils=disabled
+endif
 
 $(eval $(meson-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
