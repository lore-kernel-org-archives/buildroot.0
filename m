Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB4EC61D85
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 17:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD72361120;
	Tue, 21 Nov 2023 17:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD72361120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsLOprLi1dGN; Tue, 21 Nov 2023 17:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136026111C;
	Tue, 21 Nov 2023 17:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136026111C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA6B11BF5D7
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 17:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B3C4188E
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 17:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B3C4188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0W3xVHCslH3 for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 17:33:23 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86B87417A9
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B87417A9
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5UcgrYs4vclme5UcgrzBnx; Tue, 21 Nov 2023 18:33:19 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 18:33:18 +0100
Message-Id: <20231121173318.724862-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKeNPngiChdi5ShB383HLWiYpA79wEXAO9OnMyY7SFJmqK+xB9nXD1+MECaPa8C+SSJWnJQhGIvDL0ywncgc8Ht3UJiQ+eLyfYh9En0Qql1w7SXVngdJ
 mr1oZ1rb9GTHbaFA5M2HWoACuGbVNIYE87kL3QxvL5BDaRityYE1NlsWUz+ruAjRUECf+ydov4EGCQtqrmEdA+sqwDXHlwsW5JMrf4etZWj/fRBaVDSNtqTM
 fe2APJDzSXyHaH9uAdcNPJAXghU1Ak6qORH1trUZ5mpTqYuo2+WpiuJhCH5wkLEGt3EbdXelmDK1QTHFKD6B5g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700587999; bh=OxKCal5WPC1Va4NppahzltBzwPJrN6ZvTjtAdMn5ywg=;
 h=From:To:Subject:Date:MIME-Version;
 b=T4QJKsaSTAAa48aGgBPRolkt7tuI4vKRhJnFv/v1ZmQEn/K7L0z/FtiKOCsqK3hE+
 lKHVFmdnd0hOSu3/Uzhi/d6R/31UvmpjKA2zZKgRDqueLEA/AKenzbON27nseB59ly
 /Ye04YJsj7l3KDmNf12CjBXM7ICLPspYv1ua8IC6wC/XsQ64jiyDWlk47A1FeXGCfg
 lMG7sxpryqnAZMiepY2loKpdqcWXNcZwkbcVFhMaZvQn7zFRu6/6BSh5LYWKhmDkd6
 bTYHj7MGzLj0Qb0mkeu5AD4WV9X92Lt87jEMnc7J5hFZ0yebxl50uG29anLwTowyzA
 t1qDQUHmmsRBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=T4QJKsaS
Subject: [Buildroot] [PATCH] package/rtl8189es: en/disable runtime debug
 according to BR2_ENABLE_RUNTIME_DEBUG
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index e7bc915c79..658ba41a9f 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -14,6 +14,10 @@ RTL8189ES_MODULE_MAKE_OPTS = \
 	KSRC=$(LINUX_DIR) \
 	USER_EXTRA_CFLAGS="-Wno-error"
 
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+RTL8189ES_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
+endif
+
 define RTL8189ES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
